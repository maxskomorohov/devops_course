#!/bin/bash

set -euo pipefail

if [[ $# -ne 2 ]]; then
        echo -e "You should provide 2 positional arguments: 1 - FROM_PATH, 2 - TO_PATH"
        exit 1
fi

FROM_PATH=$1
TO_PATH=$2

if [[ ! -e "$FROM_PATH" ]]; then
        echo "The file with path '$FROM_PATH' does not exist"
        exit 1
fi

cp -- "$FROM_PATH" "$TO_PATH"