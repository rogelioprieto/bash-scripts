#!/bin/bash
#author: Rogelio Prieto Alvarado
#3/may/2025
#Objective: convert tables in docx to markdown tables with simple syntax, like this:
#First Header  | Second Header
#------------- | -------------
#Content Cell  | Content Cell
#Content Cell  | Content Cell

#Sources:
# https://stackoverflow.com/a/68521046
# https://stackoverflow.com/a/47038804
# https://pandoc.org/MANUAL.html#extension-pipe_tables
# to see a list of markdown extensions, you  can execute:
# pandoc --list-extensions=markdown


#⚠️IMPORTANT NOTE:
# You'll have to make sure that your table is a "simple" table.
# That means it shouldn't contain any linebreaks and the only block level 
# content is Paragraphs (i.e. no lists, code blocks, blockquotes, etc).
# Then, your command should work. Otherwise, your table is not representable
# as a pipe table, thus pandoc falls back to HTML.


if [ $# -eq 0 ]
then
 	#no parameters received
	echo "You should specify filename.docx (first parameter)"
	echo "Sintaxis: convert-tables-from-docx-to-markdown.sh filename.docx"
	echo "Example:"
	echo "convert-docx-to-markdown-simple-tables.sh mydocument.docx"
	exit 1
else
	if [ $# -le 2 ] #has 1 or 2 parameters
	then
		if [ -f "${1}" ] #validate file exists
		then
			echo "ℹ️  Procesando el archivo: ${1}"	
			if [ $# -eq 1 ] #one parameter: the docx filename
			then
			    OUTPUTFILENAME=$(basename -- "${1}")
                OUTPUTFILENAME="${OUTPUTFILENAME%.*}"
                OUTPUTFILENAME="${OUTPUTFILENAME}""__$(date +"%Y-%m-%d_%H%M%S").md"
                
                OUTPUTFOLDER=$(dirname "${1}")
                echo "OUTPUTFOLDER:"${OUTPUTFOLDER}
            
			    if [ -n "${OUTPUTFOLDER}" ]  # "OUTPUTFOLDER is not empty!"
			    then
			        OUTPUTFOLDER="${OUTPUTFOLDER}/"		    
			    fi			
                
                
            else
                if [ $# -eq 2 ] #two parameters: the docx filename and output filename
                then
                    OUTPUTFILENAME="${2}" #contains the filename or path and filename
                    OUTPUTFOLDER=""
                fi
			fi
			
 		    pandoc --from docx --to markdown+pipe_tables+simple_tables-multiline_tables-grid_tables  "${1}" -o  "${OUTPUTFOLDER}${OUTPUTFILENAME}"
		    echo "📄 Se generó el archivo ${OUTPUTFOLDER}${OUTPUTFILENAME}"
		else
			echo "⚠️  No existe el archivo: ${1}"
			exit 1
		fi
	fi
fi

