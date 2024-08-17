#!/bin/bash
source ConnectToDatabases.sh
    read -p "Enter the name of the table: " table
    if [ ! -f "$table" ]; then
        echo "Table '$table' does not exist."
    fi
    read -p "Enter specific word or leave blank :" search

     if [ -z "$search" ]; then
       echo "Data in table '$table':"
    cat "$table"
    
    else
       sed -n "/$search/p" "$table"
    fi