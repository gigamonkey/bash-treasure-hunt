#!/usr/bin/env bash

set -euo pipefail

# Secret is the text inside reversed.txt but you guessed it! backwards

cat puzzle/reversed.txt | rev
