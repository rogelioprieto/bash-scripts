#!/bin/bash
#author: Rogelio Prieto Alvarado
#06/april/2022
#Objective: reduce pdf file size.

#requirements:
#sudo apt install ghostscript

if [[ -z $1 ]];
then
	echo "You should use in this way:"
	echo "$0 filename.pdf"
	exit
fi

filename=$(basename -- "$1")
extension="${filename##*.}"
output="${filename%.*}-output.${extension}"

#echo "filename:"${output}

gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=${output} $1
echo "🟢  ${output} was built"

#Source by: Adobe in
#https://www.adobe.com/acrobat/hub/how-to/how-to-compress-pdf-in-linux