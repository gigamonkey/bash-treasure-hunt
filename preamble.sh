#!/usr/bin/env bash

if [[ -e puzzle ]]; then
    echo "Puzzle already built."
    exit 1;
fi

cat <<EOF | base64 -d | gzip -cd | bash
