#!/usr/bin/env bash

set -euo pipefail

touch map.txt
touch treasure.txt

#num lines: 100 

loc = "$RANDOM" % 100
echo "$loc"

for line in 100; do
    if [[ $line == loc ]]; then
        #add a ton of letters and x
    fi
    else
    #add a random jumble of letters
done

for line in 100; do
    if [[ $line == loc ]]; then
       #add secret to treasure
    fi
    else #add secretish to treasure
done 

echo "The secret is hidden in the same line number of the $PUZZLE/treasure.txt 
that the letter x occurs in the file $PUZZLE/map.txt"