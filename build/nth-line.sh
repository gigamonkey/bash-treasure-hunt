#!/usr/bin/env bash

set -euo pipefail

FILE=lines.txt

touch "$FILE"

tmp=$(mktemp)

# Real secret
echo "$1" > "$tmp"

# Fake secrets
for ((i = 1; i <= 100; i++)); do
    printf "%s\n" "$(fake_id "$1")" >> "$tmp"
done

shuf "$tmp" > "$FILE"

num=$(grep -n "$1" "$FILE" | cut -d : -f 1)

# Make sure we're not the first line
while [[ "$num" -eq "1" ]]; do
    shuf "$tmp" > "$FILE"
    num=$(grep -n "$1" "$FILE" | cut -d : -f 1)
done

echo "The secret is line $num of the file $FILE"
