Install_fail2ban (){
    echo "Installing Some Missing Important Packages"
    dnf update -y && dnf install epel-release -y

    echo "Installing fail2ban Packages"
    dnf install fail2ban sendmail -y

    echo "Enable and start fail2ban service"
    systemctl enable --now fail2ban
    systemctl enable --now sendmail
}
