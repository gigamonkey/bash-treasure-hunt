#!/usr/bin/env bash

#
# Build the scavenger hunt from a set of clue and scripts that hide them. We
# build the puzzle backwards so the script for each step can decide how to hide
# the next clue that leads to the next step and then emit the clue for its step.
# This allows the scripts to generate random data in which to hide the next
# secret and then create their own clue based on where it hid the secret.
#

set -euo pipefail

# We're comparing strings not numbers
# shellcheck disable=SC2072
if [[ ! "$BASH_VERSION" > "5.2" ]]; then
    >&2 echo "Requires bash 5.2 or above. Sorry."
    exit 1
fi


export PUZZLE=puzzle

here=$(pwd)
dir=$(dirname "$0")

# shellcheck source=/dev/null
source "$dir/functions.sh"

# Clean up any old data
rm -f .hashes .ids .clues

readarray -t steps < <(tac "$dir/STEPS")

# The final clue
clue="Extract this last secret and you win!"

rm -rf "$PUZZLE"
mkdir -p "$PUZZLE"
cp "$dir/.keygen-opts" "$PUZZLE"

mkdir "$here/.hints"

cd "$PUZZLE"

echo -n "Building $PUZZLE "

# For mapping hints to steps.
i="${#steps[@]}"

for step in "${steps[@]}"; do

    ((i--)) || true

    # Generate a random secret number for this step of the treasure hunt.
    id=$(printf "%x" "$SRANDOM")

    # Our secret is our secret number but the clue that leads to the next secret
    secret=$(printf "%s: %s" "$id" "$clue")

    # Each step's script hides the clue given to it and then emits its own clue
    # to be hidden by the next script to run which will be for the preceding
    # step of the treasure hunt.
    clue=$("../$dir/$step.sh" "$secret")

    if [[ -z "$clue" ]]; then
        >&2 echo "No clue from $step"
        exit 1
    fi

    # Stash the hash of our secret number as part of the puzzle to the progress
    # script can tell the player whether they found the secret.
    hash=$(sha1sum <<< "$secret" | cut -c -40)
    echo "$hash" >> .hashes

    # Stash the actual id and clue in .ids and .clues for now. We'll use this as
    # the .ids as the password to encrypt the trophy so it can only be unlocked
    # by finding all the secrets. And .clues is useful for scripts that
    echo "$id" >> .ids
    echo -e "$step\t$id\t$secret" >> .clues

    # Copy any hint for step to .hints directory
    step_hint="$here/$dir/$step.txt"
    if [[ -e "$step_hint" ]]; then
        hint=$(printf "%s/.hints/hint-%03d.txt" "$here" "$i")
        cp "$step_hint" "$hint"
    fi

    # Progress indicator
    echo -n "."
done

echo "$clue" > .first-clue

# Make the .trophy
read -ra keygen_opts < ./.keygen-opts
openssl dgst -sha256 -binary <(tac .ids) | \
    openssl enc -salt "${keygen_opts[@]}" -in "${here}/${dir}/trophy.txt" -out .trophy.enc -pass stdin
rm .ids

echo " done."

cd "$here"

# Copy the first script if it doesn't exist.
if [[ ! -e clue-000.sh ]]; then
    cp build/clue-000.sh .
fi
mv "$PUZZLE/README" .

# Optionally delete build directory so player can't see how puzzle was built.
if [[ -d .git ]]; then
    echo "Not deleting $dir because there's a .git directory here."
else
    # Clean up the clues - we keep them around when we're developing
    rm puzzle/.clues

    # And the build directory
    rm -rf "$dir"
fi
