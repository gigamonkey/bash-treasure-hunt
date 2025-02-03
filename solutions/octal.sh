#!/usr/bin/env bash

set -euo pipefail

# Secret has been dumped into $PUZZLE/octal.txt. Who knows how to decode it? Maybe ask the chinese...

od -c puzzle/octal.txt