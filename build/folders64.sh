#!/usr/bin/env bash

# Save the secret we are given into a super secret 
set -euo pipefail

str="$(echo "$1" | base64 -w 0)"
start="${str:0:1}"
mkdir folders
cd folders
for ((i = 0; i < ${#str}; i++)); do
    char="${str:i:1}"
    mkdir "$char"
    cd "$char" || exit 1
done

# Print the clue that will be given to the user.
echo "The next secret is encoded in the names of directories starting with /folders"