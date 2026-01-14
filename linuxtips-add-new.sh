#!/bin/bash 
# date: 2026/01/14
# author: Rogelio Prieto Alvarado





###############
# Custom Functions
###############
file_found() {
#   local sum=$(($1 + $2)) # $1 and $2 refer to the first and second arguments
#   echo "The sum of $1 and $2 is: $sum"
    # echo "0"
  # Functions use echo to return values which are then captured using command substitution

    #0 file not found
    #1 file was found


    # Check if the file exists and is a regular file using the -f operator
    if [[ -f "${1}" ]]; then
        # echo "File '${1}' found."
        # ls -l "${1}"
        # head -10 "${1}"
        # echo "(showing first 10 lines...)"
        
        # Ask for confirmation
        read -p "File ${1} will be replaced with a NEW file. Do you want to proceed, ? (Y/n): " -n 1 -r REPLY
        # echo # Move to a new line after user input

        # Check the user's reply using a case-insensitive regular expression
        if [[ "$REPLY" =~ ^[Yy]$ ]]; then
            # echo "Proceeding..."
            echo "1"

            # Add the commands you want to execute here
        else
            # echo "Aborting."
            echo "0"
            # exit 1 # Exit script with an error code
        fi
    else
        echo "Error: File '${1}' not found."
        echo "0"
        # exit 1 # Exit script with an error code
    fi

}

file_show_info() {
        ls -l "${1}"
        head -10 "${1}"
        echo "(showing first 10 lines...)"
}














# Get the absolute path where script is stored.
# SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}");
# #echo "The script directory is: ${SCRIPT_DIR}"

if [ "$#" -eq 0 ]; then
    MDFILENAME="$(date +%Y-%m-%d)-title.md"
    
    if [[ -f ${MDFILENAME} ]]; then
        echo -e "File ${MDFILENAME} exists, new file was NOT created."
    else
        #if file NOT exists, it will be created
        cp ${SCRIPT_DIR}/_linuxtips-template_yyyy-mm-dd-title.md ${MDFILENAME}
        echo -e "${MDFILENAME} was created.\n---"
    fi

else
    echo -e "$# files will be created.\n---"
    counter=0;
    counter_new_files=0;
    for titlearg in "$@"; do
        # echo "Processing argument: $titlearg"
        MDFILENAME="$(date +%Y-%m-%d)-${titlearg:-title}.md"
        echo -e "\n" #blank line
        echo "FILE $((++counter)): ${MDFILENAME}."

        
        # FILEEXISTS=$(file_found ${MDFILENAME})
        # if [ $FILEEXISTS -eq 1 ]; then
        if [[ -f "${MDFILENAME}" ]]; then
                      
            ###
            # Show file info
            ###
            echo "FILE INFO (metadata & first head lines):"
            ls -l "${MDFILENAME}"
            head -10 "${MDFILENAME}"
            ###


            read -p "This file will be replaced with NEW file. Do you want to proceed, ? (Y/n): " -n 1 -r REPLY 
            echo #blank line
            
            # Check the user's reply using a case-insensitive regular expression
            if [[ "$REPLY" =~ ^[Yy]$ ]]; then
                # echo "Proceeding..."
                CREATEFILE=1
            else
                # echo "Aborting."
                CREATEFILE=0
                # exit 1 # Exit script with an error code
            fi
        else
            CREATEFILE=1

        fi

        if [ $CREATEFILE -eq 1 ]; then
            # if $1 has no value, "title" is the default value
            cp ${SCRIPT_DIR}/_linuxtips-template_yyyy-mm-dd-title.md ${MDFILENAME}
            if [ $? -gt 0 ]; then
                echo "It was and error, file ${MDFILENAME} was not created."
            else
                echo "${MDFILENAME} created."
                ((counter_new_files++))
            fi   
        fi
    done
    echo -e "\n---\n$counter_new_files new linux-tips files were created.\n---"
fi





#!/bin/bash

# # Define the file path. Using double quotes prevents issues with spaces in names.
# FILE="/path/to/your/file.txt"

# # Check if the file exists and is a regular file using the -f operator
# if [[ -f "$FILE" ]]; then
#     echo "File '$FILE' found."
    
#     # Ask for confirmation
#     read -p "Do you want to proceed? (Y/n): " -n 1 -r REPLY
#     echo # Move to a new line after user input

#     # Check the user's reply using a case-insensitive regular expression
#     if [[ "$REPLY" =~ ^[Yy]$ ]]; then
#         echo "Proceeding..."
#         # Add the commands you want to execute here
#     else
#         echo "Aborting."
#         exit 1 # Exit script with an error code
#     fi
# else
#     echo "Error: File '$FILE' not found."
#     exit 1 # Exit script with an error code
# fi


# file_found () {
    #0 file not found
    #1 file was found


    # # Check if the file exists and is a regular file using the -f operator
    # if [[ -f "${1}" ]]; then
    #     echo "File '${1}' found."
    #     ls -l "${1}"
        
    #     # Ask for confirmation
    #     read -p "This file will be replaced with NEW file. Do you want to proceed, ? (Y/n): " -n 1 -r REPLY
    #     echo # Move to a new line after user input

    #     # Check the user's reply using a case-insensitive regular expression
    #     if [[ "$REPLY" =~ ^[Yy]$ ]]; then
    #         # echo "Proceeding..."
    #         echo 1

    #         # Add the commands you want to execute here
    #     else
    #         # echo "Aborting."
    #         echo 0
    #         # exit 1 # Exit script with an error code
    #     fi
    # else
    #     echo "Error: File '${1}' not found."
    #     echo 0
    #     # exit 1 # Exit script with an error code
    # fi

# }