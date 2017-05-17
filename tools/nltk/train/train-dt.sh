#!/bin/bash

declare -a levels=("cat" "types" "subtypes" "filtered")

READER=nltk.corpus.reader.conll.ConllChunkCorpusReader
TRAIN=train_chunker.py
CHANGE=src/change_categories.py

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"	

	# support cutoff
	# for i in {7..12}
	for i in 3
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

	# entropy cutoff
	# for i in 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.11 0.12 0.13
	# do
	# 	printf "\n** entropy cutoff value "$i" **\n"
	# 	FOLDER=../outputs/repeat-$r/joined
	# 	MODEL=./models/repeat-$r/experiences/dt_entropy_cutoff/$i
		
	# 	for level in "${levels[@]}"
	# 	do
	# 		iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-$level.txt > $FOLDER/out-conll-$level-utf8.txt
	# 		python $CHANGE $level
	# 		time python $TRAIN $FOLDER --fileids out-conll-$level-utf8.txt --filename $MODEL/$level"_DecisionTree.pickle" --reader $READER --classifier DecisionTree --entropy_cutoff $i --no-eval
	# 	done
	# done

	# depth cutoff
	# for i in {70..120..10}
	# do
	# 	printf "\n** depth cutoff value "$i" **\n"
	# 	FOLDER=../outputs/repeat-$r/joined
	# 	MODEL=./models/repeat-$r/experiences/dt_depth_cutoff/$i
		
	# 	for level in "${levels[@]}"
	# 	do
	# 		iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-$level.txt > $FOLDER/out-conll-$level-utf8.txt
	# 		python $CHANGE $level
	# 		time python $TRAIN $FOLDER --fileids out-conll-$level-utf8.txt --filename $MODEL/$level"_DecisionTree.pickle" --reader $READER --classifier DecisionTree --depth_cutoff $i --no-eval
	# 	done
	# done
done