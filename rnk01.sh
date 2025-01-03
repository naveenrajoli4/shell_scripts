#!/bin/bash

USERID=(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if ( $USERID -ne 0)
then
    echo "$R You should a root user to run this script $N "
    exit 1
fi

dnf list install 
if ( $? -ne 0)
then 
    dnf install mysql-server -y
    if ( $? -ne 0 )
    then
        echo "$R Inatalling mysql...failure $N "
    else
        echo " $G Installing mysql...SUCCESS $N"
    fi
else
    echo " $Y MYSQL is already installed $N"

systemctl enable mysqld
if ( $? -ne 0 )
then 
    echo "$R mysql enable...failure $N "
else
    echo " $G mysql enable....SUCCESS $N"
fi

systemctl start mysqld
if ( $? -ne 0 )
then 
    echo "$R mysql start...failure $N "
else
    echo " $G mysql start....SUCCESS $N"
fi