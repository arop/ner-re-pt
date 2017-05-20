#!/bin/bash

READER=nltk.corpus.reader.conll.ConllChunkCorpusReader
TRAIN=../train_chunker.py
CHANGE=../src/change_categories.py

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"	

	FOLDER=../../outputs/repeat-$r/sigarra
	MODEL=../models/repeat-$r/sigarra

	python $CHANGE sigarra
	time python $TRAIN $FOLDER --fileids out-conll-sigarra.txt --filename $MODEL/sigarra_NaiveBayes.pickle --reader $READER --classifier NaiveBayes --no-eval
	# time python $TRAIN $FOLDER --fileids out-conll-sigarra.txt --filename $MODEL/sigarra_Maxent.pickle --reader $READER --classifier Maxent --no-eval
	# time python $TRAIN $FOLDER --fileids out-conll-sigarra.txt --filename $MODEL/sigarra_DecisionTree.pickle --reader $READER --classifier DecisionTree --no-eval
done