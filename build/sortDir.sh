#!/usr/bin/env bash

set -euo pipefail

FOLDER="sortDirCOlor"
mkdir -p "$FOLDER"

rainbow_colors=("red" "orange" "yellow" "green" "blue" "indigo" "violet") #sets our colors  

total_files=$(((RANDOM % 100 + 1) * 7 )) #picks a random amount of files 

files_per_color=$((TOTAL_FILES / 7 )) #how many files per each color 

for color in "${rainbow_colors[@]}"; do #for every color 
    for ((i=0; i<files_per_color; i++)); do #for every file per color 

        rand_str=$(tr -dc 'a-z0-9' </dev/urandom | head -c 5) #generate random string
        rand_num=$((RANDOM % 3)) #pick a number 0 - 2 

        if [[ $rand_num -eq 0 ]]; then #if 0 color at the start 
            FILENAME="${color}_${rand_str}.txt"
        elif [[ $rand_num -eq 1 ]]; then #if 1 color at the end
            FILENAME="${rand_str}_${color}.txt"
        else # if 2 color in the middle 
            rand_str1=$(tr -dc 'a-z0-9' </dev/urandom | head -c 5) #if the color ends up being in the middle we need another random string 
            FILENAME="${rand_str}_${color}_${rand_str1}.txt"
        fi

        touch "$FOLDER/$FILENAME" #create the file in the directory 
    done
done

echo $PUZZLE/$FOLDER is a directory with some number of files. Each file has in its name one of the colors of the rainbow: red, orange, yellow, green, blue, indigo, and violet

echo "The secret is found by joining the names of the first file found for each color in the rainbow."
