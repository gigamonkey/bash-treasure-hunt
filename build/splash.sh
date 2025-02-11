#!/usr/bin/env bash

set -euo pipefail

dir_name="puddles"
mkdir -p "$dir_name"

for i in {1..10}; do
    file_path="$dir_name/file_$i.txt"
    head -c 100 /dev/urandom | base64 > "$file_path"
done

random_file="$dir_name/file_$((RANDOM % 10 + 1)).txt"
arg="$1"
echo "splash $arg" >> "$random_file"

echo "The clue is in the file in the puddles directory, that contains the word splash in it."
