#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD_LIMIT="5" #real projects will monitor for 70

while read -r lines
do
    USEAGE=$(echo $lines | awk -f " " {print $6f} | cut -d "%" -f1)
    PARTITION=$(echo $lines | awk -f " " {print $Nf})
    echo "partion : $PARTITION  uusahe :  $USEAGE "

done <<< $DISK_USAGE
