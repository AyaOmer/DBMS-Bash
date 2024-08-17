#!/bin/bash

read -p " Enter the name of database : " db
echo "$DBs"
if [ -d "$DBs/$db" ]; then
    echo "$db already exist "
    else
    mkdir "$DBs/$db"
     echo "$db created"
fi 