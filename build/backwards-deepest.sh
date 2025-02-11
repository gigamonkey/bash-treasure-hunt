#!/usr/bin/env bash

# ------
# Made by: grappell
# Functions kept here as they are somewhat specific to my project
# ------

set -euo pipefail

function generate-files() {
    for _ in $(seq 1 "$2"); do
        printf "%s\n" "$(fake_id "$1")" | rev > "$3/$(generate_chars 5).txt"
    done
}

function pick-random-dir() {
    find ./deepest/ -printf '%d/%p\n' | grep -e "$(printf '^%d\/.' $(($1 + 1)))" | shuf | head -1 | cut -d / -f 2-$(($1 + 3))
}

function fill-to-depth() {

    # for ease of use
    local dir="$1"
    local depth="$2"
    local max_depth="$3"
    local secret="$4"

    generate-files "$secret" 5 "$dir"

    if [ "$depth" -lt "$max_depth" ]; then
        for _ in $(seq 1 $((SRANDOM % 10 + 1))); do
            fill-to-depth "$(get-new-dir "$dir")" $((depth + 1)) "$max_depth" "$secret"
        done
    fi
}

# max_depth=$((SRANDOM % 10 + 1)) # fun, but takes FOREVER
max_depth='2'
secret=$(echo "$1" | rev)

mkdir -p ./deepest
fill-to-depth "deepest" 0 $max_depth "$1"

new_dir="$(get-new-dir "$(pick-random-dir $max_depth)")"
echo "$secret" > "$new_dir/$(generate_chars 5).txt"

echo "The hint is in the deepest file in $PUZZLE/deepest, and reversed" 