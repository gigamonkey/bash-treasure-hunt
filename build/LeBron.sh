#!/usr/bin/env bash
set -euo pipefail

secret=$1
FILE="LeBronInfo.txt"

# Start fresh
> "$FILE"

for ((i=1; i<=49; i++)); do
  echo "Oh hail the mighty LeBron James, the king of the NBA and greatest basketball player of all time!" >> "$FILE"
done

echo "Oh hail the mighty LeBron${secret}" >> "$FILE"

for ((i=51; i<=100; i++)); do
  echo "Oh hail the mighty LeBron James, the king of the NBA and greatest basketball player of all time!" >> "$FILE"
done

echo "Secret is appended immediately after 'LeBron' on the 50th line of LeBronInfo.txt, with no spaces in between."
