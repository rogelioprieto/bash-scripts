#/bin/bash
#Rogelio Prieto
#july 2025
#objective: verify md5 between a downloaded file and md5 string.



#first parameter is the installer file
DOWNLOADEDFILE=$1
#second parameter is the md5 string file
MD5STRINGFILE=$2

#example:
#DOWNLOADEDFILE=BasicTeX.pkg
#MD5STRINGFILE=BasicTeX.pkg.md5


MYFIRST=$(md5 -r $DOWNLOADEDFILE | cut -d " " -f1 | awk -v ORS="" '{print $1}');
MYSECOND=$(cat $MD5STRINGFILE | cut -d " " -f1 | awk -v ORS="" '{print $1}');
echo $MYFIRST; echo $MYSECOND
if [[ "$MYFIRST" == "$MYSECOND" ]]; then   echo "equals"; else echo "differents"; fi
