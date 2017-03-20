#!/bin/bash

for i in {0..9}
do
	printf "\n***** fold "$i" *****\n"
	java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/fold-"$i"/cat_train.xml" > "../outputs/fold-"$i"/t_cat_train.txt"
	java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/fold-"$i"/cat_test.xml" > "../outputs/fold-"$i"/t_cat_test.txt"

	java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/fold-"$i"/types_train.xml" > "../outputs/fold-"$i"/t_types_train.txt"
	java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/fold-"$i"/types_test.xml" > "../outputs/fold-"$i"/t_types_test.txt"

	java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/fold-"$i"/subtypes_train.xml" > "../outputs/fold-"$i"/t_subtypes_train.txt"
	java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/fold-"$i"/subtypes_test.xml" > "../outputs/fold-"$i"/t_subtypes_test.txt"

	java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/fold-"$i"/filtered_train.xml" > "../outputs/fold-"$i"/t_filtered_train.txt"
	java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/fold-"$i"/filtered_test.xml" > "../outputs/fold-"$i"/t_filtered_test.txt"
done

