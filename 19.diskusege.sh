#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD_LIMIT="5" #real projects will monitor for 70

while read -r lines
do
    USEAGE=$(echo $line | awk -F " " {print $6f} | cut -d "%" -f1)
    PARTITION=$(echo $line | awk -F " " {print $Nf})
    echo "partion : $PARTITION  uusahe :  $USEAGE "

done <<< $DISK_USAGE
