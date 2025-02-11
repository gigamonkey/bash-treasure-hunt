#!/usr/bin/env bash

set -euo pipefail

FILE=columns2.txt
INPUT="$1"

touch $FILE
for ((i = 1; i <= 40; i++)); do
    tmp=$(mktemp)
    paste -d '' "$FILE" <(printf "%s\n" "$(fake_id "$1" | fold -w1)") > "$tmp"
    mv "$tmp" "$FILE"
done

paste -d '' "$FILE" <(echo "$INPUT" | fold -w1) > "$tmp"

echo "Secret is in the last column of $PUZZLE/$FILE"
