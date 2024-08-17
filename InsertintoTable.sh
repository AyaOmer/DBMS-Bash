#!/bin/bash
source ConnectToDatabases.sh
read -p "Enter Table Name : " table

if [ ! -f "$table" ] ;then 
echo "Table '$table' does not exist."
exit
fi

schema=$(head -n 1 "$table" )
primary_key=$(grep "PRIMARY_KEY" "$table" |cut -d: -f2)
IFS="," read -a columns <<< "$schema"
declare -A column_types
for column in "${columns[@]}"; do
    name=$(echo "$column" |cut -d: -f1)
    type=$(echo "$column" |cut -d: -f2)
    column_types["$name"]="$type"

done

   declare -A values

    for column in "${!column_types[@]}"; do
        echo "Enter value for $column (${column_types[$column]}):"
        read value

        # Validate data type
        case ${column_types[$column]} in
            int)
                if ! [[ $value =~ ^-?[0-9]+$ ]]; then
                    echo "Invalid value for $column. Expected integer."
                    exit
                fi
                ;;
            string)
                if ! [[ $value =~ ^[a-zA-Z0-9_]+$ ]]; then
                    echo "Invalid value for $column. Expected string."
                    exit
                fi
                ;;
            float)
                if ! [[ $value =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
                    echo "Invalid value for $column. Expected float."
                    exit
                fi
                ;;
        esac

        values[$column]=$value
    done

    # Check primary key uniqueness
    if grep -q "^${values[$primary_key]}," "$table"; then
        echo "Primary key value '${values[$primary_key]}' already exists."
        exit
    fi

    # Insert values into table
    row=""
    for column in "${!column_types[@]}"; do
        row+="${values[$column]},"
    done
    # row=${row%,}  # Remove trailing comma

    echo "$row" >> "$table"
    echo "Values inserted into '$table'."