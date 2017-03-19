#!/bin/bash

# from https://github.com/newsreader/evaluation/tree/master/nerc-evaluation
# 04-setup-test-for-conll03-script.sh
# ./script output golden > outfile

PREDICTION=$1
REFERENCE=$2
awk ' { print $NF } ' $PREDICTION | paste - $REFERENCE | awk ' { print $2" "$NF" "$1 } ' | perl -pe 's/\t//g' | sed 's/B-/I-/g' 
