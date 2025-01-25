#!/usr/bin/env bash

set -euo pipefail

LINE=33
FILE=lines.txt

# Fake secrets
for ((i = 1; i <= 32; i++)); do
    printf "%s\n" "$(fake_id "$1")" >> "$FILE"
done

# Real secret
echo "$1" >> "$FILE"

# More fake secrets
for ((i = 1; i <= 67; i++)); do
    printf "%s\n" "$(fake_id "$1")" >> "$FILE"
done

echo "Secret is line $LINE of the file $PUZZLE/$FILE"
