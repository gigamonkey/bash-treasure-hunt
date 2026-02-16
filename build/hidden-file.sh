#!/usr/bin/env bash

set -euo pipefail

LINE=16
FILE=manylines.txt

for ((i = 1; i <= 15; i++)); do
    printf "%s\n" "$(fake_id "$1")" >> "$FILE"
done

encoded=$(echo "$1" | tr 'a-zA-Z' 'n-za-mN-ZA-M')

echo "$encoded" >> "$FILE"

for ((i = 1; i <= 75; i++)); do
    printf "%s\n" "$(fake_id "$1")" >> "$FILE"
done

echo "Secret is line $LINE of the file $PUZZLE/$FILE but it may be coded"
