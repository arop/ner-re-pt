#!/bin/bash

READER=nltk.corpus.reader.conll.ConllChunkCorpusReader
TRAIN=../train_chunker.py
CHANGE=../src/change_categories.py

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"	

	FOLDER=../../outputs/repeat-$r/sigarra
	MODEL=../models/repeat-$r/sigarra

	# ME best
	ME_MAX_ITER=100
	ME_MIN_LLDELTA=0

	# DT best
	ENTROPY_CUTOFF=0.08
	SUPPORT_CUTOFF=16

	python $CHANGE sigarra
	# time python $TRAIN $FOLDER --fileids out-conll-sigarra.txt --filename $MODEL/sigarra_NaiveBayes.pickle --reader $READER --classifier NaiveBayes --no-eval

	# time python $TRAIN $FOLDER --fileids out-conll-sigarra.txt --filename $MODEL/sigarra_Maxent.pickle --reader $READER --classifier Maxent --max_iter $ME_MAX_ITER --min_lldelta $ME_MIN_LLDELTA --no-eval
	# time python $TRAIN $FOLDER --fileids out-conll-sigarra.txt --filename $MODEL/sigarra_Maxent-default.pickle --reader $READER --classifier Maxent --no-eval

	# time python $TRAIN $FOLDER --fileids out-conll-sigarra.txt --filename $MODEL/sigarra_DecisionTree.pickle --reader $READER --classifier DecisionTree --entropy_cutoff $ENTROPY_CUTOFF --support_cutoff $SUPPORT_CUTOFF --no-eval
	time python $TRAIN $FOLDER --fileids out-conll-sigarra.txt --filename $MODEL/sigarra_DecisionTree-default.pickle --reader $READER --classifier DecisionTree --no-eval
done