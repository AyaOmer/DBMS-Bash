#!/bin/bash
 source ConnectToDatabases.sh
echo "Enter the name of table"
read table
# "$DB_DIR/$db_name/$table_name.txt"
if [ -f "$DBs/$DB/$table" ]; then
    echo "$table already exist"
fi

echo "Enter columns (name:type,...etc):"
read columns
    IFS=',' read -r -a column_array <<< "$columns"

for column in "${column_array[@]}"; do

    if ! [[  $column =~ ^[a-zA-Z_]+:(int|string|float)$ ]] ;then
        echo "Invalid column definition: $column"
            exit
    fi
    done
    
   echo "Enter primary key column:"
    read primary_key

    f=0
    for column in "${column_array[@]}"; do
    if [ "$column" = "$primary_key" ]; then
        f=1
        break
    fi
    done

    if [ "$f" -eq 0 ]; then
     echo "Primary key must be one of the columns."
        exit
    fi

    echo "$columns" >>  "../../$DB/$table" 
    echo "PRIMARY_KEY:$primary_key" >>  "../../$DB/$table" 
    echo "Table '$table' created with columns: $columns and primary key: $primary_key"
    
    
    #  name:string,id:int,salary:float
