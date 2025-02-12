#!/usr/bin/env bash

set -euo pipefail

FOLDER="sortDirCOlor"
mkdir -p "$FOLDER"
SECRET=$1

part_length=$(( ${#SECRET} / 7 ))

# Create an array to hold the parts
for i in {0..6}; do
  start=$((i * part_length))
  if [ $i -eq 6 ]; then
    # For the last part, take the rest of the string
    part="${SECRET:start}"
  else
    part="${SECRET:start:part_length}"
  fi
  array[$i]="$part"
done
 
rainbow_colors=("red" "orange" "yellow" "green" "blue" "indigo" "violet") #sets our colors  

part_count=0
for color in "${rainbow_colors[@]}"; do #for every color 

  rand_str=$(tr -dc 'a-z0-9' </dev/urandom | head -c 5) || true #generate random string
  FILENAME="${color}_${rand_str}_${array["$part_count"]}.txt"
  ((part_count++))
  touch "$FOLDER/$FILENAME" #create the file in the directory 
done


#echo $PUZZLE/$FOLDER is a directory with some number of files. Each file has in its name one of the colors of the rainbow: red, orange, yellow, green, blue, indigo, and violet

echo "The secret is found by joining the names of the first file found for each color in the rainbow."


