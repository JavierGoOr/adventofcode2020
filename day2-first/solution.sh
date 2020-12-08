#!/bin/bash
while IFS= read -r line
do
  REGEX=$(echo "$line" | awk -F'[ \-:]' '{print $3"{"$1","$2"}"}') 
  RESULT=$(echo "$line" | awk -F'[ \-:]' '{print $5}' | grep -E $REGEX)
  if [ ! -z "$RESULT" ]
  then
    echo "$line"
  fi
done < input
