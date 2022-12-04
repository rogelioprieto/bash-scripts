#!/bin/awk

#author: Rogelio Prieto Alvarado
#29/march/2022
#Objective: create the "CREATE TABLE" statement for postgreSQL from a tsv file.

BEGIN{FS="\t"; mytext="CREATE TABLE "tablename"("} {for(i=1;i<NF;i++) mytext=mytext"\""$i"\" varchar(200),";} END {print substr(mytext, 1, length(mytext)-1)");";}

#Example. How to execute:
#head -1 metadatos_depurados.tsv | awk -v tablename=metadatos01 -f ~/Desktop/awk-create-table.sh