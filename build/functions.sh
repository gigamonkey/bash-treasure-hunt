#!/usr/bin/env bash

#
# Generally useful functions for building the puzzle
#

# Export all these functions
set -a

# Make something that looks synatactically like a secret.
function secretish() {
    printf "%08x: %s" "$SRANDOM" "$1"
}

# A kinda plausible clue about a secret being in a file.
function fake_file_clue() {
    printf "The next secret is in %x.txt" "$SRANDOM"
}

# Take a real clue and replace the id with a new random number
function fake_id() {
    clue="$1"
    secretish "${clue#*: }"
}

# Pick a random file in a directory
function random_file_in() {
    find "$1"  -maxdepth 1 -type f | shuf | head -1
}

# Pick a random file under a directory
function random_file_under() {
    find "$1" --type f | shuf | head -1
}

# Get the secret for an already generated step
function step_secret() {
    awk -v FS=$'\t' -v STEP="$1" '$1 == STEP { print $3; }' .clues
}

# Get a set of randomly generated characters. The first argument is the number
# of characters retuned.
function generate_chars() {
    n="$1"
    chars="${2:-abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789}"
    echo "$chars" | fold -w 1 | shuf -rn "$n" | paste -sd ''
}

# Generate a new sub-directory from a root. First argument is root to generate from.
function get-new-dir() {
    dir="$1/$(generate_chars 3)"
    if mkdir "$dir" 2> /dev/null; then
        echo "$dir"
    else
        get-new-dir "$1"
    fi
}
