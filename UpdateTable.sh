#!/bin/bash
source ConnectToDatabases.sh
  
   read -p "Enter the name of the table: " table
    if [ ! -f "$table" ]; then
        echo "Table '$table' does not exist."
    fi

       read -p "Enter the (ID) number to update: " id
       read -p "Enter the old value to update: " old_value
       read -p "Enter the new value : " new_value
       
       sed -i "/^$id/s/$old_value/$new_value/" "$table"
        echo "Row updated in table '$table'."


    