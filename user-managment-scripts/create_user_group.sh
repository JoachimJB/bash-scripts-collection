#Scripted by Joachim Jamtvedt Børresen octrober 2022. Student ID: 117423
#!/bin/bash

source check_existing.sh
source create_web_page.sh
source sql_querys.sh
source send_email.sh

#Function to create useraccount. Args username($1) and group($2).
create_user(){
	#Checking if user already exists
	check_user $1

	if [[ $? -eq 0 ]]; then		
		#Generates random password for the user
        	randPass=$(openssl rand -base64 12)
	
		#Creating the useraccount and setting password which is expired. 
		sudo useradd -m $1
        	echo $1:$randPass | sudo chpasswd > /dev/null
        	sudo passwd -e $1 > /dev/null

		#Query the users full name and stores it in the passwd file
		read -p "Full name: " name
		sudo chfn -f "$name" $1

		#Query the email
		read -p "Email: " email

		#Create and/or add user to group
		read -p "Secondary group: " group
		if [[ -z $group ]]; then
			echo "No secondary group entered"
		else
			create_group $1 $group
		fi

		#Adding useraccount to mysql DB
		query_add_useraccount $1 "$name" $email $group
	
		#Creating webfolder and startpage
		create_web_page $1 $group

		#Generating and sending useraccount email notification
		email_send $1 $randPass $email
	fi
}

#Function to create usergroup. Args username($1) and group($2).
create_group(){
	#Checking if group already exists
	check_group $2
	if [[ $? -eq 0 ]]; then
		#Creating group and then add the user
		sudo groupadd $2
		add_user_to_group $1 $2
	else
		#Adding the user to existing group
		add_user_to_group $1 $2
	fi
}

#Function to add user to existing usergroup. Args username($1) and group($2).
add_user_to_group(){
	sudo usermod -a -G $2 $1
}


