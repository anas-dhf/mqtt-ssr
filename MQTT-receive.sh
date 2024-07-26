#!/bin/bash

#prompt for info
read -p "Topic: " topic
read -p "Broker: " broker
read -p "Username: " username
read -sp "Password: " password
echo

#port used
port=$(grep -E "^listener\s+([0-9]+)" /etc/mosquitto/mosquitto.conf | awk '{print $2}')
echo "Port used: $port"

#test conx
mosquitto_sub -h $broker -t $topic -v -d -u $username -P $password -p $port | while read -r data; do
	if [[ $data == $topic* ]]; then
		echo "---------"
		echo "$data"
		echo "$data" >> data.txt
	fi
done

#login testing
if [ $? -eq 0 ]; then
  echo "Login Successful."
else
  echo "ERROR: Login incorrect. Try Again."
fi
