#!/bin/bash
# Rogelio Prieto Alvarado
# 18/feb/2025
# Objective: delete all users contained in the txt list.

#print each command. Echoes each command before execution
set -x

#read a line and delete the user
while read line
do
{
	sudo deluser --remove-home $line
	#echo "User "$line" was deleted."
}
done < usernames.txt
