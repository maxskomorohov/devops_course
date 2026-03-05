#!/bin/bash

set -euo pipefail

FRUITS=()

while true; do
        read -p "Please enter the fruit name to add fruits or enter 'quit' and ENTER to stop: " FRUIT_NAME

        if [[ -z "$FRUIT_NAME" ]]; then
                continue
        fi

        if [[ "$FRUIT_NAME" == "quit" ]]; then
                break
        fi

        FRUITS+=("$FRUIT_NAME")
done

for FRUIT in "${FRUITS[@]}"; do
        echo "$FRUIT"
done