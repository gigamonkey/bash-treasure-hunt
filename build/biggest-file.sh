#!/usr/bin/env bash

set -euo pipefail

DIR=sizes

biggest_size=0
biggest_file=

printf -v bigtext "x%.0s" {1..256}

for d in $DIR/{foo,bar,baz}/{fred,wilma,barney,betty}; do
    mkdir -p "$d"
done

while read -r -d '' d; do
    for f in "$d/"{a..g}.txt; do
        size=$(( RANDOM % 256 ))
        if [[ "$size" -ge "$biggest_size" ]]; then
            if [[ "$size" -eq "$biggest_size" ]]; then
                size=$((size + 1))
            fi
            biggest_size=$size
            biggest_file=$f
        fi
        echo -n "${bigtext:0:$size}" > "$f"
    done
done < <(find "$DIR" -type d -print0)

echo -e "\n$1" >> "$biggest_file"

echo "Secret is the last line of the biggest file in $PUZZLE/$DIR"
