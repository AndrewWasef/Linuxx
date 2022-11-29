source funcs.sh

function enable_user {
    local user_name="$(prompt_user)"

    if check_user_exist $user_name ; then
        local user_record="$( sudo getent shadow | grep $user_name | cut -d: -f2 )" ;
        
        if [ ${user_record:0:1} == "!" ] ; then
            sudo usermod -U $user_name
            echo "$user_name Got Unlocked..."
        else
            echo "$user_name is NOT Locked !!!"
        fi
    else
        echo "$user_name Doesn't Exist"
    fi
}



function disable_user {
    local user_name="$(prompt_user)"

    if check_user_exist $user_name ; then
        local user_record="$(sudo getent shadow | grep $user_name | cut -d: -f2)";
        
        if [ ${user_record:0:1} == "!" ] ; then
            echo "$user_name is Already Locked !!!";
        else
            sudo usermod -L $user_name
            echo "$user_name Got Locked..."
        fi

    else
        echo "$user_name Doesn't Exist"
    fi
}

