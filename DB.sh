#!/bin/bash
DBs="databases"
export DBs
PS3='Please enter your choice: '

select choice in "Create Database" "List Databases" "Connect To Databases" "Drop Database" "Create Table" "List Tables" "Drop Table" "Insert into Table" "Select From Table" "Delete From Table" " Update Table";do
case "$choice" in
    "Create Database")
      ./CreateDatabase.sh
        ;;
   "List Databases" )
       ./ListDatabases.sh
         ;;
    "Connect To Databases" )
       ./ConnectToDatabases.sh
         ;;  
    "Drop Database" )
       ./DropDatabase.sh
         ;;
    "Create Table" )
       ./CreateTable.sh
         ;;    
    "List Tables" )
       ./ListTables.sh
         ;;  
     
     "Drop Table" )
       ./DropTable.sh
         ;;
      "Insert into Table" )
       ./InsertintoTable.sh
         ;;
      "Select From Table" )
       ./SelectFromTable.sh
         ;;
      "Delete From Table" )
       ./DeleteFromTable.sh
         ;;   
      "Update Table" )
       ./UpdateTable.sh
         ;;   

esac
done