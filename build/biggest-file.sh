#!/usr/bin/env bash

set -euo pipefail

DIR=sizes

biggest_size=0
biggest_file=

for f in $DIR/{foo,bar,baz}/{fred,wilma,barney,betty}/{a..g}.txt; do
    mkdir -p "$(dirname "$f")"
    size=$(( RANDOM % 256 ))
    if [[ "$size" -ge "$biggest_size" ]]; then
        if [[ "$size" -eq "$biggest_size" ]]; then
            size=$((size + 1))
        fi
        biggest_size=$size
        biggest_file=$f
    fi
    (yes || true) | head -n "$size" | tr -d '\n' > "$f"
done

echo -e "\n$1" >> "$biggest_file"

echo "Secret is the last line of the biggest file in $PUZZLE/$DIR"
