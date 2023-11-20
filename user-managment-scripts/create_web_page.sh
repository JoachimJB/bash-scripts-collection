#Scripted by Joachim Jamtvedt Børresen octrober 2022. Student ID: 117423
#!/bin/bash

#Function to create the index.html file for useraccount. Args username($1).
create_web_page () {
	#Extracts the full name of the user from passwd file
	fullname=$(getent passwd $1 | cut -d ':' -f 5 | cut -d ',' -f 1)
	
	#create index.html file
	touch index.html
	
	#Concatenates to the file index.html
	cat <<EOF > index.html
	
	<html>
                <head>
                        <title>Homepage of $fullname</title>
                </head>
                <body>
                        <h1>Welcome to the great site of $fullname</h1>
                        
                </body>
        </html>


EOF

#Creates webfolder and moves index.html
sudo mkdir /var/www/html/$1
sudo mv index.html /var/www/html/$1/
}
