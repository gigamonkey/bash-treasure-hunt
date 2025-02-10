#!/usr/bin/env bash

set -euo pipefail

FOLDER="sortDirCOlor"
mkdir -p "$FOLDER"
SECRET=$1

part_length=$(( ${#SECRET} / 7 ))
remainder=$(( ${#SECRET} % 7 ))

declare -a parts=()
for ((i = 0; i < 7; i++)); do
    if (( i == 6 )); then
        parts[$i]="${SECRET:$((i * part_length))}" 
    else
        parts[$i]="${SECRET:$((i * part_length)):part_length}"
    fi
done

rainbow_colors=("red" "orange" "yellow" "green" "blue" "indigo" "violet") #sets our colors  

total_files=$(( (RANDOM % 100 + 1) * 7 )) #picks a random amount of files 

files_per_color=$((total_files / 7 )) #how many files per each color 

count=0

for color in "${rainbow_colors[@]}"; do #for every color 
    first_file_created=false
    for ((i= 0; i<files_per_color; i++)); do #for every file per color 
        if [[ $first_file_created == false ]]; then
            FILENAME="${color}_${parts[$count]}.txt"
            touch "$FOLDER/$FILENAME"
            first_file_created=true
            ((count++))
        else
        
            rand_str=$(tr -dc 'a-z0-9' </dev/urandom | head -c 5) #generate random string
            rand_num=$(( RANDOM % 3 )) #pick a number 0 - 2 

            if [[ $rand_num -eq 0 ]]; then #if 0 color at the start 
                FILENAME="${color}_${rand_str}.txt"
            elif [[ $rand_num -eq 1 ]]; then #if 1 color at the end
                FILENAME="${rand_str}_${color}.txt"
            else # if 2 color in the middle 
                rand_str1=$(tr -dc 'a-z0-9' </dev/urandom | head -c 5) #if the color ends up being in the middle we need another random string 
                FILENAME="${rand_str}_${color}_${rand_str1}.txt"
            fi
        
            touch "$FOLDER/$FILENAME" #create the file in the directory 
        fi
    done
done


echo $PUZZLE/$FOLDER is a directory with some number of files. Each file has in its name one of the colors of the rainbow: red, orange, yellow, green, blue, indigo, and violet

echo "The secret is found by joining the names of the first file found for each color in the rainbow."
