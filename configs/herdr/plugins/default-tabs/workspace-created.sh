#!/bin/sh
set -eu

"$HERDR_BIN_PATH" tab rename "$HERDR_TAB_ID" "agent"

"$HERDR_BIN_PATH" tab create \
 --workspace "$HERDR_WORKSPACE_ID" \
 --label "code" \
 --no-focus

"$HERDR_BIN_PATH" tab create \
 --workspace "$HERDR_WORKSPACE_ID" \
 --label "git" \
 --no-focus
