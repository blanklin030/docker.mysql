#!/bin/bash

# 查看mysql的状态，方便调试，这句可删除
echo `service mysql status`
echo '1.start mysql'
service mysql start
sleep 3

echo '2.import data'
mysql < /mysql/schema.sql
sleep 3

echo '3. modify user password'
mysql < /mysql/priviledge.sql

echo `service mysql status`

echo 'all action done'

tail -f /dev/null

