#!/bin/bash

DISKS=$(df -hT | grep xfs)
LIMIT=5

while read -r line
do 
    USE=$(echo "$line" | awk -F " " '{print $6F}')
    PART=$(echo "$line" | awk -F " " '{print $NF}')
    echo "use $USE , part: $PART"

done <<< $DISKS