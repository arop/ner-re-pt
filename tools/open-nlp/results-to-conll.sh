#!/bin/bash

SCRIPT="src/tokenize_from_opennlp_format.py"
for r in {1..3}
do
	printf "\n** repeat "$r" **\n"
	
	for i in {0..9}
	do
		FOLDER=repeat-$r/fold-$i
		printf "\n** fold "$i" **\n"
		
		python $SCRIPT "train/results/"$FOLDER"/out-cat.txt" "outputs/ner-results/"$FOLDER"/out-cat.txt" "UTF-8"
		python $SCRIPT "train/results/"$FOLDER"/out-types.txt" "outputs/ner-results/"$FOLDER"/out-types.txt" "UTF-8"
		python $SCRIPT "train/results/"$FOLDER"/out-subtypes.txt" "outputs/ner-results/"$FOLDER"/out-subtypes.txt" "UTF-8"
		python $SCRIPT "train/results/"$FOLDER"/out-filtered.txt" "outputs/ner-results/"$FOLDER"/out-filtered.txt" "UTF-8"

		python $SCRIPT "outputs/"$FOLDER"/cat_test_sent_doc.xml" "outputs/ner-results/"$FOLDER"/out-cat-gold.txt" "ISO-8859-1"
		python $SCRIPT "outputs/"$FOLDER"/types_test_sent_doc.xml" "outputs/ner-results/"$FOLDER"/out-types-gold.txt" "ISO-8859-1"
		python $SCRIPT "outputs/"$FOLDER"/subtypes_test_sent_doc.xml" "outputs/ner-results/"$FOLDER"/out-subtypes-gold.txt" "ISO-8859-1"
		python $SCRIPT "outputs/"$FOLDER"/filtered_test_sent_doc.xml" "outputs/ner-results/"$FOLDER"/out-filtered-gold.txt" "ISO-8859-1"
	done
done