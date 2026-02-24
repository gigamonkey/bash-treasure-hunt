#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=/dev/null
source "$(dirname "$0")/lines.sh"

FILE=duplicates.txt

ensure_lines "$FILE" 12

# random_fake_lines "$FILE" 12 "$1"

for ((i = 1; i <= 12; i++)); do
    line=$(head -"$i" "$FILE" | tail -1)

    for ((j = 0; j <= "$i"; j++)); do
        echo "$line" >> $FILE
    done
done

echo "$1" >> "$FILE"

shuffled=$(shuf "$FILE")
echo "$shuffled" > "$FILE"

echo "Secret is the line which appears the least number of times in $PUZZLE/$FILE."