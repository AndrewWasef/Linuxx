source funcs.sh

add_prompt_user() {
    read -p  "Please, Enter User Name: " user_name ; echo ""
    read -p  "Please, Enter User ID: " user_id ; echo ""
    read -sp "Please, Enter Password: " user_pass ; echo ""
    read -sp "Enter the Password Again: " user_pass_check; echo ""
}

# Create a User & Output Username and Password to File
create_user() {
	sudo useradd -m -u $user_id $user_name
    	echo "$user_name:$user_pass" | sudo chpasswd
    	
    	if check_user_exist $user_name ; then        
    	    echo "$user_name Was Created Successfully"
    	else
    	    echo "ERROR: User ${user_name} Was NOT Created"
    	fi

	read -p "Do you Want this user to be souder [y/n]:  " soan

	if [[ "$soan" = "y" ]]; then
	    echo "$user_name    ALL=(ALL)       ALL" >> /etc/sudoers
	    echo "user $soan now is super user"
	elif [[ "$soan" = "n" ]]; then
	    echo "user $user_name now is normal user"
	else
	    echo "Invalid! input please enter y/n"
	    echo "please try again ......"
	fi
}

function add_user {
    add_prompt_user
    while [ "$user_pass" != "$user_pass_check" ] ; do
        echo "Passwords Didn't Match, Re-Enter Details"
        add_prompt_user
    done

    if check_user_exist $user_name ; then
        echo "$user_name Already Exist"
    else
        create_user $user_name $user_pass
    fi
}


