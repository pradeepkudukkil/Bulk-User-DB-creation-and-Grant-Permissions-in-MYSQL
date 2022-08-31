Bulk User, DB creation, and Grant Permissions in MYSQL
============

bulk_db_creation.sh script is used to create user and db based on data we mentioned in db_details.txt file. After the db and user creation, the script will grant the user permissions to the db.

<b>example of db_details.txt contents</b> <br>
db_name1	    user1	        FRTT03#g8uwZY6ER   db_name1.sql <br>
db_name2	    user2	        EFWFg8uwZEFEFEFE   db_name2.sql <br>
db_name3      user3	      FTRFg8uwZEFEFEFE   db_name3.sql <br>

restoring db must be available in the path of /root/db_backup/, you can change it by editing the script.
