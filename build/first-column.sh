#!/usr/bin/env bash

#paste -d '' <(printf "%-20s\n" "foobar" | fold -w1) <(printf "%-20s\n" "quux" | fold -w1) <(printf "%-20s\n" "barfood" | fold -w1) | perl -ne '/^\s*$/ or print'

set -euo pipefail

FILE=columns.txt

echo "$1" | fold -w1 > "$FILE"

# Add our own fake secrets
for ((i = 1; i <= 40; i++)); do
    tmp=$(mktemp)
    paste -d '' "$FILE" <(printf "%s\n" "$(fake_id "$1" | fold -w1)") > "$tmp"
    mv "$tmp" "$FILE"
done

echo "Secret is in the first column of $FILE"
