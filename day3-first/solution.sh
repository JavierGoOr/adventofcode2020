#!/bin/bash
#
#To get the solution for day3-first, you should execute: 
#./solution.sh | grep "#" | wc -l
COLUMN=0
SIDESTEP=3

while IFS= read -r line
do
    WIDTH=$(echo "$line" | tr -d '\r\n' | wc -c)
    MAP_POS=$(echo "$line" | cut -c $((COLUMN+1)))
    echo "$MAP_POS"
    ((COLUMN+=SIDESTEP))
    ((COLUMN%=WIDTH))
done < input
