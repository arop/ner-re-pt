#!/bin/bash

printf "\n*** tokenizing ***\n"
SCRIPT="src/tokenize_from_opennlp_format.py"

for r in {1..3}
do
	printf "\n** repeat "$r" **\n"

	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"
		FOLDER=../../open-nlp/outputs/repeat-$r/fold-$i
		OUT=../outputs/repeat-$r/fold-$i

		python $SCRIPT $FOLDER'/cat_train_sent_doc.xml' $OUT'/t-cat-train-doc.txt'
		python $SCRIPT $FOLDER'/cat_test_sent_doc.xml' $OUT'/t-cat-test-doc.txt'

		python $SCRIPT $FOLDER'/types_train_sent_doc.xml' $OUT'/t-types-train-doc.txt'
		python $SCRIPT $FOLDER'/types_test_sent_doc.xml' $OUT'/t-types-test-doc.txt'

		python $SCRIPT $FOLDER'/subtypes_train_sent_doc.xml' $OUT'/t-subtypes-train-doc.txt'
		python $SCRIPT $FOLDER'/subtypes_test_sent_doc.xml' $OUT'/t-subtypes-test-doc.txt'

		python $SCRIPT $FOLDER'/filtered_train_sent_doc.xml' $OUT'/t-filtered-train-doc.txt'
		python $SCRIPT $FOLDER'/filtered_test_sent_doc.xml' $OUT'/t-filtered-test-doc.txt'
	done
done