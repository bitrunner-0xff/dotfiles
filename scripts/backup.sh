#!/bin/bash

SOURCE_FOLDER="$HOME/Main"
DEST_DIR="/run/media/veracrypt1/backup"
SNAPSHOT_FILE="$DEST_DIR/backup.snar"
BACKUP_NAME="Main_$(date +%Y-%m-%d).tar"


BACKUP_DIR="/run/media/veracrypt1/backup"
RESTORE_DIR="."

if [ "$1" = "-c" ]; then
    echo "Backup process started..."

    tar --create \
        --verbose \
        --verify \
        --file="$DEST_DIR/$BACKUP_NAME" \
        --listed-incremental="$SNAPSHOT_FILE" \
        -C $DEST_DIR "$SOURCE_FOLDER"

    echo "Backup created: $BACKUP_NAME"

elif [ "$1" = "-r" ]; then
    for BACKUP in $(ls "$BACKUP_DIR"/Main_*.tar); do
        echo "Restoring from: $BACKUP"

        tar --extract \
            --verbose \
            --listed-incremental=/dev/null \
            --directory="$RESTORE_DIR" \
            --file="$BACKUP"
    done

    echo "Restore completed in: $RESTORE_DIR"
fi

