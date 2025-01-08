#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
THRESHOLD_LIMIT="5"

While read -r lines
do 
    # USEAGE=$(echo $line | awk "")
    

done >>> $DISK_USAGE
