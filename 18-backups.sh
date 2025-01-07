#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}

LOGS_FOLDER="/home/ec2-user/shell_scripts"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%d-%m-%Y-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP"

if [ $# -lt 2 ]
then 
    echo "USEAGE: sh script_name <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then
    echo "destinantion directory not exist"
    exit 1
fi

if [ ! -d $DESTINATION_DIR ]
then
    echo "destinantion directory not exist"
    exit 1   
fi

echo "Script started executing at: $TIMESTAMP"

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -n "$FILES" ] 
then 
    echo "Files to zip are:$FILES"
    else
    echo "no files older than $DAY to delete"
    exit 1
fi

# ZIP_FILES="$DESTINATION_DIR/why-$TIMESTAMP.zip"
# find $SOURCE_DIR -name "*.log" | zip -@ "$ZIP_FILES"

# if [ -f $ZIP_FILES ]
# then 
#     echo "successfully created zip "
# else 
#     echo "zipping error "
#     exit 1
# fi

# while read -r $filesd
# do  
#     echo "deleting files : $filesd" 
#     rm -rf $filesd
#     "echo deleted files: $filesd"
# done <<< $FILES
