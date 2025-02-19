#!/usr/bin/env bash

set -euo pipefail

FILE=columns2.txt
INPUT="$1"

touch $FILE
for ((i = 0; i <= 40; i++)); do
    tmp=$(mktemp)
    paste -d '' "$FILE" <(printf "%s\n" "$(fake_id "$1" | fold -w1)") > "$tmp"
    mv "$tmp" "$FILE"
done
for ((i = 0; i <= ${#INPUT}; i++)); do
    CHAR="${INPUT:$i:1}"
    J=$((i+1))
    sed -i "${J}s/$/ $CHAR/" "$FILE"
done


echo "Secret is in the last column of $PUZZLE/$FILE"
