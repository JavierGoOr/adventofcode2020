#!/bin/bash
get_path() {
    COLUMN=0
    SIDESTEP=$1

    while IFS= read -r line
    do
        WIDTH=$(echo "$line" | tr -d '\r\n' | wc -c)
        MAP_POS=$(echo "$line" | cut -c $((COLUMN+1)))
        echo "$MAP_POS"
        ((COLUMN+=SIDESTEP))
        ((COLUMN%=WIDTH))
    done < "${2:-/dev/stdin}"
}

count_trees() {
    echo "$(get_path $1 $2 | grep "#" | wc -l)"
}

PATH_1=$(count_trees 1 input)
PATH_2=$(count_trees 3 input)
PATH_3=$(count_trees 5 input)
PATH_4=$(count_trees 7 input)
PATH_5=$(awk 'NR%2==1' input | count_trees 1)

echo $((PATH_1*PATH_2*PATH_3*PATH_4*PATH_5))
