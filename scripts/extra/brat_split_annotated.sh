#!/bin/bash

if [ $# -lt 3 ]
then
  echo "Usage: $0 BRATDIR TRAINDIR TESTDIR"
  exit 1
fi

brat_data_dirname=$1
train_dirname=$2
test_dirname=$3

if [ ! -e $brat_data_dirname ]
then
  echo "$brat_data_dirname: No such file or directory"
  exit 2
fi

if [ -e $train_dirname ]
then
  echo "$train_dirname: Directory already exists"
  exit 2
fi

if [ -e $test_dirname ]
then
  echo "$test_dirname: Directory already exists"
  exit 2
fi

annotated_docs=$(find $brat_data_dirname -maxdepth 1 -size +0 -name '*.ann' -exec basename '{}' .ann \;)
annotated_size=$(printf "%s\n" $annotated_docs | wc -l)
test_size=$(echo "scale=0; ($annotated_size * 0.3) / 1" | bc)
test_docs=$(printf "%s\n" $annotated_docs | shuf -n $test_size)

mkdir -p $train_dirname
mkdir -p $test_dirname

for annotated_doc in $annotated_docs
do
  cp $brat_data_dirname/${annotated_doc}.ann $train_dirname
  cp $brat_data_dirname/${annotated_doc}.txt $train_dirname
done

for test_doc in $test_docs
do
  mv $train_dirname/${test_doc}.ann $test_dirname
  mv $train_dirname/${test_doc}.txt $test_dirname
done
