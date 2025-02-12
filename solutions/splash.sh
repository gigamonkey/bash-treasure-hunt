#!/usr/bin/env bash

set -euo pipefail

# The clue is in the file in the puddles directory, that contains the word splash in it.

sed -n '/^splash /{s/splash //;p}' puzzle/puddles/*
