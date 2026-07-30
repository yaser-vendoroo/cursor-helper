#!/usr/bin/env bash
# Create a Trello list immediately to the right of "Done" (Mode 6 date archive).
# Usage: trello-create-date-list-after-done.sh <boardId> "<list name>"
# Env: TRELLO_API_KEY, TRELLO_API_TOKEN or TRELLO_TOKEN (from .env.e2e.local at repo root).

set -euo pipefail

BOARD_ID="${1:?boardId required}"
LIST_NAME="${2:?list name required}"
LOG_PATH="${DEBUG_LOG_PATH:-/home/yaser/dev/vendoroo/side-projects/cursor-helper/.cursor/debug-c2b8d9.log}"
SESSION_ID="${DEBUG_SESSION_ID:-c2b8d9}"

# #region agent log
log_event() {
  local message="$1"
  local data="$2"
  local hypothesis_id="${3:-H1}"
  local ts
  ts=$(($(date +%s) * 1000))
  printf '%s\n' "{\"sessionId\":\"${SESSION_ID}\",\"timestamp\":${ts},\"location\":\"trello-create-date-list-after-done.sh\",\"message\":\"${message}\",\"data\":${data},\"hypothesisId\":\"${hypothesis_id}\"}" >>"${LOG_PATH}"
}
# #endregion

REPO_ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
ENV_FILE="${REPO_ROOT}/.env.e2e.local"
if [[ -f "${ENV_FILE}" ]]; then
  set -a
  # shellcheck source=/dev/null
  source "${ENV_FILE}"
  set +a
fi

KEY="${TRELLO_API_KEY:-}"
TOKEN="${TRELLO_API_TOKEN:-${TRELLO_TOKEN:-}}"
if [[ -z "${KEY}" || -z "${TOKEN}" ]]; then
  log_event "missing trello credentials" "{\"boardId\":\"${BOARD_ID}\"}" "H1"
  echo "Error: TRELLO_API_KEY and TRELLO_API_TOKEN (or TRELLO_TOKEN) required." >&2
  exit 1
fi

api() {
  curl -sS "$@"
}

LISTS_JSON="$(api "https://api.trello.com/1/boards/${BOARD_ID}/lists?fields=name,pos&key=${KEY}&token=${TOKEN}")"

DONE_POS="$(echo "${LISTS_JSON}" | jq -r '[.[] | select(.name | ascii_downcase == "done")] | .[0].pos // empty')"
DONE_ID="$(echo "${LISTS_JSON}" | jq -r '[.[] | select(.name | ascii_downcase == "done")] | .[0].id // empty')"

if [[ -z "${DONE_POS}" || -z "${DONE_ID}" ]]; then
  log_event "done list not found" "{\"boardId\":\"${BOARD_ID}\"}" "H1"
  echo "Error: Done list not found on board ${BOARD_ID}." >&2
  exit 1
fi

NEXT_POS="$(echo "${LISTS_JSON}" | jq -r --argjson done "${DONE_POS}" '
  [.[] | select(.pos > $done)] | sort_by(.pos) | .[0].pos // empty
')"

if [[ -n "${NEXT_POS}" ]]; then
  NEW_POS="$(echo "${DONE_POS} ${NEXT_POS}" | awk '{printf "%.10f", ($1 + $2) / 2}')"
else
  NEW_POS="$(echo "${DONE_POS}" | awk '{printf "%.10f", $1 + 65536}')"
fi

log_event "computed list position" "{\"donePos\":${DONE_POS},\"nextPos\":\"${NEXT_POS:-none}\",\"newPos\":${NEW_POS},\"listName\":\"${LIST_NAME}\"}" "H1"

CREATE_JSON="$(api -X POST "https://api.trello.com/1/lists" \
  --data-urlencode "name=${LIST_NAME}" \
  --data-urlencode "idBoard=${BOARD_ID}" \
  --data-urlencode "pos=${NEW_POS}" \
  --data-urlencode "key=${KEY}" \
  --data-urlencode "token=${TOKEN}")"

NEW_LIST_ID="$(echo "${CREATE_JSON}" | jq -r '.id // empty')"
if [[ -z "${NEW_LIST_ID}" ]]; then
  log_event "create list failed" "{\"response\":$(echo "${CREATE_JSON}" | jq -c .)}" "H1"
  echo "Error: failed to create list." >&2
  echo "${CREATE_JSON}" >&2
  exit 1
fi

VERIFY_JSON="$(api "https://api.trello.com/1/boards/${BOARD_ID}/lists?fields=name,pos&key=${KEY}&token=${TOKEN}")"
DONE_INDEX="$(echo "${VERIFY_JSON}" | jq -r 'sort_by(.pos) | to_entries | map(select(.value.name | ascii_downcase == "done")) | .[0].key')"
NEW_INDEX="$(echo "${VERIFY_JSON}" | jq -r --arg id "${NEW_LIST_ID}" 'sort_by(.pos) | to_entries | map(select(.value.id == $id)) | .[0].key')"

POSITION_OK="false"
if [[ -n "${DONE_INDEX}" && -n "${NEW_INDEX}" && "$((NEW_INDEX))" -eq "$((DONE_INDEX + 1))" ]]; then
  POSITION_OK="true"
fi

if [[ "${POSITION_OK}" != "true" ]]; then
  log_event "position verify failed retrying put" "{\"doneIndex\":${DONE_INDEX},\"newIndex\":${NEW_INDEX},\"newListId\":\"${NEW_LIST_ID}\"}" "H2"
  api -X PUT "https://api.trello.com/1/lists/${NEW_LIST_ID}" \
    --data-urlencode "pos=${NEW_POS}" \
    --data-urlencode "key=${KEY}" \
    --data-urlencode "token=${TOKEN}" >/dev/null
  VERIFY_JSON="$(api "https://api.trello.com/1/boards/${BOARD_ID}/lists?fields=name,pos&key=${KEY}&token=${TOKEN}")"
  DONE_INDEX="$(echo "${VERIFY_JSON}" | jq -r 'sort_by(.pos) | to_entries | map(select(.value.name | ascii_downcase == "done")) | .[0].key')"
  NEW_INDEX="$(echo "${VERIFY_JSON}" | jq -r --arg id "${NEW_LIST_ID}" 'sort_by(.pos) | to_entries | map(select(.value.id == $id)) | .[0].key')"
  if [[ -n "${DONE_INDEX}" && -n "${NEW_INDEX}" && "$((NEW_INDEX))" -eq "$((DONE_INDEX + 1))" ]]; then
    POSITION_OK="true"
  fi
fi

log_event "create list complete" "{\"newListId\":\"${NEW_LIST_ID}\",\"positionOk\":${POSITION_OK},\"doneIndex\":${DONE_INDEX},\"newIndex\":${NEW_INDEX}}" "H1"

echo "${NEW_LIST_ID}"
if [[ "${POSITION_OK}" != "true" ]]; then
  echo "Warning: list created but position could not be verified immediately after Done." >&2
  exit 2
fi
