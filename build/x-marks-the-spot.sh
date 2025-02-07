#!/usr/bin/env bash

set -euo pipefail

touch map.txt
touch treasure.txt


echo "The secret is hidden in the same line number of the $PUZZLE/treasure.txt 
that the letter x occurs in the file $PUZZLE/map.txt"