#!/bin/bash
# author: Rogelio Prieto Alvarado
# 3/December/2025
#
# Objective: Find max and min from a CSV column file
# Input a CSV file with numerical values
#
# Parameters: path-to-file column
# column parameter use 1-based index.
# How to execute:
# ./max-min-value-in-column-csv-file.sh data.csv 2


MYFILE=$1
MYCOL=$2

# Check exactly 2 arguments were received?
if [ "$#" -ne 2 ]; then
	scriptname=$(basename ${0}) # Extract the filename from fullpath
	echo "Usage: $scriptname <path-to-file> <column>"
	exit 1
fi
# Check file exists?
if [ ! -f ${MYFILE} ]; then
	echo "File not found!"
	exit
fi

echo -e "---\nFile: ${MYFILE}, Column: ${MYCOL}"
echo "MIN value: "$(tail +2 ${MYFILE} |  cut -d, -f $MYCOL | sort -n | head -1)
echo "MAX value: "$(tail +2 ${MYFILE} |  cut -d, -f $MYCOL | sort -n -r | head -1)

#echo "MIN value in column ${MYCOL} is: "$(tail +2 ${MYFILE} |  cut -d, -f $MYCOL | sort -n | head -1)
#echo "MAX value in column ${MYCOL} is: "$(tail +2 ${MYFILE} |  cut -d, -f $MYCOL | sort -n -r | head -1)
echo "---"

