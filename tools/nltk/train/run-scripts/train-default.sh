#!/bin/bash

declare -a levels=("cat" "types" "subtypes" "filtered")

READER=nltk.corpus.reader.conll.ConllChunkCorpusReader
TRAIN=../train_chunker.py
CHANGE=../src/change_categories.py

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"	

	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"
		FOLDER=../../outputs/repeat-$r/fold-$i
		MODEL=../models/repeat-$r/fold-$i
		
		for level in "${levels[@]}"
		do
			iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-$level.txt > $FOLDER/out-conll-$level-utf8.txt
			python $CHANGE $level
			time python $TRAIN $FOLDER --fileids out-conll-$level-utf8.txt --filename $MODEL/$level_NaiveBayes.pickle --reader $READER --classifier NaiveBayes --no-eval
			time python $TRAIN $FOLDER --fileids out-conll-$level-utf8.txt --filename $MODEL/$level_Maxent.pickle --reader $READER --classifier Maxent --no-eval
			time python $TRAIN $FOLDER --fileids out-conll-$level-utf8.txt --filename $MODEL/$level_DecisionTree.pickle --reader $READER --classifier DecisionTree --no-eval
		done
	done
done