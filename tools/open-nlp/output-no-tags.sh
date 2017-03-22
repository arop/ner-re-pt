#!/bin/bash

SCRIPT="src/output-no-tags.py"
for r in {1..3}
do
	printf "\n** repeat "$r" **\n"
	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"
		FOLDER=outputs/repeat-$r/fold-$i
		python $SCRIPT $FOLDER"/cat_test_sent_doc.xml" $FOLDER"/cat_test_sent_doc-clean.xml"
		python $SCRIPT $FOLDER"/types_test_sent_doc.xml" $FOLDER"/types_test_sent_doc-clean.xml"
		python $SCRIPT $FOLDER"/subtypes_test_sent_doc.xml" $FOLDER"/subtypes_test_sent_doc-clean.xml"
		python $SCRIPT $FOLDER"/filtered_test_sent_doc.xml" $FOLDER"/filtered_test_sent_doc-clean.xml"
	done
done