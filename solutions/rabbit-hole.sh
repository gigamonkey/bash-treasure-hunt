#!/usr/bin/env bash

set -euo pipefail

cat "$(find puzzle/rabbit-hole -type f | sed -n "$(tr -cd '[:digit:]' < puzzle/rabbit-hole.txt)p")"