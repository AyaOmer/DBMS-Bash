#!/bin/bash
source ConnectToDatabases.sh
  read -p "Enter the name of the table: " table
    if [ ! -f "$table" ]; then
      
        echo "Table '$table' does not exist."
        exit
    fi
    
numofLineBefore=$(wc -l < "$table")
read -p "Enter the (Id) to delete the row: " Id
sed -i "/^$Id/d" "$table"
numofLineAfter=$(wc -l < "$table")

if [ "$numofLineBefore" -ne "$numofLineAfter" ]; then
    echo "Row deleted from table '$table'."
else
    echo "Row not found or could not be deleted."
fi
