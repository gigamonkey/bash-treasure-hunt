#!/usr/bin/env bash

set -euo pipefail

#make the files and directories to store the map and treasure
PIRATE=pirate
mkdir pirate
touch "$PIRATE"/map.txt
touch "$PIRATE"/treasure.txt

len=100 #length of file
row_len=100 #length of row
loc=$(("$RANDOM"%len)) #location of the x

#in ascii, 97-122 (inclusive) are all lowercase letters, x = 120
function random_lowercase_string(){
    string=""
    for ((i=1; i<="row_len"; i++)); do
        num=$(("$RANDOM" % 26 + 97))
        while [[ $num == 120 ]]; do
            num=$(("$RANDOM" % 26 + 97))
        done
        #add the number, converted to an ascii letter, to the string
        string+=$(printf "\\$(printf '%03o' "$num")")
    done
    echo "$string"
}
for ((line=1; line <= "$len"; line++)); do
    if [[ "$line" == "$loc" ]]; then
        #make a jumble of letters, then cut it to put in x at a random position
        string=$(random_lowercase_string "(($row_len-1))")
        position=$(("$RANDOM" % "$row_len"))
        beg_string=$(echo "$string" | cut -b -"$position")
        end_string=$(echo "$string" | cut -b "$position"-)
        new_string="$beg_string""x"""$end_string
        echo "$new_string" >> "$PIRATE"/map.txt
        #add secret to treasure
        echo "$1" >> "$PIRATE"/treasure.txt
    else
        #add a random jumble of letters
        random_lowercase_string "$row_len" >> "$PIRATE"/map.txt
        #add secretish to treasure, doesn't recognize the function
        echo fake_secret >> "$PIRATE"/treasure.txt
        #$(fake_id "$1") >> "$PIRATE"/treasure.txt
    fi
done

echo "The secret is hidden in the same line number of the $PIRATE/treasure.txt that the letter x occurs in the file $PIRATE/map.txt"