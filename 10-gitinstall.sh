#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "you should be a root user to run this command"
    exit 1
else 
    echo "root user successfully verified"
fi    

dnf list installed git 

if [ $? -ne 0 ]
then
    dnf install git -y
    if [ $? -ne 0]
    then # not installed
        echo "installing git is failure"
        exit 1
    else
        echo "installing git is success"
    fi
    
else 
    echo "git is already installed"
fi


# if [ $? -ne 0 ]
# then
#     echo "Installing Git ... FAILURE"
#     exit 1
# else
#     echo "Installing Git ... SUCCESS"
# fi