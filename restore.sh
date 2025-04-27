#!/usr/bin/env bash
source "$(dirname "$0")/config.sh"
source "$(dirname "$0")/lib.sh"

cd "$DST_DIR"
arr=( $(ls -1t *.tar.gz 2>/dev/null) )
if [ ${#arr[@]} -eq 0 ]; then
  error "No backups found in $DST_DIR"
fi

echo "Available backups:"
for i in "${!arr[@]}"; do
  echo "  [$i] ${arr[i]}"
done
read -p "Choose index to restore: " idx
archive="${arr[idx]:-}"

[ -f "$archive" ] || error "Invalid selection."

read -p "Restore into (full path): " tgt
mkdir -p "$tgt"
log "Extracting $archive to $tgt"
tar -xzf "$archive" -C "$tgt"
log "Restore complete."
