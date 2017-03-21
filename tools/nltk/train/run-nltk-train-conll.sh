#!/bin/bash

READER=nltk.corpus.reader.conll.ConllChunkCorpusReader
for i in {0..9}
do
	printf "\n** fold "$i" **\n"
	FOLDER=../outputs/fold-$i
	MODEL=./models/fold-$i
	# CATEGORIES
	#iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-cat.txt > ../outputs/fold-$i/out-conll-cat-utf8.txt
	#python change_categories.py cat
	#python train_chunker.py $FOLDER --fileids 'out-conll-cat-utf8.txt' --filename $MODEL/cat_NaiveBayes --reader $READER --classifier NaiveBayes
	#python train_chunker.py $FOLDER --fileids 'out-conll-cat-utf8.txt' --filename $MODEL/cat_Maxent --reader $READER --classifier Maxent
	#python train_chunker.py $FOLDER --fileids 'out-conll-cat-utf8.txt' --filename $MODEL/cat_DecisionTree --reader $READER --classifier DecisionTree

	# TYPES
	#iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-types.txt > $FOLDER/out-conll-types-utf8.txt
	#python change_categories.py types
	#python train_chunker.py $FOLDER --fileids 'out-conll-types-utf8.txt' --filename $MODEL/types_NaiveBayes --reader $READER --classifier NaiveBayes
	#python train_chunker.py $FOLDER --fileids 'out-conll-types-utf8.txt' --filename $MODEL/types_Maxent --reader $READER --classifier Maxent
	#python train_chunker.py $FOLDER --fileids 'out-conll-types-utf8.txt' --filename $MODEL/types_DecisionTree --reader $READER --classifier DecisionTree

	# SUBTYPES
	#iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-subtypes.txt > $FOLDER/out-conll-subtypes-utf8.txt
	#python change_categories.py subtypes
	#python train_chunker.py $FOLDER --fileids 'out-conll-subtypes-utf8.txt' --filename $MODEL/subtypes_NaiveBayes --reader $READER --classifier NaiveBayes
	#python train_chunker.py $FOLDER --fileids 'out-conll-subtypes-utf8.txt' --filename $MODEL/subtypes_Maxent --reader $READER --classifier Maxent
	#python train_chunker.py $FOLDER --fileids 'out-conll-subtypes-utf8.txt' --filename $MODEL/subtypes_DecisionTree --reader $READER --classifier DecisionTree

	# FILTERED
	iconv -f ISO-8859-1 -t UTF-8 $FOLDER/out-conll-filtered.txt > $FOLDER/out-conll-filtered-utf8.txt
	python change_categories.py filtered
	python train_chunker.py $FOLDER --fileids 'out-conll-filtered-utf8.txt' --filename $MODEL/filtered_NaiveBayes --reader $READER --classifier NaiveBayes
	python train_chunker.py $FOLDER --fileids 'out-conll-filtered-utf8.txt' --filename $MODEL/filtered_Maxent --reader $READER --classifier Maxent
	python train_chunker.py $FOLDER --fileids 'out-conll-filtered-utf8.txt' --filename $MODEL/filtered_DecisionTree --reader $READER --classifier DecisionTree
done