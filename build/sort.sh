#!/bin/env bash

set -euo pipefail

words="$1"

shufed="$(shuf -e $words)"

echo -n "" > sort-words.txt

for word in $shufed; do
    echo "$word" >> sort-words.txt
done

echo -n "" > sort-nums.txt

for word in $words; do
    i=1
    for other in $shufed; do
        if [ "$word" = "$other" ]; then 
            break
        fi
        i=$((i + 1))
    done
    echo "$i" >> sort-nums.txt
done

echo "Secret is $PUZZLE/sort-nums.txt with the number at each line replaced with the word at that line number in $PUZZLE/sort-words.txt and spaces replacing the linebreaks"
