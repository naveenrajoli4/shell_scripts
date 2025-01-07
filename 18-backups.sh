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
    echo "source directory not exist"
    exit 1
else 
    echo "source directory exist"
fi

if [ ! -d $DESTINATION_DIR ]
then
    echo "destinantion directory not exist"
    exit 1 
else
    echo "destination directory exist"
fi

echo "Script started executing at: $TIMESTAMP"

dnf list installed zip
if [ $? -ne 0 ]
then
    dnf install zip -y
    if [ $? -ne 0 ]
    then        
        echo "installing zip faillure"
        exit 1
    else
        echo "zip installing success"
    fi
else
    echo "ZIP is allready installed "

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ -n "$FILES" ] 
then 
    echo "Files to zip are:$FILES"
    else
    echo "no files older than $DAYS to delete"
    exit 1
fi

ZIP_FILES="$DESTINATION_DIR/sorc_01-$TIMESTAMP.zip"
find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILES"

if [ -f "$ZIP_FILES" ]
then 
    echo "Successfully created zip file for files older than $DAYS"
else 
    echo "zipping error"
    exit 1
fi

while read -r filepath # here filepath is the variable name, you can give any name
do
    echo "Deleting file: $filepath" &>>$LOG_FILE_NAME
    rm -rf $filepath
    echo "Deleted file: $filepath"
done <<< $FILES