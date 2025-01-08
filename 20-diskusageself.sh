#!/bin/bash

DISKS=$(df -hT | grep xfs)
LIMIT=5
MSG=""

while read -r line
do 
    USE=$(echo "$line" | awk -F " " '{print $6F}' | cut -d "%" -f1)
    PART=$(echo "$line" | awk -F " " '{print $NF}')
    # echo "part: $PART , use: $USE"
     if [ $USE -ge $LIMIT ]
     then
        MSG+="High Disk usage on partition: $PART Usage is: $USE \n"
    fi
done <<< $DISKS

echo -e "Message: $MSG"