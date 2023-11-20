#Scripted by Joachim Jamtvedt Børresen octrober 2022. Student ID: 117423
#!/bin/bash

#Function to send useraccount email. Args username, password and email.
email_send(){
	email_generate $1 $2 | mutt -s "Useraccount" $3
}

#Function to generate useraccount email. Args username and password.
email_generate(){
	#Extracts the full name of the user from passwd file
        fullname=$(getent passwd $1 | cut -d ':' -f 5 | cut -d ',' -f 1)
	
	echo "
	Hello $fullname
	
	This is an automatically generated email from system admin. 
	Your credentials are:

	Username: $1 and Password: $2

	The password is set to be changed on first login.

	System Admin
	Supertenter"
}
