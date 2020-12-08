#!/bin/bash
while IFS= read -r line
do
  MIN=$(echo "$line" | awk -F'[ \-:]' '{print $1}') 
  MAX=$(echo "$line" | awk -F'[ \-:]' '{print $2}')  
  CHAR=$(echo "$line" | awk -F'[ \-:]' '{print $3}')  
  RESULT=$(echo "$line" | awk -F'[ \-:]' '{print $5}' | grep -o . | grep "$CHAR" | wc -l)
  if [ "$MIN" -le "$RESULT" ] && [ "$RESULT" -le "$MAX" ]
  then
    echo "$line - $RESULT"
  fi
done < input
