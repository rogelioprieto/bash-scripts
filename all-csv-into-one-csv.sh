#!/bin/bash
# objetive: join all csv files into one file. First line is the header.
# date: 19/sept/2025
# Rogelio Prieto


#head -1 0.\ Monitoreo\ del\ 31-Enero\ al\ 5-Feb.csv > myall.txt; for f in *.csv; do   echo "${f}"; sed '1d' "${f}">> myall.txt;  done

outputfile="merge-at-$(date +"%Y-%m-%d_%H%M%S")".csv
extension=csv

# create an empty array to store inputfiles
declare -a inputfiles

# populate the array with inputfiles, handling spaces correctly
# the 'nullglob' option ensures that patterns that match no files expand to nothing.
# the 'dotglob' option ensures that inputfiles starting with a dot are included.
# the 'extglob' option enables extended pattern matching features.
shopt -s nullglob dotglob extglob

# loop through all files and directories in the current directory
# the '*.csv' wildcard matches all files and directories.
for file in *.$extension; do
    # Add each file/directory name to the array
    inputfiles+=("$file")
done


# add the header to the outputfile
head -1 "$inputfiles" > ${outputfile}
#echo "press a key to continue..."; read -n 1

# add each file (without headers) to the output
for f in "${inputfiles[@]}"; do
    #echo "${f}"
    sed '1d' "${f}">> ${outputfile}
done

# show statistics
echo -e "Statistics\n"
echo -e "INPUT\n---\nLINES FILENAMES"
wc -l "${inputfiles[@]}"
echo -e "---\n\nOUTPUT\n---"
wc -l "${outputfile}"
# calculate the headers lines omitted in the output file
# lenght of array
headers=${#inputfiles[@]}
echo "NOTE. Consider $(($headers-1)) lines less in the outputfile due to just one header line is keeped."
echo "---"
