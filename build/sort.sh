#!/bin/env bash

set -euo pipefail


echo $1

echo "$1" | tr ' ' '\n' | nl | shuf | awk '{ print $1 > "sort-nums.txt"; print $2 > "sort-words.txt" }'

echo "Secret is $PUZZLE/sort-nums.txt with the number at each line replaced with the word at that line number in $PUZZLE/sort-words.txt and spaces replacing the linebreaks"
