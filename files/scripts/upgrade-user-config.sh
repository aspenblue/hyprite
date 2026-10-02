#!/usr/bin/env bash
set -euo pipefail

OLD_BACKUP="$1"
OLD_CONFIG="$2"
NEW_CONFIG="$3"

for DIR in /home/*/; do
    # skip if not folder
    [[ -d "$DIR" ]] || continue

    echo "Processing $DIR"

    # delete backup if exists
    if [[ -f "$DIR$OLD_BACKUP" ]]; then
        rm -f "$DIR$OLD_BACKUP"
    fi

    # move old config to backup if exists
    if [[ -f "$DIR$OLD_CONFIG" ]]; then
        mv "$DIR$OLD_CONFIG" "$DIR$OLD_BACKUP"
    fi

    # set new config
    cp "$NEW_CONFIG" "$DIR$OLD_CONFIG"

done