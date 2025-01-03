#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
NORMAL="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo -e "ERROR:: You must have $RED sudo access to execute this script $NORMAL"
    exit 1 #other than 0
fi

dnf list installed mysql

if [ $? -ne 0 ]
then # not installed
    dnf install mysql -y
    if [ $? -ne 0 ]
    then
        echo "Installing MySQL ... FAILURE"
        exit 1
    else
        echo -e "Installing MySQL ...$GREEN SUCCESS $NORMAL"
    fi
else
    echo -e "MySQL is already ...$GREEN INSTALLED $NORMAL"
fi

systemctl enable mysqld

if [ $? -ne 0 ]
then # not installed
    echo "enable mysqld ... FAILURE"
    exit 1    
else
    echo -e "enable mysqld ...$GREEN INSTALLED $NORMAL"
fi

systemctl start mysqld

if [ $? -ne 0 ]
then # not installed
    echo "start mysqld ... FAILURE"
    exit 1    
else
    echo -e "start mysqld ...$GREEN INSTALLED $NORMAL"
fi



# if [ $? -ne 0 ]
# then
#     echo "Installing MySQL ... FAILURE"
#     exit 1
# else
#     echo "Installing MySQL ... SUCCESS"
# fi