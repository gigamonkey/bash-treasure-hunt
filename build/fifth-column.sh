#!/usr/bin/env bash

set -euo pipefail

FILE=columns.txt

#echo "$1" | fold -w1 > "$FILE"

# Add our own fake secrets
for ((i = 1; i <= 4; i++)); do
    tmp=$(mktemp)
    paste -d '' "$FILE" <(printf "%s\n" "$(fake_id "$1" | fold -w1)") > "$tmp"
    mv "$tmp" "$FILE"
done

echo "$1" | paste -d '' "$FILE"

for ((i = 1; i <= 10; i++)); do
    tmp=$(mktemp)
    paste -d '' "$FILE" <(printf "%s\n" "$(fake_id "$1" | fold -w1)") > "$tmp"
    mv "$tmp" "$FILE"
done

echo "Secret is in the fifth column of $PUZZLE/$FILE"
