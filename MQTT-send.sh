#!/bin/bash

#prompt for info
read -p "Topic: " topic
read -p "Broker: " broker
read -p "Username: " username
read -sp "Password: " password
echo

filename="data.txt"

while true; do

  #checks for internet 
  ping -c 1 -W 1 $broker > /dev/null 2>&1
  connected=$?  #stores exit code(we get 0 if successfully online)

  #input
  read -p "Enter message (or 'quit' to exit): " message

  #checking for quitting msg
  if [[ "$message" == "quit" ]]; then
    echo "Exiting..."
    break
  fi

  #conx status & msg pub
  if [[ $connected -eq 0 ]]; then
    #if online
    mosquitto_pub -h "$broker" -t "$topic" -m "$message" -u "$username" -P "$password"
  else
    #if offline (we save msg to data.txt)
    echo "---" >> "$filename"
    echo "Disconnected: $message" >> "$filename"  # Add message even if empty
    echo "----" >> "$filename"
    message_offline=$(grep -E "^---.*----$" "$filename")
  fi

done
