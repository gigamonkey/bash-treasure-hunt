#!/usr/bin/env bash

set -euo pipefail

FILE=nth-line-line.txt

touch "$FILE"

tmp=$(mktemp)

echo "$1" > "$tmp"
for ((i = 1; i <= 100; i++)); do
    printf "%s\n" "$(fake_id "$1")" >> "$tmp"
done

shuf "$tmp" > "$FILE"

num=$(grep -n "$1" "$FILE" | cut -d : -f 1)

echo "The secret is line $num of the file $FILE"
