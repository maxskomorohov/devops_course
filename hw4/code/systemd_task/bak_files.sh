#!/bin/bash

set -euo pipefail

WATCH_DIR="watch"        # Watch dir name to check files
BAK_EXT=".back"          # Desired back-up file extension

USERS_WITH_HOME_DIRS=()
WATCH_FILES=()

# Find all users who have home dirs
mapfile -t USERS_WITH_HOME_DIRS < <(getent passwd | grep -F '/home/' | cut -d: -f1)

# If no users have home dirs, nothing to do
if [[ "${#USERS_WITH_HOME_DIRS[@]}" -eq 0  ]]; then
        exit 0
fi

# For each user who has home dir
for USER in "${USERS_WITH_HOME_DIRS[@]}"; do

        WATCH_PATH="/home/$USER/$WATCH_DIR"

        # If user has a watch dir to check
        if [[ -d "$WATCH_PATH" ]]; then

                # Find all FILES ONLY in this dir and save then as array
                mapfile -t WATCH_FILES < <(find "$WATCH_PATH" -maxdepth 1 -type f -printf '%f\n')

                # For each file in array
                for FILE in "${WATCH_FILES[@]}"; do

                        # Skipping those files that have already been backed up
                        if [[ "$FILE" == *"$BAK_EXT"  ]]; then
                                continue
                        fi

                        # Show file text and back up the file
                        # По таску не зовсім зрозуміло куди саме виводити текст, тому пишу в журнал
                        cat "$WATCH_PATH/$FILE"
                        mv -- "$WATCH_PATH/$FILE" "$WATCH_PATH/$FILE$BAK_EXT"
                done
        fi
done