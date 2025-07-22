#/bin/bash
#Rogelio Prieto
#july 2025
#objective: verify md5 between a downloaded file and md5 string.

case $# in
  2)
  	echo "You have provided two arguments"
	#first parameter is the installer file
	DOWNLOADEDFILE=$1
	#second parameter is the md5 string or a file contaning the string md5 string.
	MD5STRINGFILE=$2  	
  	if [ -f "${1}" ] #validate file exists
		then
			echo "ℹ️ 1st parameter: ${1}  file exists"
			MYFIRST=$(md5 -r $DOWNLOADEDFILE | awk -v ORS="" '{print $1}');
		else
			echo "⚠️  No existe el archivo: ${1}"
			exit 1
	fi

  	if [ -f "${2}" ] #validate file exists
		then
			echo "ℹ️ 2nd parameter: ${2}  file exists"
			MYSECOND=$(cat $MD5STRINGFILE |  awk -v ORS="" '{print $1}');
		else
			#2nd parameter is a md5 string
			echo "ℹ️ 2nd parameter is a md5 string"
			MYSECOND=${2}
			#echo "⚠️  No existe el archivo: ${1}"
			#exit 1
	fi

	echo $MYFIRST; echo $MYSECOND
	#echo "--------------------------------"
	echo $(printf --  '-%.0s' {1..32}) #print 32 dashes and newline after all
	if [[ "$MYFIRST" == "$MYSECOND" ]]
		then
			echo "✅ md5 are equals"
		 else
		 	echo "⛔️ md5 are different"
	fi
    ;;

  0 | 1 | *)
    echo "⚠️ Error. You should provide 2 arguments!"
    echo "The 1st parameter is the installer filename."
    echo "The 2nd parameter is the md5 string or a filename that contains it."
    ;;

#  *)
#    echo "⚠️ Error. You should provide 2 arguments"
#    ;;
esac


#Source:
#https://stackoverflow.com/questions/5349718/how-can-i-repeat-a-character-in-bash

#trying in macos
#md5 -r BasicTeX.pkg | cut -d " " -f1 | awk -v ORS="" '{print $1}'  | pbcopy && cat BasicTeX.pkg.md5 | cut -d " " -f1 | awk -v ORS="" '{print $1}' | grep pbpaste

