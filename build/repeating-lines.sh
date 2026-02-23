#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=/dev/null
source "$(dirname "$0")/lines.sh"

FILE=duplicates.txt

ensure_lines "$FILE" 12

# random_fake_lines "$FILE" 12 "$1"

for ((i = 0; i <= 11; i++)); do
    line=$(head -"$i" | tail -1)

    for ((j = -1; j <= "$i"; j++)); do
        echo "$line" >> "$FILE"
    done
done

echo "$1" >> "$FILE"

shuffled=$(shuf "$FILE")
echo "$shuffled" > "$FILE"

echo "Secret is the line which appears the least number of times in $PUZZLE/$FILE."