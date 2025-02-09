#!/usr/bin/env bash

set -euo pipefail

PIRATE=pirate
mkdir pirate

touch "$PIRATE"/map.txt
touch "$PIRATE"/treasure.txt

len=100 #number of lines
row_len=100
loc=$(("$RANDOM"%len)) #location of the x
#echo "$loc"

#in ascii, 97-122 (inclusive) are all lowercase letters
#x = 120
function random_lowercase_string(){
    string=""
    for ((i=1; i<="row_len"; i++)); do
        num=$(("$RANDOM" % 26 + 97))
        while [[ $num == 120 ]]; do
            num=$(("$RANDOM" % 26 + 97))
        done
        #ascii not working
        string+=$(printf "\\$(printf '%03o' "$num")")
    done
    echo "$string"
}
echo "$loc"
for ((line=1; line <= "$len"; line++)); do
    if [[ "$line" == "$loc" ]]; then
        #add a ton of letters and x
        string=$(random_lowercase_string "(($row_len-1))")
        position=$(("$RANDOM" % "$row_len"))
        #new_string splitting not recognized
        #new_string="{$string:0:$position}{'x'}{$string:$position}"
        beg_string=$(echo "$string" | cut -b -"$position")
        end_string=$(echo "$string" | cut -b "$position"-)
        new_string="$beg_string""x"""$end_string
        echo "$new_string" >> "$PIRATE"/map.txt
        #add secret to treasure
        echo "$1" >> "$PIRATE"/treasure.txt
    else
        #add a random jumble of letters, working
        random_lowercase_string "$row_len" >> "$PIRATE"/map.txt
        #add secretish to treasure, doesn't recognize the function
        echo $(fake_id "$1") >> "$PIRATE"/treasure.txt
    fi
done


echo "The secret is hidden in the same line number of the $PIRATE/treasure.txt that the letter x occurs in the file $PIRATE/map.txt"