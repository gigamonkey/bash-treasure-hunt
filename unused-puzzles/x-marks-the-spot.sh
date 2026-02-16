#!/usr/bin/env bash

set -euo pipefail

#make the files and directories to store the map and treasure
PIRATE=pirate
mkdir pirate
touch "$PIRATE"/map.txt
touch "$PIRATE"/treasure.txt

alphabet=$(echo {a..z} | tr -d ' ')
no_x=$(echo "$alphabet" | tr -d 'x')

len=100 #length of file
row_len=100 #length of row
loc=$(("$RANDOM"%len)) #location of the x

for ((line=1; line <= "$len"; line++)); do
    if [[ "$line" == "$loc" ]]; then
        #make a jumble of letters, then cut it to put in x at a random position
        string=$(generate_chars "$row_len" "$no_x")
        position=$(("$RANDOM" % "$row_len"))
        beg_string=$(echo "$string" | cut -b -"$position")
        end_string=$(echo "$string" | cut -b "$position"-)
        new_string="${beg_string}x${end_string}"
        echo "$new_string" >> "$PIRATE"/map.txt
        #add secret to treasure
        echo "$1" >> "$PIRATE"/treasure.txt
    else
        #add a random jumble of letters
        generate_chars "$row_len" "$no_x" >> "$PIRATE"/map.txt
        #add secretish to treasure
        printf '%s\n' "$(fake_id "$1")" >> "$PIRATE"/treasure.txt
    fi
done

echo "The secret is hidden in the same line number of the $PIRATE/treasure.txt that the letter x occurs in the file $PIRATE/map.txt"
