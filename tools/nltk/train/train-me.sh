#!/bin/bash

declare -a levels=("cat" "types" "subtypes" "filtered")

READER=nltk.corpus.reader.conll.ConllChunkCorpusReader
TRAIN=train_chunker.py
CHANGE=src/change_categories.py

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"	

	for i in {10..120..10}
	do
		printf "\n** iter value "$i" **\n"
		FOLDER=../outputs/repeat-$r/joined
		MODEL=./models/repeat-$r/experiences/me_max_iter/$i
		
		for level in "${levels[@]}"
		do
			iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-$level.txt > $FOLDER/out-conll-$level-utf8.txt
			python $CHANGE $level
			time python $TRAIN $FOLDER --fileids out-conll-$level-utf8.txt --filename $MODEL/$level"_Maxent.pickle" --reader $READER --classifier Maxent --max_iter $i --no-eval
		done
	done
done