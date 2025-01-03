#!/bin/bash

file1=08-conditions.sh
file2=09-installingapp.sh

echo "creating fail1 and fail2"
touch $file1 $file2

if []
then
    echo "files&2 was failure"
else 
    echo " $file1 and $file2 was successfuly completed"
fi       