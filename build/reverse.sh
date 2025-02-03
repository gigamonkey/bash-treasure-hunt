#!/usr/bin/env bash

set -euo pipefail

file="letters.txt"
fakeid="35e9f8ee: Secret is line 33 of the file puzzle/lines.txt"
realid="SECRET"
min="10"
max="100"
random=$(( $RANDOM % ($max - $min + 1) + $min ))

for ((i = 1; i <= $random; i++)); do
    printf "%s\n" "$fakeid$(shuf -en1 {b..z})" >> "$file"
done

printf "%s\n" ""$realid"a" >> "$file"

for ((i = 1; i <= (( 100-$random-1)); i++)); do
    printf "%s\n" "$fakeid$(shuf -en1 {a..z})" >> "$file"
done

echo "Secret is in the first line of $file after being reversed and sorted."