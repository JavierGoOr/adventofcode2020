#!/bin/bash
while IFS= read -r line
do
  FIRST_POS=$(echo "$line" | awk -F'[ \-:]' '{print $1}') 
  SECOND_POS=$(echo "$line" | awk -F'[ \-:]' '{print $2}')  
  CHAR=$(echo "$line" | awk -F'[ \-:]' '{print $3}')  
  STRING=$(echo "$line" | awk -F'[ \-:]' '{print $5}')
  FIRST_CHAR=$(echo "$STRING" | cut -c "$FIRST_POS")
  SECOND_CHAR=$(echo "$STRING" | cut -c "$SECOND_POS")
  if [ "$FIRST_CHAR" = "$CHAR" ] || [ "$SECOND_CHAR" = "$CHAR" ]
  then
    if [ "$FIRST_CHAR" != "$SECOND_CHAR" ]
    then
        echo "$line - $RESULT"
    fi
  fi
done < input
