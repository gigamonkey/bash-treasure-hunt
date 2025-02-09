#!/usr/bin/env bash

set -euo pipefail

key=tr 'a-zA-Z' 'n-za-mN-ZA-M' < puzzle/password

openssl enc -aes-256-cbc -d -a -salt -pass pass:"$key" -in encrypted.txt
