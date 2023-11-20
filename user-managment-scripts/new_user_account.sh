#!/bin/bash

source create_user_group.sh
source check_existing.sh

#Verify if username argument is passed when initially running the script
if [[ -z "$1" ]]; then
	#Query for username
	read -p "Enter username: " username
	
	#Creating useraccount
	create_user $username
else
	#Creating useraccount
	create_user $1
fi

#Printing current users and space
echo "***** User accounts *****"
#Getting usernames on human made user accounts
#Printing all users and the size of the folder if they exists
echo "***** User accounts *****"
<<<<<<< HEAD
#Getting the usernames with UID between 1000 and 2000
=======
#Getting the usernames witrh UID between 1000 and 2000
>>>>>>> c2979434fa69383cf67b43dba637095f666a658c
userSize=$(getent passwd | awk -F: '{if ($3 >= 1000 && $3 <= 2000) print $1}')

#Sending each username to the check_size function
IFS=$'\n'
for username in $userSize
do
	user_size $username
	echo "----------"
done
