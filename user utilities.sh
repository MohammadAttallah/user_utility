#!/bin/bash

#This script for user managment tasks

function user_add(){
#This script for adding users
 
echo -e "This script for adding new user\n"

echo "Please Enter username: "
read username
echo "Please Enter password: "
read -s password

#seach if this user is exist or not 
grep -w "$username"  /etc/passwd > /dev/null

# if the user is exist he will return zero 
if [ $? -eq 0 ]; then
	echo "user already exist";
else 
	sudo useradd  $username -m -d /home/$username -p $password -s /bin/bash;
	echo "The user $username is created"
	echo "welcome $username";
fi;

}

function user_del(){
#This script for deleting  users
 
echo -e "This script for adding new user\n"

echo "Please Enter username: "
read username

#seach if this user is exist or not 
grep -w "$username"  /etc/passwd > /dev/null

# if the user is exist he will return zero then we will delete the user 
if [ $? -eq 0 ]; then
	sudo userdel -r $username
	echo "the user $username is deleted"
else 
	echo "The user  $username is not exist";
fi;

}

var=1

while [ $var -gt 0 ]
do 
echo "This utilitiy for user managment tasks"
echo "please select from the below list"
echo "1-useradd"
echo "2-userdelete"
echo "3-exit "
echo "i.e:1 # for useradd"
read var

if [ $var -eq 1 ]
then 
	#echo "user add script";
	user_add
elif [ $var -eq 2 ] 
then 	
	#echo "user delete script"
	user_del
elif [ $var -eq 3 ]
then 
	var=0;
else 
	echo "the Entered option $var doesn't exist"
fi 

done
