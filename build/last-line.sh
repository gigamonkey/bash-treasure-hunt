#!/usr/bin/env bash

set -euo pipefail

FILE=last-line.txt

touch "$FILE"

for ((i = 1; i <= 100; i++)); do
    printf "%s\n" "$(fake_id "$1")" >> "$FILE"
done

echo "$1" >> "$FILE"

echo "The secret is the last line of the file $FILE"
