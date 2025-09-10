#!/bin/bash
#author: Rogelio Prieto Alvarado
#06/april/2022
#10/sept/2025 updated
#Objective: reduce pdf file size.

#requirements:
#sudo apt install ghostscript

if [[ -z $1 ]];
then
	echo "You should use in this way:"
	echo "$0 filename.pdf"
	exit
fi



echo "Files will be created with these qualities:"
echo "/screen    (72 DPI), smallest possible file size"
echo "/ebook     (around 150 DPI) medium resolution"
echo "/printer   (300 DPI)"
echo "/prepress   highest quality setting"
echo "/default   a balance between /screen and /printer"
echo "----"
#/screen    (72 DPI), smallest possible file size
#/ebook     (around 150 DPI) medium resolution
#/printer   (300 DPI)
#/default   a balance between /screen and /printer
#/prepress   highest quality setting 


filename=$(basename -- "$1")
extension="${filename##*.}"
#output="${filename%.*}-output.${extension}"
output="${filename%.*}-output"

for quality in screen ebook printer default prepress ;
do
    #echo ${quality}
    outputfilename=${output}"-"${quality}"."${extension}
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/${quality} -dNOPAUSE -dQUIET -dBATCH -sOutputFile=${outputfilename} $1
    # Check the exit status
    if [ $? -eq 0 ]; then
        echo "🟢  ${outputfilename} was built"
#        echo "Command executed successfully."
#    else
#      echo "Command failed."
    fi   
done



#Source by: Adobe in
#https://www.adobe.com/acrobat/hub/how-to/how-to-compress-pdf-in-linux
