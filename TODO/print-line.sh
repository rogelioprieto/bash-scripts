##1. print specific line
#option 1
awk 'NR==3{ print; }' file.txt
#option 1 - short way
awk 'NR==3' file.txt

#option 2
sed -n 3p file.txt

#option 2b - print range (lines 2 to 4)
sed -n 2,4p file. txt


## 2. print last line
tail -1 file.txt
sed -n '$p' file.txt 





#get line where pattern was found
#option 1A. number line and textline
grep -n  ua file.txt 
#option 1B. number line 
grep -n  ua file.txt | (read STR; echo ${STR:0:1})





#other example
#the first delimiter (,) is mandatory, the second delimeter is optional
awk -F', ?' '{print $3}' <<< "Rogelio,Masculino,30,MEX"
awk -F', ?' '{print $3}' <<< "Rogelio, Masculino, 30, MEX"

#any of two delimiter (field separator)  combination
awk -F'[, ]+' '{print $3}' <<< "Rogelio, Masculino, 30, MEX"


#search text but only print line number 
#have an error at extract substring
nl  ~/.bash_history | grep git  | head -1 | (read line; echo ${line:0:1})
nl  ~/.bash_history | grep git  | head -1 | (read line; echo ${line:4:1} )
#it works! (the expansion delete spaces at the begining)
nl  ~/.bash_history | grep git  | head -1 |  (read myvar; echo  ${myvar##*( )}) | cut -d' ' -f1
## best solution:
grep -n tres file.txt | head -1 | cut -d: -f1
## another best solution:
awk -F, '/tres/  {print NR; exit}' file.txt




#columns numbered from csv file
head -1 metadatos_depurados.tsv | tr "\t" "\n" | nl
