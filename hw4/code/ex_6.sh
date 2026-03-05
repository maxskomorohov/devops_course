#!/bin/bash

read -p "Please enter your sentence: " TEXT

TEXT_ARR=( "$TEXT" )
REVERSED_TEXT=()

for (( i=(${#TEXT_ARR[@]} - 1) ; i >= 0 ; i-- )); do
        REVERSED_TEXT+=("${TEXT_ARR[$i]}")
done

echo "${REVERSED_TEXT[@]}"