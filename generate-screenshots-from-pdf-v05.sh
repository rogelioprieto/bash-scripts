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
    #echo -e "-----\n-----\n-----\n"	
	if [ $# -eq 1 ]
	then
		if [ -f "${1}" ] #validate file exists
		then
			echo "ℹ️  Procesando el archivo: ${1}"
			pdftocairo -png "${1}"
		else
			echo "⚠️  No existe el archivo: ${1}"
			exit 1
		fi


	else

		if [ $# -eq 2 ]
		then
			echo "ℹ️  Procesando el archivo: ${1}"
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
			
			
			pdftocairo -png -scale-to 1920 "${1}"  -f $firstpage -l $lastpage
		
		fi
	fi
fi

#echo "ℹ️   Procesando el archivo: ${1}"
#Step 1. Extract screenshots from pdf file.
#pdftocairo -png ${1}

#TODO echo -e "\nSTEP 2\n----\n"
#Step 2. count the png screenshots files
#get filename without extension
filename=$(basename -- "${1}")
#TODO echo "filename: "$filename
filename="${filename%.*}"
#TODO echo "filename: "$filename

COUNTFILES=$(ls "${filename}"*.png | wc -l)

#Step 3. create a subfolder to move and save the screenshots
if [ $COUNTFILES -eq 0 ]
then
    echo "No se generaron screenshots."
else
    echo "📄 Procesando $COUNTFILES screenshots..."
    OUTPUTFOLDER="screenshots_$(date +"%Y-%m-%d_%H%M%S")"  # "screenshots"
    mkdir -p $OUTPUTFOLDER
    #get filename without extension
	#filename=$(basename -- "${1}")
    #filename="${filename%.*}"
    mv "${filename}"-*.png $OUTPUTFOLDER
    cd $OUTPUTFOLDER   
fi
#TODO echo -e "STEP3 \n----\n----\n----\n"
#Step 3. Move,resize and compress png screenshots
WIDTH=800
WIDTHSMALL=560


#echo -e "listado de archivos:\n---\n $FILES \n---\n"
find . -type f -name "${filename}-*.png" -print0 | 
while IFS= read -r -d '' myfile; do
    #TODO echo -e "\n ARCHIVO: ${myfile}\n"
    name="${myfile%.*}"
    name="$(echo ${name} | cut -d/ -f2)" #delete ./ at beginning
    extension=${myfile##*.}
    #TODO echo -e "Nombre: ${name}\nExtensión: ${extension}";
    #TODO echo "name=$name"
    #TODO echo "extension=$name"
    #option 1. using RGB sRGB source: https://imagemagick.org/script/formats.php

    convert "${myfile}"  -bordercolor DarkGray  -border 2  -colorspace RGB   -resize ${WIDTH}x\>  -colorspace sRGB -colors 255 PNG8:"${name}"-normal.${extension}
    #TODO echo "first convert"    

    convert "${myfile}" -bordercolor DarkGray  -border 2 -colorspace RGB     -resize ${WIDTHSMALL}x\> -colorspace sRGB -colors 255  PNG8:"${name}"-small.${extension}

    mv "${myfile}" "${name}"-big.${extension}

    
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

