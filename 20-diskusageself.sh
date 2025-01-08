#!/bin/bash

DISKS=$(df -hT | grep xfs)
LIMIT=5

while read -r line
do 
    echo "$line"

done <<< $DISKS