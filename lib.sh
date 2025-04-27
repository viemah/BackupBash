#!/usr/bin/env bash
set -euo pipefail

log()   { echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*"; }
error() { log "ERROR: $*" >&2; exit 1; }

# Rotate backups of basename($SRC_DIR)
rotate_backups() {
  local base=$(basename "$SRC_DIR")
  cd "$DST_DIR"
  local arr=( $(ls -1t ${base}_*.tar.gz 2>/dev/null) )
  for ((i=MAX_BACKUPS; i<${#arr[@]}; i++)); do
    log "Removing old: ${arr[i]}"
    rm -f "${arr[i]}"
  done
}
