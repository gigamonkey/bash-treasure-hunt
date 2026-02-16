#!/usr/bin/env bash

#
# Functions for line oriented puzzles that share a lines.txt file.
#

# Export all these functions
set -a

function fake_clue {
    local file="$1"
    case $(($RANDOM % 10)) in
        0) echo "Secret is the first file of $file"
           ;;
        1) echo "Secret is the last file of $file"
           ;;
        2) echo "Secret is the middle file of $file"
           ;;
        *) printf "Secret is line %d of the file puzzle/lines.txt\n" $(($RANDOM % 100))
           ;;
    esac

}

function ensure_lines {
    local file="$1"
    local n="$2"
    if [[ ! -e "$file" ]]; then
        for ((i = 1; i <= "$2"; i++)); do
            clue=$(fake_clue "$file")
            printf "%s\n" "$(secretish "$clue")" >> "$file"
        done
        first_line "$file" > ".shared/$file"
        last_line "$file" >> ".shared/$file"
    fi
}

function first_line {
    # First line of the file
    head -1 "$1"
}

function last_line {
    # Last line of the file
    tail -1 "$1"
}

function nth_line {
    # nth line of file
    sed -n "$2p" "$1"
}

function random_line {
    # Random line but not one that has been used already.
    line=$(comm -23 <(sort "$1") <(sort .shared/"$1" ) | shuf -n 1)
    if [[ -z "$line" ]]; then
        echo "No more unused lines in $1" >&2
        exit 1
    fi
    echo "$line"
}

function line_number {
    # Line number of a line still in the file (so call this before you replace the line)
    perl -ne "/^\Q$2\E$/ and print $., $/" "$1"
}

function replace_line {
    local file="$1"
    local line="$2"
    local secret="$3"
    perl -pi -e 'BEGIN { $line=shift; $secret=shift; } s/^\Q$line\E$/$secret/' "$line" "$secret" "$file"
    echo "$secret" >> ".shared/$file"
}

function random_fake_lines {
    # Replace n random lines with a fake version of our secret.
    local file="$1"
    local n="$2"
    local secret="$3"
    for ((i = 1; i < "$n"; i++)); do
        line=$(random_line "$file")
        replace_line "$file" "$line" "$(fake_id "$secret")"
    done
}
