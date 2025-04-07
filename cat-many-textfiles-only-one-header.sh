#!/bin/bash
cat F1-xy-variables.csv > all-BORRAR.csv && echo "F2-xy-variables.csv M1-xy-variables.csv  M2-xy-variables.csv" | xargs -t -n1 tail +2 >> all-BORRAR.csv && wc -l all-BORRAR.csv

