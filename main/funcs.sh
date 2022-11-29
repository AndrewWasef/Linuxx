# # Color variables
# red='\e[31m'
# green='\e[32m'
# yellow='\e[33m'
# blue='\e[34m'
# magenta='\e[35m'
# cyan='\e[36m'
# # Clear the color after that
# clear='\e[0m'
# # Bold Text
# bold='\e[1m'

# Check if User Already Exists
check_user_exist() {
    getent passwd ${1} > /dev/null && return 0
}

prompt_user() {
    read -p "Please, Enter Username: " user_name ; 
    echo $user_name ;
}


export -f check_user_exist

export -f prompt_user

