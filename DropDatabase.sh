#!/bin/bash
read -p "Enter databse to delete : " db
if [ -d "$DBs/$db" ]; then
        rm -rf "$DBs/$db"
        echo "Database '$db' deleted."
    else
        echo "Database '$db' does not exist."
fi