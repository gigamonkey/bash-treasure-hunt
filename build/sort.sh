#!/bin/env bash

set -euo pipefail

words="$1"

shufed="$(shuf -e $words)"

echo "$shufed" > sort-words.txt 

echo -n "" > sort-nums.txt

for word in $words; do
    grep -n "$word" sort-words.txt | cut -d: -f1 | head -1 >> sort-nums.txt
done

echo "Secret is $PUZZLE/sort-nums.txt with the number at each line replaced with the word at that line number in $PUZZLE/sort-words.txt and spaces replacing the linebreaks"
