#!/bin/bash
change_ssh_port (){
	checkImortantPackages=($(rpm -qa | grep ^policycoreutils))
	if [[ "${checkImortantPackages[*]}" != policycoreutils-python-utils-.* ]] || [[ "${checkImortantPackages[*]}" != policycoreutils-[0-9].* ]]; then
	        echo "Installing Some Missing Important Packages"
	        dnf update -y > /dev/null
	        dnf install policycoreutils -y  > /dev/null
	        dnf install policycoreutils-python-utils -y > /dev/null
	fi
	
	read -p "please enter SSH Port: " SSHPORT
	if [[ "$SSHPORT" =~ ^[0-9]{2,5}$ || "$SSHPORT" = 22 ]]; then
	    if [[ "$SSHPORT" -ge 1024 && "$SSHPORT" -le 65535 || "$SSHPORT" = 22 ]]; then
	        echo "Change SSH Port to $SSHPORT"
	        sed -i -e "/Port /c\Port $SSHPORT" /etc/ssh/sshd_config
	        #Add new port to selinux
	        semanage port -a -t ssh_port_t -p tcp $SSHPORT
	        semanage port -m -t ssh_port_t -p tcp $SSHPORT
	        systemctl restart sshd
	        #Add new port to Firewall
	        firewall-cmd --add-port=$SSHPORT/tcp --permanent
	        firewall-cmd --remove-service=ssh --permanent
	        firewall-cmd --reload
	        #Fianal
	        echo "SSH port has been changed successfully to Port $SSHPORT"
	        echo "Please try to connect with below command"
	        echo "ssh <Username>@<IP> -p $SSHPORT"
	    else
	        echo  "Invalid port: must be 22, or between 1024 and 65535."
	    fi
	else
	    echo  "Invalid port: must be numeric!"
	fi
}
