#!/bin/bash

MYPATH=$HOME/.pandoc

#CURRENT_DATE=$(date +%Y-%m-%d)
CURRENT_DATE=$(date +%B\ %d,\ %Y)
sed "s/MYDATE_PLACEHOLDER/$CURRENT_DATE/" ${MYPATH}/mytemplate.yaml > ${MYPATH}/output.yaml
