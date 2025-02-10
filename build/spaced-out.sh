#!/usr/bin/env bash

set -euo pipefail

S="$1"
FILE=spacing.txt

for ((i = 1; i < ${#S}; i++)); do
    echo -n "__${S:i:1}" >> "$FILE"
done

echo "Secret is made up of every third character of the file $PUZZLE/$FILE"