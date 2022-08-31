#! /bin/bash

while read db_details
do
        db=`$expr echo $db_details | awk '{print $1}'`
        user=`$expr echo $db_details | awk '{print $2}'`
        password=`$expr echo $db_details | awk '{print $3}'`
        backup=`$expr echo $db_details | awk '{print $4}'`

        ## Creating db, user and set permission
        mysql -e "create database $db";
        db_creation_status=$?
        if (($db_creation_status!=0))
        then
          echo -e "issue facing while creating db ${db}"
        fi

        mysql -e "CREATE USER '$user'@'localhost' IDENTIFIED BY '$password'";
        user_creation_status=$?
        if (($user_creation_status!=0))
        then
          echo -e "issue facing while creating user ${user}"
        fi

        mysql -e "GRANT ALL ON $db.* TO '$user'@'localhost' IDENTIFIED BY '$password' WITH GRANT OPTION";
        permission_status=$?
        if (($permission_status!=0))
        then
          echo -e "issue facing while setting permission for user ${user}"
        fi

        echo -e "${db} - Restore starting, it take time"
        cd /root/db_backup/
        mysql $db < $backup
        restore_status=$?
        if (($restore_status!=0))
        then
          echo -e "issue facing while restoring db ${db}"
        fi


done < db_details.txt
