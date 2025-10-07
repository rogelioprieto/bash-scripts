#!/bin/bash
outputfile=ALLDATASET-utf8-datetime-include-manual-readings.csv
pathdatasetmanual="datasets-monitoreo-6-semanas/"
cat 01-dataset-RPA-ALL-lecturas-manuales-diciembre-2024.csv > ${outputfile} && \
tail +2 1-Datos-28-29-Enero-resample-asfreq.csv >> ${outputfile} && \
tail +2 ALLDATASET-utf8-datetime.csv >> ${outputfile} && \
tail +2 ${pathdatasetmanual}/0.\ Monitoreo\ del\ 31-Enero\ al\ 5-Feb.csv >> ${outputfile}

wc -l 01-dataset-RPA-ALL-lecturas-manuales-diciembre-2024.csv \
1-Datos-28-29-Enero-resample-asfreq.csv \
ALLDATASET-utf8-datetime.csv \
${pathdatasetmanual}0.\ Monitoreo\ del\ 31-Enero\ al\ 5-Feb.csv
echo "------restar (n files)-1 líneas de header y es igual a:"
wc -l ${outputfile}




