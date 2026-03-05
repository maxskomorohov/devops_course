#!/bin/bash

FILE_PATH=$1

if [[ -z "$FILE_PATH" ]]; then
        echo "You should provide path to file as first positional argument"
        exit 1
fi

if [[ $# != 1 ]]; then
        echo "You can only provide one file path at a time"
        exit 1
fi

if [[ ! -f "$FILE_PATH" ]]; then
        echo "You should provide a path to file (not dir, device, etc)"
        exit 1
fi

echo "The number of lines in file $FILE_PATH equals to: $(cat "$FILE_PATH" | wc -l)"