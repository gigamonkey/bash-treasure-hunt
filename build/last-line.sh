#!/usr/bin/env bash

set -euo pipefail

FILE=lines.txt

real_nth=$(step_secret 'nth-line')
nth_num=$(grep -n "$real_nth" "$FILE" | cut -d : -f 1)

tmp=$(mktemp)
tmp2=$(mktemp)

cp "$FILE" "$tmp"

# Add our own fake secrets
for ((i = 1; i <= 100; i++)); do
    printf "%s\n" "$(fake_id "$1")" >> "$tmp"
done

# Shuffle again to mix our stuff with
shuf "$tmp" | grep -v "$real_nth" > "$tmp2"

# Get lines before where the real nth-line secret is supposed to be.
head -n "$((nth_num - 1))" "$tmp2" > "$FILE"

# Put the real nth-line secret in the right place
echo "$real_nth" >> $FILE

# Put the rest of the lines back
tail -n "+$((nth_num + 1))" "$tmp2" >> "$FILE"

# And add our own real secret as the last line
echo "$1" >> "$FILE"

echo "The secret is the last line of the file $FILE"
