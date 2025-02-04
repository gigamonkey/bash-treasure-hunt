#!/usr/bin/env bash

set -euo pipefail

secret=$1
FILE=LeBronInfo.txt
> "$FILE"

for ((i = 0; i < 49; i++)); do
    printf "Oh hail the mighty LeBron James, the king of the NBA and greatest basketball player of all time!" >> "$FILE"
done 

echo "Oh hail the mighty LeBron James$1" >> "$FILE"

for ((i = 1; i <= 300; i++)); do
    printf "Oh hail the mighty LeBron James, the king of the NBA and greatest basketball player of all time!" >> "$FILE"
done 
echo "Secret follows immediately after the 50th instance of \"LeBron James\" in puzzle/$FILE. There are no seperating spaces."