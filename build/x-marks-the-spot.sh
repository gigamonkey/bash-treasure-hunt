#!/usr/bin/env bash

set -euo pipefail

touch map.txt
touch treasure.txt

len=100 #number of lines
row_len=30
loc="$RANDOM" % len #location of the x
#echo "$loc"

#in ascii, 97-122 (inclusive) are all lowercase letters
#x = 120
function random_lowercase_string(){
    line_length="$1"
    for 
}

for line in {0.."$len"}; do
    if [[ "$line"=="$loc" ]]; then
        #add a ton of letters and x
        #add secret to treasure
       "$1" >> $PUZZLE/treasure.txt
    fi
    else
    #add a random jumble of letters
        random_lowercase_string "$row_len"
    #add secretish to treasure
        secretish >> $PUZZLE/treasure.txt
        #DOES SECRETISH NEED ARGS? IT LOOKS LIKE IT BUT I DON'T KNOW WHICH ONE TO PUT IN
done

echo "The secret is hidden in the same line number of the $PUZZLE/treasure.txt 
that the letter x occurs in the file $PUZZLE/map.txt"