#!/usr/bin/env bash

set -euo pipefail
key=$(echo superR3ally5ecureP4ssw0rd"$RANDOM" | tr 'a-zA-Z' 'n-za-mN-ZA-M')
#use random to prevent people copying the keys from others, its not actually secure
echo "$key" > $PUZZLE/password


echo "$1" | openssl enc -aes-256-cbc -a -salt -pass pass:"$key" -out encrypted.txt

echo "Secret is encrypted in $PUZZLE/encrypted.txt \n The password is in $PUZZLE/password, but thats obfuscaated too hidden too. Think of the last challenge..."
