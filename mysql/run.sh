#!/bin/bash

SQL_PATH=$1

CONTAINER_NAME=mysql-northwind

docker run -d -p 3306:3306 --name=$CONTAINER_NAME -e MYSQL_ALLOW_EMPTY_PASSWORD=yes mysql

sleep 15

docker exec -i $CONTAINER_NAME sh -c 'exec mysql -uroot' < $SQL_PATH
