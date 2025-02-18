#!/bin/bash
#author: Rogelio Prieto Alvarado
#18/feb/2025
#Objective: get the registered users in bash.
awk -F':' '{ print $1}' /etc/passwd
