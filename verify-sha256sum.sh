#/bin/bash
#Rogelio Prieto
#july 2025
#objective: verify SHA256sum between a downloaded file and SHA256sum string.

case $# in
  2)
  	echo "You have provided two arguments"
	#first parameter is the installer file
	DOWNLOADEDFILE=$1
	#second parameter is the SHA256sum string or a file contaning the SHA256sum string.
	MD5STRINGFILE=$2  	
  	if [ -f "${1}" ] #validate file exists
		then
			echo "ℹ️ 1st parameter: ${1}  file exists"
			MYFIRST=$(sha256sum $DOWNLOADEDFILE | awk -v ORS="" '{print $1}');
		else
			echo "⚠️  No existe el archivo: ${1}"
			exit 1
	fi

  	if [ -f "${2}" ] #validate file exists
		then
			echo "ℹ️ 2nd parameter: ${2}  file exists"
			MYSECOND=$(cat $MD5STRINGFILE |  awk -v ORS="" '{print $1}');
		else
			#2nd parameter is a SHA256 checksum string
			echo "ℹ️ 2nd parameter is a SHA256 checksum string"
			MYSECOND=${2}
			#echo "⚠️  No existe el archivo: ${1}"
			#exit 1
	fi

	echo $MYFIRST; echo $MYSECOND
	#echo "--------------------------------"
	echo $(printf --  '-%.0s' {1..32}) #print 32 dashes and newline after all
	if [[ "$MYFIRST" == "$MYSECOND" ]]
		then
			echo "✅ SHA256 checksum are equals"
		 else
		 	echo "⛔️ SHA256 checksum are different"
	fi
    ;;

  0 | 1 | *)
    echo "⚠️ Error. You should provide 2 arguments!"
    echo "The 1st parameter is the installer filename."
    echo "The 2nd parameter is the SHA256 checksum string or a filename that contains it."
    ;;

#  *)
#    echo "⚠️ Error. You should provide 2 arguments"
#    ;;
esac


#Source:
#https://stackoverflow.com/questions/5349718/how-can-i-repeat-a-character-in-bash

#trying in macos
#md5 -r BasicTeX.pkg | cut -d " " -f1 | awk -v ORS="" '{print $1}'  | pbcopy && cat BasicTeX.pkg.md5 | cut -d " " -f1 | awk -v ORS="" '{print $1}' | grep pbpaste

