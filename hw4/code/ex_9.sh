#!/bin/bash

set -euo pipefail

if [[ $# -ne 1 ]]; then
        echo "The file path should be provided as 1st positional argument"
        exit 1
fi

FILE=$1

if [[ ! -f "$FILE" ]]; then
        echo "You should provide a simple file (not dir, device or etc.)"
        exit 1
fi

if [[ ! -s "$FILE"  ]]; then
        echo "The file should not be an empty"
        exit 1
fi

cat "$FILE"
