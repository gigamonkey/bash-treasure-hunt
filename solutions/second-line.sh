#!/usr/bin/env bash

set -euo pipefail

# The secret is in the second line of me.txt

sed -n '2p' puzzle/me.txt
