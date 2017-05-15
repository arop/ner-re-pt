#!/bin/bash

declare -a levels=("cat" "types" "subtypes" "filtered")

READER=nltk.corpus.reader.conll.ConllChunkCorpusReader
TRAIN=train_chunker.py
CHANGE=src/change_categories.py

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"	

	# support cutoff
	for i in {7..12}
	do
		printf "\n** support cutoff value "$i" **\n"
		FOLDER=../outputs/repeat-$r/joined
		MODEL=./models/repeat-$r/experiences/dt_support_cutoff/$i
		
		for level in "${levels[@]}"
		do
			iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-$level.txt > $FOLDER/out-conll-$level-utf8.txt
			python $CHANGE $level
			time python $TRAIN $FOLDER --fileids out-conll-$level-utf8.txt --filename $MODEL/$level"_DecisionTree.pickle" --reader $READER --classifier DecisionTree --support_cutoff $i --no-eval
		done
	done
done