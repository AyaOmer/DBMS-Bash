#!/bin/bash
read -p "Enter the name of the database: " db

 if [ -d "$DBs/$db" ]; then
        cd "$DBs/$db" 
        echo "Connected to database '$db'."

    else
        echo "Database '$db' does not exist."
fi