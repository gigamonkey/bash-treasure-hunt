#!/usr/bin/env bash

set -euo pipefail
key=$(echo superR3ally5ecureP4ssw0rd"$RANDOM" | tr 'a-zA-Z' 'n-za-mN-ZA-M')
#use random to prevent people copying the keys from others, its not actually secure
echo "$key" > password


echo "$1" | openssl enc -e -aes-256-cbc -a -salt -pbkdf2 -pass $key -out encrypted.txt

echo "Secret is encrypted in $PUZZLE/encrypted.txt Its encrypted with AES-256 in chaining block mode with salt and the key you'll find in $PUZZLE/password, but thats been hidden from you too. Think of the last challenge..."
