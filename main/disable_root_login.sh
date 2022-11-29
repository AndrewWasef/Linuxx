#!/bin/bash
disable_root_login (){
read -p "Do You want root connect via ssh [yes/no]: " New

if [[ "$New" = "yes" || "$New" = "no" ]]; then
    sed -i -e "/PermitRootLogin /c\PermitRootLogin $New" /etc/ssh/sshd_config
    systemctl restart sshd
    echo "New root permision changed successfully"
else
    echo "Invaild input: must be yes or no"
fi
}
