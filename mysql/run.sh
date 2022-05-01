#!/bin/bash

SQL_PATH=$1

CONTAINER_NAME=mysql-northwind
SLEEP_SEC=15

echo "$CONTAINER_NAME conteiner creating..."

docker run -d -p 3306:3306 --name=$CONTAINER_NAME -e MYSQL_ALLOW_EMPTY_PASSWORD=yes mysql

echo "$CONTAINER_NAME conteiner created"

echo "sleeping...  $SLEEP_SEC sec."
sleep $SLEEP_SEC

echo "backup restoring..."
echo "$SQL_PATH" | docker exec -i $CONTAINER_NAME mysql -uroot
echo "backup restored"