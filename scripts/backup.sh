#!/usr/bin/env bash

set -euo pipefail
IFS=$'\n\t'

SOURCE_FOLDER="$HOME/Main"
DEST_DIR="/run/media/veracrypt1/backup"
SNAPSHOT_FILE="$DEST_DIR/backup.snar"
BACKUP_NAME="Main_$(date +%Y-%m-%d).tar"

BACKUP_DIR="/run/media/veracrypt1/backup"
RESTORE_DIR="$HOME"

create() {
  echo "Backup process started..."

  [[ ! -d "$DEST_DIR" ]] && {
    echo "Backup destination not mounted"
    exit 1
  }
  [[ ! -e ~/Main/secrets ]] && mkdir -p ~/Main/secrets

  cp -av ~/.ssh ~/.password-store ~/.gnupg ~/Main/secrets/

  tar --create \
    --verbose \
    --file="$DEST_DIR/$BACKUP_NAME" \
    --listed-incremental="$SNAPSHOT_FILE" \
    -C "$HOME" Main

  if ! tar -tf "$DEST_DIR/$BACKUP_NAME" >/dev/null; then
    echo "Your backup is busted."
    exit 1
  fi

  echo "Backup created: $BACKUP_NAME"
}

restore() {
  echo "Restore process started..."

  BACKUPS=("$BACKUP_DIR"/Main_*.tar)

  for BACKUP in "${BACKUPS[@]}"; do
    echo "Restoring from: $BACKUP"

    tar --extract \
      --verbose \
      --listed-incremental=/dev/null \
      --directory="$RESTORE_DIR" \
      --file="$BACKUP"
  done

  cp -a ~/Main/secrets/. ~/ && rm -rf ~/Main/secrets

  echo "Restore completed in: $RESTORE_DIR"
}

case "$1" in
-c) create ;;
-r) restore ;;
*)
  echo "Usage: $0 -c | -r"
  exit 1
  ;;
esac
