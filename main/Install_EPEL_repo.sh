Install_EPEL_repo (){
    dnf search epel
    echo "Installing EPEL repo"
    dnf install epel-release -y 
    echo "Enable EPEL repo"
    dnf config-manager --set-enabled PowerTools || dnf install 'dnf-command(config-manager)' -y
    dnf config-manager --set-enabled PowerTools
    dnf update
    echo "Checking EPEL repo => Count packages in EPEL repo"
    dnf --disablerepo="*" --enablerepo="epel" list available | wc -l
}
