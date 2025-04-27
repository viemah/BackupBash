#!/usr/bin/env bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"
log "Rotating to last $MAX_BACKUPS"
rotate_backups
log "Rotation done."
