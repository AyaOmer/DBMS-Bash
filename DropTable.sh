#!/bin/bash
source ConnectToDatabases.sh
echo ""
 read -p "Enter the name of the table to delete: " table
    if [ -f "$table" ]; then
        rm "$table"
        echo "Table '$table' deleted."
    else
        echo "Table '$table' does not exist."
    fi