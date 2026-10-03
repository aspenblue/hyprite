#!/usr/bin/env bash
set -euo pipefail

OLD_BACKUP="~/.config.bak"
OLD_CONFIG="~/.config"
NEW_CONFIG="/etc/skel/.config"

# delete backup if exists
if [[ -d "$OLD_BACKUP" ]]; then
    rm -R "$OLD_BACKUP"
fi

# move old config to backup if exists
if [[ -d "$OLD_CONFIG" ]]; then
    mv "$OLD_CONFIG" "$OLD_BACKUP"
fi

# set new config
cp "$NEW_CONFIG" "$OLD_CONFIG"
