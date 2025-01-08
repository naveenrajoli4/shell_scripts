#!/bin/bash

DISKS=$(df -ht | grep xfs)
LIMIT=5

while read -r line
do 
    echo "$line"

done <<< $DISKS