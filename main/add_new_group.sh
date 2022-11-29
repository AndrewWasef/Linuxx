#!/bin/bash
add_new_group (){
	read -p "Please Enter Group Name: " groupName
	read -p "Please Enter Group ID: " groupID
	
	if [[ "$groupID" =~ ^[0-9]{1,5}$ && "$groupID" -ge 0 && "$groupID" -le 32767 ]]; then
	
		if ! cat /etc/group | grep $groupName 1> /dev/null
		then
		        echo "Creating! $groupName group"
		        groupadd -g $groupID $groupName
		        echo "$groupName group created Successfully!"
		else
		        echo "$groupName group exist!"
		fi
		
	else
	    echo  "Invalid Group ID: must be numeric!"
	fi
}
