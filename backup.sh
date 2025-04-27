#!/usr/bin/env bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"

mkdir -p "$DST_DIR"
ts=$(date +%Y%m%d_%H%M%S)
base=$(basename "$SRC_DIR")
archive="${DST_DIR}/${base}_${ts}.tar.gz"

log "Creating $archive"
tar -czf "$archive" -C "$(dirname "$SRC_DIR")" "$base"

log "Rotating to last $MAX_BACKUPS"
rotate_backups
log "Backup done."
