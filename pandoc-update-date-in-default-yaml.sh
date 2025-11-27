#!/bin/bash

MYPATH=$HOME/.pandoc/metadata
MYTEMPLATE=mytemplate.yaml
MYMETADATAFILE=rpa.yaml

#CURRENT_DATE=$(date +%Y-%m-%d)
CURRENT_DATE=$(date +%B\ %d,\ %Y)
sed "s/MYDATE_PLACEHOLDER/$CURRENT_DATE/" ${MYPATH}/${MYTEMPLATE} > ${MYPATH}/${MYMETADATAFILE}

echo -e "date was updated in the yaml file:${MYPATH}/${MYMETADATAFILE}\n---"

