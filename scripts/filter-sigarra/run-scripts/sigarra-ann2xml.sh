#!/bin/bash

SCRIPT=../../../brat/tools/anntoxml.py
CORPUS_PATH=../../../brat/data/sigarra-corpus-csv

for dir in "$CORPUS_PATH"/*
do
	if [[ -d $dir ]];then
		for file in $dir/*.ann
		do
			if [[ -f $file ]]; then
				OUT_NAME=$(echo "$file" | sed "s/.*\///" | sed "s/\..*//")
				OUT_PATH=../outputs/all-xml
				python $SCRIPT -r "DOC" $file -o $OUT_PATH/$OUT_NAME".xml"
			fi
		done
	fi
done
