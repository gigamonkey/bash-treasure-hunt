#!/usr/bin/env bash

#
# Build the scavenger hunt from a set of clue and scripts that hide them. We
# build the puzzle backwards so the script for each step can decide how to hide
# the next clue and then emit the clue for its step. This allows the scripts to
# generate random data or whatever and then create the clue based on where it
# hid the secret.
#

set -euo pipefail
shopt -s lastpipe

dir=$(dirname "$0")

rm -f .hashes

readarray -t steps < <(tac "$dir/STEPS")

# The final clue
clue="Extract this last secret and you win!"

rm -rf puzzle
mkdir -p puzzle
cd puzzle

for step in "${steps[@]}"; do
    # Generate a random secret number for this step of the treasure hunt.
    id=$(printf "%x" "$SRANDOM")

    # Our secret is our secret number but the clue that leads to the next secret
    secret=$(printf "%s: %s" "$id" "$clue")

    # Script hide the clue given to it and emit its own clue to be hidden by the
    # next script to run which will be for the preceding step of the treasure
    # hunt.
    clue=$("../$dir/$step" "$secret")

    # Stash the hash of our secret number as part of the puzzle to the progress
    # script can tell the player whether they found the secret.
    hash=$(shasum <<< "$id" | cut -c -40)
    echo "$hash" >> .hashes

    printf "clue: %s; id: %s; hash: %s\n" "$clue" "$id" "$hash"
done
