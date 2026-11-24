#!/bin/bash
for file in "$@"
do
    lp "$file"
done
