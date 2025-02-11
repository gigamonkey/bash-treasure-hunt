#!/usr/bin/env bash

set -euo pipefail

file="letters.txt"
realid="SECRET"
min="10"
max="100"
random=$(( $RANDOM % ($max - $min + 1) + $min ))

for ((i = 1; i <= $random; i++)); do
    printf "%s\n" "$(fake_id "$1")$(shuf -en1 {b..z})" >> "$file"
done

echo "$1""a" >> "$file"

for ((i = 1; i <= (( 100-$random-1)); i++)); do
    printf "%s\n" "$(fake_id "$1")$(shuf -en1 {b..z})" >> "$file"
done

echo "Secret is in the first line of $file after being reversed and sorted."