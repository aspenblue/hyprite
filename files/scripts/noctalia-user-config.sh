#!/usr/bin/env bash
set -euo pipefail

OLD_BACKUP=".config/noctalia/config.bak"
OLD_CONFIG=".config/noctalia/config.toml"
NEW_CONFIG="/etc/skel/.config/noctalia/config.toml"

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
