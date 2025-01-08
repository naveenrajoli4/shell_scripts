#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD_LIMIT="5"

while read -r lines
do 
    echo $lines
    # USEAGE=$(echo $line | awk "")
done <<< $DISK_USAGE
