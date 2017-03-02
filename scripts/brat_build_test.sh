#!/bin/bash

if [ $# -lt 2 ]
then
  echo "Usage: $0 BRATDIR OUTDIR"
  exit 0
fi

brat_data_dirname=$1
output_dirname=$2

if [ -e $output_dirname ]
then
  echo "$output_dirname: Already exists"
  exit 1
fi

mkdir -p $output_dirname

for txt_file in $brat_data_dirname/*.txt
do
  doc=$(basename $txt_file .txt)
  bin/brat_to_stanford.py $brat_data_dirname $output_dirname/${doc}.col $doc
done
