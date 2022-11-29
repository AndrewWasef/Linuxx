#!/bin/bash
                ############################################
                ### This Script Created by Andrew Wasef ####
###########################################################################
#                                                                         #
#                                                                         #
#      0000_____________0000________0000000000000000__000000000000000000  #
#    00000000_________00000000______000000000000000__0000000000000000000  #
#   000____000_______000____000_____000_______0000__00______0             #
#  000______000_____000______000_____________0000___00______0             #
# 0000______0000___0000______0000___________0000_____0_____0              #
# 0000______0000___0000______0000__________0000___________0               #
# 0000______0000___0000______0000_________000___0000000000                #
# 0000______0000___0000______0000________0000                             #
#  000______000_____000______000________0000                              #
#   000____000_______000____000_______00000                               #
#    00000000_________00000000_______0000000                              #
#      0000_____________0000________00000000                              #
#                                                                         #
###########################################################################

if [ `whoami` != 'root' ]
  then
    echo "You must be root to do this."
    exit
fi
########################################
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White
                                        

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White
###################################
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '


source funcs.sh
source add_user.sh
source delete_user.sh
source user_info.sh
source disen_user.sh
source change_ssh_port.sh
source update_fs.sh
source add_new_group.sh
source Install_EPEL_repo.sh
source Install_fail2ban.sh
source disable_root_login.sh
source creat_reports.sh
source crontab.sh
source task1.sh
source task2.sh

function main {
    clear;
    while true ; do    
    echo -e "\e[0;32m                 ############################################\n                 ### This Script Created by Andrew Wasef ####\n ###########################################################################\n #                                                                         #\n #                                                                         #\n #      0000_____________0000________0000000000000000__000000000000000000  #\n #    00000000_________00000000______000000000000000__0000000000000000000  #\n #   000____000_______000____000_____000_______0000__00______0             #\n #  000______000_____000______000_____________0000___00______0             #\n # 0000______0000___0000______0000___________0000_____0_____0              #\n # 0000______0000___0000______0000__________0000___________0               #\n # 0000______0000___0000______0000_________000___0000000000                #\n # 0000______0000___0000______0000________0000                             #\n #  000______000_____000______000________0000                              #\n #   000____000_______000____000_______00000                               #\n #    00000000_________00000000_______0000000                              #\n #      0000_____________0000________00000000                              #\n #                                                                         #\n ###########################################################################\n \n \n"

	select choice in "Task 1" "Task 2" "Add User With ID" "Show User Details" "Delete User with Data" \
        "Delete User without Data" "Disable User" "Enable User" "Change SSH Port" \
        "Update & Upgrade File System" "Add Group With ID" "Install EPEL repo" "Install fail2ban" \
	"Root Login SSH" "Create crontab job" "Create Report for a year" "Exit"; do

            case $choice in
                "Task 1") Btask1; break  ;;
               
	       	"Task 2") Btask2; break  ;;
               
	       	"Add User With ID") add_user; break  ;;
                
                "Show User Details") get_user_info; break ;;
                
                "Delete User with Data") delete_user -yes; break ;;
                
                "Delete User without Data") delete_user -no; break ;;
                
                "Disable User") disable_user; break ;;

                "Enable User") enable_user; break ;;
                
                "Change SSH Port") change_ssh_port; break ;;
                
		"Update & Upgrade File System") update_fs; break ;;
		
		"Add Group With ID") add_new_group; break ;;

		"Install EPEL repo") Install_EPEL_repo; break ;;
		
		"Install fail2ban") Install_fail2ban; break ;;
		
		"Root Login SSH") disable_root_login; break ;;
		
		"Create crontab job") creat_crontab_jop; break ;;

		"Create Report for a year") creat_report_of_year; break ;;
		

                Exit) exit 0 ;;

                *) echo "\n$REPLY is NOT a Valid Choices."; break ;;
            esac
        done
    done
}

main $@

