#!/usr/bin/env bash

set -euo pipefail

# The secret is hidden in the same line number of the pirate/treasure.txt that the letter x occurs in the file pirate/map.txt

sed -n "$(sed -n '/x/=' puzzle/pirate/map.txt)p" puzzle/pirate/treasure.txt
