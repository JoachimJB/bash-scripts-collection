#Scripted by Joachim Jamtvedt Børresen octrober 2022. Student ID: 117423
#!/bin/bash

#Function to display current stafflist
query_staff(){
	sudo mysql -D supertenter -e "SELECT ID, Username, Fullname, Email, Usergroups FROM staff"
}

#Function to add useraccount to DB.
#Args username, fullname, email and Usergroups
query_add_useraccount(){
	sudo mysql -D supertenter -e "INSERT INTO staff VALUES(NULL, '$1', '$2', '$3', '$4')"
}

#Function to remove useraccount from DB. Args username
query_del_useraccount(){
	sudo mysql -D supertenter -e "DELETE FROM staff WHERE Username='$1'"
}
