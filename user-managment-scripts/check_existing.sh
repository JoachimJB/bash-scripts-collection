#Scripted by Joachim Jamtvedt Børresen octrober 2022. Student ID: 117423
#!/bin/bash

#Check if user exists and displays availible data. Args username($1).
check_user(){
	username=$1
        #Checking if user is present in passwd file and prevents output
        getent passwd $username > /dev/null
	
	#Displaying relevant info if last command (getent) is true. 
        if [ $? -eq 0 ]; then
                echo "Username $username exists."
		user_size $username
                return 1
        else
                return 0
        fi
}

#Check if group exists. Args group($1).
check_group(){
	group=$1
	getent group $group > /dev/null	
	
	if [ $? -eq 0 ]; then
		echo "Groupname $group already exists."
		return 1
	else
		return 0
	fi
}

user_size(){
	#Checking if home folder is present and getting folder size in bytes
        if [[ -d "/home/$1" ]]; then
                h_f_size=$(sudo du -sb "/home/$1" | cut -f 1)
                echo "/home/$1 exists using: "$h_f_size" Bytes";
                size=$(($size+$h_f_size))
        fi

        #Checking if web folder is present and getting the folder size in bytes
        if [[ -d "/var/www/html/$1" ]]; then
                w_f_size=$(sudo du -sb "/var/www/html/$1" | cut -f 1)
                echo "/var/www/html/$1 exists using: "$w_f_size" Bytes";
                size=$(($size+$w_f_size))
        fi

        #Adding and displaying total disc space oocupied in the folders
        echo "Total file size used by "$1" is: "$size" Bytes"
	size=0
}
