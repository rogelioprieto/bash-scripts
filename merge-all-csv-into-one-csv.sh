#!/bin/bash
#Objetive: join all csv files into one file. First line is the header.
#Date: 19/sept/2025
#Rogelio Prieto


#head -1 0.\ Monitoreo\ del\ 31-Enero\ al\ 5-Feb.csv > myall.txt; for f in *.csv; do   echo "${f}"; sed '1d' "${f}">> myall.txt;  done

outputfile=TESTING.txt
extension=csv
#add the header to the outputfile
#ls -1 *.$extension | head -1 > ${outputfile}
#ls -1 *.csv | head -1  | tr "\n" " " | sed "s/\ $//" | xargs -0 head -1 > ${outputfile}
ls -1 *.csv | head -1 > ${outputfile}


#add each file (without headers) to the output
for f in *.$extension; do
    #echo "${f}"
    sed '1d' "${f}">> ${outputfile}
done

#show statistics
echo -e "Statistics\n"
echo -e "INPUT\n---"
wc -l *.csv
echo -e "---\nOUTPUT\n---"
wc -l "${outputfile}"
#calculate the headers lines omitted in the output file
headers=$(ls -1 *.csv | wc -l)
echo "NOTE. Consider $(($headers-1)) lines less in the outputfile due to just one header line is keeped."
echo "---"
