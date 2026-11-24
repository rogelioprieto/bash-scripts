#!/bin/bash

MDFILENAME="html-links-$(date "+%Y-%m-%d_%H%M%S").md"
ls *.html | xargs -I {} echo -e "[{}]({})\n"
ls *.html | xargs -I {} echo -e "[{}]({})\n" > $MDFILENAME

echo -e  "---\n${MDFILENAME} was created with "`(ls *.html | wc -l)`" links."
