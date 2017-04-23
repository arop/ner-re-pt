#!/bin/bash

READER=nltk.corpus.reader.conll.ConllChunkCorpusReader

# 12h30 for repeats 1..3
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"	

	# 202min + 45min = 4h
	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"
		FOLDER=../outputs/repeat-$r/fold-$i
		MODEL=./models/repeat-$r/fold-$i
		
		# CATEGORIES
		iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-cat.txt > $FOLDER/out-conll-cat-utf8.txt
		python change_categories.py cat
		time python train_chunker.py $FOLDER --fileids 'out-conll-cat-utf8.txt' --filename $MODEL/cat_NaiveBayes.pickle --reader $READER --classifier NaiveBayes --no-eval
		time python train_chunker.py $FOLDER --fileids 'out-conll-cat-utf8.txt' --filename $MODEL/cat_Maxent.pickle --reader $READER --classifier Maxent --no-eval
		time python train_chunker.py $FOLDER --fileids 'out-conll-cat-utf8.txt' --filename $MODEL/cat_DecisionTree.pickle --reader $READER --classifier DecisionTree --no-eval

		# TYPES
		iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-types.txt > $FOLDER/out-conll-types-utf8.txt
		python change_categories.py types
		time python train_chunker.py $FOLDER --fileids 'out-conll-types-utf8.txt' --filename $MODEL/types_NaiveBayes.pickle --reader $READER --classifier NaiveBayes --no-eval
		time python train_chunker.py $FOLDER --fileids 'out-conll-types-utf8.txt' --filename $MODEL/types_Maxent.pickle --reader $READER --classifier Maxent --no-eval
		time python train_chunker.py $FOLDER --fileids 'out-conll-types-utf8.txt' --filename $MODEL/types_DecisionTree.pickle --reader $READER --classifier DecisionTree --no-eval

		# SUBTYPES
		iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-subtypes.txt > $FOLDER/out-conll-subtypes-utf8.txt
		python change_categories.py subtypes
		time python train_chunker.py $FOLDER --fileids 'out-conll-subtypes-utf8.txt' --filename $MODEL/subtypes_NaiveBayes.pickle --reader $READER --classifier NaiveBayes --no-eval
		time python train_chunker.py $FOLDER --fileids 'out-conll-subtypes-utf8.txt' --filename $MODEL/subtypes_Maxent.pickle --reader $READER --classifier Maxent --no-eval
		time python train_chunker.py $FOLDER --fileids 'out-conll-subtypes-utf8.txt' --filename $MODEL/subtypes_DecisionTree.pickle --reader $READER --classifier DecisionTree --no-eval

		# FILTERED 45min
		iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-filtered.txt > $FOLDER/out-conll-filtered-utf8.txt
		python change_categories.py filtered
		time python train_chunker.py $FOLDER --fileids 'out-conll-filtered-utf8.txt' --filename $MODEL/filtered_NaiveBayes.pickle --reader $READER --classifier NaiveBayes --no-eval
		time python train_chunker.py $FOLDER --fileids 'out-conll-filtered-utf8.txt' --filename $MODEL/filtered_Maxent.pickle --reader $READER --classifier Maxent --no-eval
		time python train_chunker.py $FOLDER --fileids 'out-conll-filtered-utf8.txt' --filename $MODEL/filtered_DecisionTree.pickle --reader $READER --classifier DecisionTree --no-eval
	done
done