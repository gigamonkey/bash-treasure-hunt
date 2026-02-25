#!/usr/bin/env bash

set -euo pipefail

# Make text file containing random digits
TEXT_LEN=5000
FILE=rabbit-hole.txt
generate_letters $TEXT_LEN > $FILE

# Insert random digits into text
FIRST_DIGIT=$(shuf -i 0-9 -n 1)
FIRST_POS=$(shuf -i 0-$TEXT_LEN -n 1)
echo -n "$FIRST_DIGIT" | dd of="$FILE" bs=1 seek="$FIRST_POS" count=1 conv=notrunc &> /dev/null
SECOND_DIGIT=$(shuf -i 0-9 -n 1)
SECOND_POS=$(shuf -i "$(( FIRST_POS + 1 ))"-$TEXT_LEN -n 1)
echo -n "$SECOND_DIGIT" | dd of="$FILE" bs=1 seek="$SECOND_POS" count=1 conv=notrunc &> /dev/null

# Create directory with files containing fake secret
DIR=rabbit-hole

mkdir -p "$DIR"
touch $DIR/{a..j}{a..j}.txt

for f in $DIR/{a..g}{a..g}.txt; do
    printf "%s\n" "$(fake_id "$1")" > "$f"
done

echo "$1" > "$DIR/$(find $DIR -type f | sed -n $(( FIRST_DIGIT * 10 + SECOND_DIGIT )))"

echo "The secret is hidden in the nth file in puzzle/rabbit-hole where n is the number found by combining the digits found in puzzle/rabbit-hole.txt"