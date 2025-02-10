#!/usr/bin/env bash

set -euo pipefail

FILE=columns2.txt

for ((i = 1; i <= ${#$1}; i++)); do
    tmp=$(mktemp)
    paste -d '' "$FILE" <(printf "%s\n" "$(fake_id "$1" | fold -w1)$("$1" | fold -w1)") > "$tmp" #adds 1 character of secret to end of line 
    mv "$tmp" "$FILE"
done

echo echo "Secret is in the last column of $PUZZLE/$FILE"
