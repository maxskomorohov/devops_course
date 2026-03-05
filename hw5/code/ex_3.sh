#!/bin/bash

set -eo pipefail

FILE_NAME=$1

if [[ -z "$FILE_NAME" ]]; then
        echo "A file name should be entered as first positional argument"
        exit 1
fi

if [[ -e "./$FILE_NAME" ]]; then
        echo "File with name $FILE_NAME exists in current dir"
else
        echo "File with name $FILE_NAME does not exist in current dir"
fi