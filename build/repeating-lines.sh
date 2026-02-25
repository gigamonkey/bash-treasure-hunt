#!/usr/bin/env bash

set -euo pipefail

# shellcheck source=/dev/null

FILE=duplicates.txt

for ((i = 2; i <= 12; i++)); do
    line=$(fake_id "$1")

    for ((j = 0; j < "$i"; j++)); do
        echo "$line" >> $FILE
    done
done

echo "$1" >> $FILE

shuffled=$(shuf "$FILE")
echo "$shuffled" > "$FILE"

echo "Secret is the line which appears the least number of times in $PUZZLE/$FILE."