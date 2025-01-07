#!/bin/bash

SOURCE_DIR=$1
DESTINATION_DIR=$2
DAYS=${3:-14}

LOGS_FOLDER="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%d-%m-%Y-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

if [ $# -lt 2 ] # The expression "Evaluates whether the number of arguments ($#) is less than 2"
then 
    echo "USEAGE: sh script_name <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
    exit 1
fi

mkdir -p /home/ec2-user/shellscript-logs

if [ ! -d $SOURCE_DIR ] # !=-ve, -d=checking the directory($SOURCE_DIR), 
then
    echo "source directory not exist"
    exit 1
else 
    echo "source directory exist"
fi

  #NOTE:- 
  # !=(-ve ) If the condition inside the brackets ([ ]) is true, the ! makes it false, and vice versa.
  # -d $SOURCE_DIR returns true if the path stored in $SOURCE_DIR exists and is a directory.
  # If $SOURCE_DIR does not exist or is not a directory (e.g., a file or symbolic link), it returns false.

if [ ! -d $DESTINATION_DIR ]
then
    echo "destinantion directory not exist"
    exit 1 
else
    echo "destination directory exist"
fi

echo "Script started executing at: $TIMESTAMP"


FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)
#NOTE: -type f =Ensures only regular files are included in the results(ignores directories, symbolic links, etc.).

if [ -n "$FILES" ] 
then 
    echo "Files to zip are:$FILES"
    else
    echo "no files found older than $DAYS days to delete"
    exit 1
fi

ZIP_FILES="$DESTINATION_DIR/backuplogs-$TIMESTAMP.zip"
find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ "$ZIP_FILES"

if [ -f "$ZIP_FILES" ] #The -f operator checks if the specified path is a regular file (not a directory, symlink, or other types of file)
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