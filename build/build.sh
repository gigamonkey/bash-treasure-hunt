#!/usr/bin/env bash

#
# Build the scavenger hunt from a set of clue and scripts that hide them. We
# build the puzzle backwards so the script for each step can decide how to hide
# the next clue that leads to the next step and then emit the clue for its step.
# This allows the scripts to generate random data in which to hide the next
# secret and then create their own clue based on where it hid the secret.
#

set -euo pipefail

dir=$(dirname "$0")

rm -f .hashes

readarray -t steps < <(tac "$dir/STEPS")

# The final clue
clue="Extract this last secret and you win!"

rm -rf puzzle
mkdir -p puzzle
cd puzzle

echo -n "Building puzzle "

for step in "${steps[@]}"; do
    # Generate a random secret number for this step of the treasure hunt.
    id=$(printf "%x" "$SRANDOM")

    # Our secret is our secret number but the clue that leads to the next secret
    secret=$(printf "%s: %s" "$id" "$clue")

    # Each step's script hides the clue given to it and then emits its own clue
    # to be hidden by the next script to run which will be for the preceding
    # step of the treasure hunt.
    clue=$("../$dir/$step" "$secret")

    # Stash the hash of our secret number as part of the puzzle to the progress
    # script can tell the player whether they found the secret.
    hash=$(shasum <<< "$id" | cut -c -40)
    echo "$hash" >> .hashes

    # Progress indicator
    echo -n "."
done

echo " done."

# Optionally delete build directory so player can't see how puzzle was built.
