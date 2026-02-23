#!/usr/bin/env bash

set -euo pipefail

cmd puzzle/duplicates.txt | uniq -c | sort -r | head -1 