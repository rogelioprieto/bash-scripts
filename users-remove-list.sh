#!/bin/bash
# Rogelio Prieto Alvarado
# 18/feb/2025
# Objective: delete all users contained in the txt list.

#print every command
set -x
while read line
do
{
	sudo deluser --remove-home $line
	#echo "User "$line" was deleted."
}
done < usernames.txt
