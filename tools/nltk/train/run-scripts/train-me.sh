#!/bin/bash

declare -a levels=("cat" "types" "subtypes" "filtered")

READER=nltk.corpus.reader.conll.ConllChunkCorpusReader
TRAIN=../train_chunker.py
CHANGE=../src/change_categories.py

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"	

	# max_iter
	# for i in {10..120..10}
	# do
	# 	printf "\n** iter value "$i" **\n"
	# 	FOLDER=../../outputs/repeat-$r/joined
	# 	MODEL=../models/repeat-$r/experiences/me_max_iter/$i
		
	# 	for level in "${levels[@]}"
	# 	do
	# 		iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-$level.txt > $FOLDER/out-conll-$level-utf8.txt
	# 		python $CHANGE $level
	# 		time python $TRAIN $FOLDER --fileids out-conll-$level-utf8.txt --filename $MODEL/$level"_Maxent.pickle" --reader $READER --classifier Maxent --max_iter $i --no-eval
	# 	done
	# done

	# min_lldelta
	# for i in 0 0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.05 0.1 0.15 0.2
	# do
	# 	printf "\n** min_lldelta "$i" **\n"
	# 	FOLDER=../../outputs/repeat-$r/joined
	# 	MODEL=../models/repeat-$r/experiences/me_min_lldelta/$i
		
	# 	for level in "${levels[@]}"
	# 	do
	# 		iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-$level.txt > $FOLDER/out-conll-$level-utf8.txt
	# 		python $CHANGE $level
	# 		time python $TRAIN $FOLDER --fileids out-conll-$level-utf8.txt --filename $MODEL/$level"_Maxent.pickle" --reader $READER --classifier Maxent --min_lldelta $i --no-eval
	# 	done
	# done

	# min_lldelta with max_iter = 100
	printf "\n** max_iter = 100 **\n"
	for i in 0 0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.05 0.1 0.15 0.2
	do
		printf "\n** min_lldelta "$i" **\n"
		FOLDER=../../outputs/repeat-$r/joined
		MODEL=../models/repeat-$r/experiences/me_min_lldelta-iter-100/$i
		
		for level in "${levels[@]}"
		do
			iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-$level.txt > $FOLDER/out-conll-$level-utf8.txt
			python $CHANGE $level
			time python $TRAIN $FOLDER --fileids out-conll-$level-utf8.txt --filename $MODEL/$level"_Maxent.pickle" --reader $READER --classifier Maxent --max_iter 100 --min_lldelta $i --no-eval
		done
	done


done