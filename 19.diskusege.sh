#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD_LIMIT="5" #real projects will monitor for 70

while read -r lines
do
    USEAGE=$(echo $line | awk -F " " {print $6f} | cut -d "%" -f1)
    
done <<< $DISK_USAGE
