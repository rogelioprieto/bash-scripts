#!/bin/bash
#this script remove all temporal files generated by latex

#has too many parameters, then exit

if [ $# -gt 1 ]; then
	echo "too much parameters."
	echo "try 'rm-aux-latexfiles --help' for more information."
	exit 1

fi

#echo "es ayuda?"
if [ "$1" = '--help' ]; then
	#echo "está consultando la ayuda"
	echo "rm-aux-latexfiles [path]"
	echo "[path] is the folder where you want to delete the auxiliar LaTeX files."
	echo "This script deletes the *.aux, *.bbl, *.blg, *.fdb_latexmk, *.fls, *.log, *.out, *.synctex*.gz, *.toc, *.lol, *.lot, *.snm, *.vrb, *.nav, *.idx, *.ilg, *.ind,*.glo,*.gls,*.glg, *.sta *.stp files."
	exit 1

fi
#echo "tiene $# parametros"
if [ $# -eq 1 ]; then
	#echo "path:$(pwd)"
	echo "Folder:$1"
	cd "$1"
	
fi



rm -f *.{aux,bbl,blg,fdb_latexmk,fls,log,out,synctex.gz,toc,lol,lot,snm,vrb,nav,idx,ilg,ind,glo,gls,glg,sta,stp} 
echo "%---------------------------------------------------------"
echo "Se eliminaron los archivos temporales generados por LaTeX."
echo "*.aux,*.bbl,*.blg,*.fdb_latexmk,*.fls,*.log,*.out,"
echo "*.synctex.gz,*.toc,*.lol,*.lot,*.snm,*.vrb,*.nav,"
echo "*.idx,*.ilg,*.ind,*.glo,*.gls,*.glg, *.sta *.stp"
echo "%---------------------------------------------------------"
