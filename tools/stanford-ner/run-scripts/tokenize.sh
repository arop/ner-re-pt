#!/bin/bash

HAREM=../../../scripts/filter-harem

for r in {0..3}
do
	printf "\n***** repeat "$r" *****\n"
	for i in {0..9}
	do
		FOLDER=outputs/repeat-$r/fold-$i
		printf "\n***** fold "$i" *****\n"
		java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < $HAREM"/"$FOLDER"/cat_train.xml" > "../"$FOLDER"/t_cat_train.txt"
		java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < $HAREM"/"$FOLDER"/cat_test.xml" > "../"$FOLDER"/t_cat_test.txt"

		java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < $HAREM"/"$FOLDER"/types_train.xml" > "../"$FOLDER"/t_types_train.txt"
		java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < $HAREM"/"$FOLDER"/types_test.xml" > "../"$FOLDER"/t_types_test.txt"

		java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < $HAREM"/"$FOLDER"/subtypes_train.xml" > "../"$FOLDER"/t_subtypes_train.txt"
		java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < $HAREM"/"$FOLDER"/subtypes_test.xml" > "../"$FOLDER"/t_subtypes_test.txt"

		java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < $HAREM"/"$FOLDER"/filtered_train.xml" > "../"$FOLDER"/t_filtered_train.txt"
		java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < $HAREM"/"$FOLDER"/filtered_test.xml" > "../"$FOLDER"/t_filtered_test.txt"
	done
done
