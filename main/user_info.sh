source funcs.sh

function get_user_info {
    local user_name="$(prompt_user)"

    if check_user_exist $user_name ; then        
        local user_info="$(getent passwd | grep $user_name)"
        echo ""
        echo "User Login Name is: $(echo $user_info | cut -d: -f1)"
        echo "User's ID: $(echo $user_info | cut -d: -f3)"
        echo "User's Primary Group ID: $(echo $user_info | cut -d: -f4)"
        echo "User's Home Dir: $(echo $user_info | cut -d: -f6)"
        echo "$(sudo chage -l $user_name)"
    else
        echo "$user_name Doesn't Exist"
    fi
}