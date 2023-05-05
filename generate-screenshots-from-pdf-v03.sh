#!/bin/bash
#author: Rogelio Prieto Alvarado
#7/february/2021
#Objective: generate TWO screenshot of each page of a pdf file,
# in a reduce size (height 800px and png8 format)


#How to execute:
#Parametes: pdf-filename
#./generate-screenshots-from-pdf.sh filename.pdf
#Note. Screenshots are saved in the OUTPUTFOLDER path, the screenshots subfolder.


#Requirements (packages):
#1. poppler-utils (sudo apt-get install poppler-utils)
#2. imagemagick (sudo apt install imagemagick)

#Known errors:
#1. Syntax Error (199275): Dictionary key must be a name object"
#this erros appears to occurs for the pdf format file. You can ignore it!



if [ $# -eq 0 ]
then
 	#no parameters received
	echo "You should specify filename.pdf (first parameter) and optionally first page and last page to extract."
	echo "Sintaxis: generate-screenshots filename.pdf [first[-last]]"
	echo "Examples:"
	echo "generate-screenshots article.pdf 2"
	echo "generate-screenshots article.pdf 2-5"
	exit 1
else
	#Step 1. Extract screenshots from pdf file.
	
	if [ $# -eq 1 ]
	then
		if [ -f $1 ] #validate file exists
		then
			echo "ℹ️  Procesando el archivo: $1"
			pdftocairo -png "$1"
		else
			echo "⚠️  No existe el archivo: $1"
			exit 1
		fi


	else

		if [ $# -eq 2 ]
		then
			echo "ℹ️  Procesando el archivo: $1"
			#Extract the pages range from $2 parameter
			range=$2
			firstpage="${range%-*}"
			lastpage="${range#*-}"
			if [ $lastpage == "" ]
			then
				echo "$lastpage is empty"
			fi

			#print the number of extracted pages
			if [ $firstpage -eq $lastpage ]
			then
				echo "📄 Extrayendo la página $firstpage..."			
			else
				echo "📄 Extrayendo las páginas $firstpage a la $lastpage..."
			fi
			
			
			pdftocairo -png "$1" -f $firstpage -l $lastpage
		
		fi
	fi
fi


#echo "ℹ️   Procesando el archivo: $1"
#Step 1. Extract screenshots from pdf file.
#pdftocairo -png $1

#Step 2. count the png screenshots files
#FILES=*.png
FILES=$(ls *.png)
OUTPUTFOLDER="screenshots_$(date +"%Y-%m-%d_%H%M%S")"  # "screenshots"
#echo "FILES:"$FILES
COUNTFILES=$(ls *.png | wc -l)

#Step 3. create a subfolder to move and save the screenshots
if [ $COUNTFILES -eq 0 ]
then
    echo "No se generaron screenshots."
else
    echo "📄 Procesando $COUNTFILES screenshots..."
    mkdir -p $OUTPUTFOLDER
    #get filename without extension
	filename=$(basename -- "$1")
    filename="${filename%.*}"
    mv "$filename-"*.png $OUTPUTFOLDER
    cd $OUTPUTFOLDER
    
fi

#Step 3. Move,resize and compress png screenshots
WIDTH=800
WIDTHSMALL=560

#echo -e "listado de archivos:\n---\n $FILES \n---\n"
for file in $FILES
do

    name=${file%%.*}
    extension=${file##*.}
#TODO echo "name=$name"
#TODO echo "extension=$name"
    #option 1. using RGB sRGB source: https://imagemagick.org/script/formats.php

    convert "$file"  -bordercolor DarkGray  -border 2  -colorspace RGB   -resize ${WIDTH}x\>  -colorspace sRGB -colors 255 PNG8:"$file"
#TODO echo "first convert"    
    convert "$file" -bordercolor DarkGray  -border 2 -colorspace RGB     -resize ${WIDTHSMALL}x\> -colorspace sRGB -colors 255  PNG8:"${name}"-small.${extension}
    
#TODO echo "second convert"

    #option 2. without RGB sRGB
    #convert $file  -bordercolor DarkGray  -border 2     -resize ${WIDTH}x\>   -colors 255 PNG8:$file
    
    #convert $file -bordercolor DarkGray  -border 2     -resize ${WIDTHSMALL}x\>  -colors 255  PNG8:${name}-small.${extension}
    
    #example:
    #convert image.png -resize 800x\>  PNG8:image.png
done
echo -e "👍 ¡listo!\n\nLas imágenes están almacenadas en el subdirectorio:\n📂 $OUTPUTFOLDER\n"

#Sources:
#https://graphicdesign.stackexchange.com/questions/120255/how-does-tinypng-com-minimize-pictures
#https://legacy.imagemagick.org/Usage/resize/#resize

