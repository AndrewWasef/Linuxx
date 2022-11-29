source funcs.sh

delete_user() {
    local user_name="$(prompt_user)"
    
    if check_user_exist $user_name ; then
        sudo killall -s 9 -u $user_name 2> /dev/null;

        if [ $1 == "-yes" ] ; then
            sudo userdel -r $user_name 2> /dev/null ;
        elif [ $1 == "-no" ]; then
            sudo userdel $user_name  2> /dev/null;
        fi

        if check_user_exist $user_name ; then
            echo "ERROR: User ${user_name} Was NOT Deleted"
        else
            echo "$user_name Was Deleted Successfully"
        fi

    else
        echo "$user_name Doesn't Exist"
    fi
}
