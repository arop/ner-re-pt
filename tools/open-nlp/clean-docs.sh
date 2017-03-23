#!/bin/bash

SCRIPT="src/clean-doc.py"

for r in {1..3}
do
	printf "\n** repeat "$r" **\n"
	for i in {0..9}
	do
		FOLDER=outputs/repeat-$r/fold-$i
		printf "\n** fold "$i" **\n"
		python $SCRIPT $FOLDER"/cat_train_sent_doc.xml" $FOLDER"/cat_train_sent_doc.xml"
		python $SCRIPT $FOLDER"/cat_test_sent_doc.xml" $FOLDER"/cat_test_sent_doc.xml"

		python $SCRIPT $FOLDER"/types_train_sent_doc.xml" $FOLDER"/types_train_sent_doc.xml"
		python $SCRIPT $FOLDER"/types_test_sent_doc.xml" $FOLDER"/types_test_sent_doc.xml"

		python $SCRIPT $FOLDER"/subtypes_train_sent_doc.xml" $FOLDER"/subtypes_train_sent_doc.xml"
		python $SCRIPT $FOLDER"/subtypes_test_sent_doc.xml" $FOLDER"/subtypes_test_sent_doc.xml"

		python $SCRIPT $FOLDER"/filtered_train_sent_doc.xml" $FOLDER"/filtered_train_sent_doc.xml"
		python $SCRIPT $FOLDER"/filtered_test_sent_doc.xml" $FOLDER"/filtered_test_sent_doc.xml"
	done
done