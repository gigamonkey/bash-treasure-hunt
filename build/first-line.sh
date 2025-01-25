#!/usr/bin/env bash

set -euo pipefail

FILE=lines.txt

real_nth=$(step_secret 'nth-line')
nth_num=$(grep -n "$real_nth" "$FILE" | cut -d : -f 1)

real_last=$(tail -l "$FILE")

tmp=$(mktemp)
tmp2=$(mktemp)

# Get everything but the real last line.
head -n -1 "$FILE" > "$tmp"

# Add our own fake secrets
for ((i = 1; i <= 100; i++)); do
    printf "%s\n" "$(fake_id "$1")" >> "$tmp"
done

# Shuffle again to mix our stuff with what was there before
shuf "$tmp" | grep -v "$real_nth" > "$tmp2"

# And add our own real secret as the first line
echo "$1" > "$FILE"

# Get lines before where the real nth-line secret is supposed to be.
head -n "$((nth_num - 2))" "$tmp2" >> "$FILE"

# Put the real nth-line secret in the right place
echo "$real_nth" >> $FILE

# Put the rest of the lines back
tail -n "+$((nth_num - 1))" "$tmp2" >> "$FILE"

# And finally put back the real last line.
echo "$real_last" >> "$FILE"

echo "The secret is the first line of the file $FILE"
