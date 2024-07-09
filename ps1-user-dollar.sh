#!/bin/bash
#package required: sudo apt-get install xsel
x=$(which PS1-user2024.sh)
#echo $x
MYPATH=${x%/*}
#echo $MYPATH
cat $MYPATH/PS1-user2024.sh | xsel --clipboard
