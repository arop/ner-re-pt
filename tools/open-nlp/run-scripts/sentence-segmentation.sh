#!/bin/bash

PATH_IN="../../../scripts/filter-harem/harem-to-opennlp/outputs/"
SCRIPT="../src/sentence-segmentation.py"

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	for i in {0..9}
	do
		FOLDER=../outputs/repeat-$r/fold-$i
		printf "\n** fold "$i" **\n"
		python $SCRIPT $PATH_IN$FOLDER"/cat_train_doc.xml" $FOLDER"/cat_train_sent_doc.xml"
		python $SCRIPT $PATH_IN$FOLDER"/cat_test_doc.xml" $FOLDER"/cat_test_sent_doc.xml"

		python $SCRIPT $PATH_IN$FOLDER"/types_train_doc.xml" $FOLDER"/types_train_sent_doc.xml"
		python $SCRIPT $PATH_IN$FOLDER"/types_test_doc.xml" $FOLDER"/types_test_sent_doc.xml"

		python $SCRIPT $PATH_IN$FOLDER"/subtypes_train_doc.xml" $FOLDER"/subtypes_train_sent_doc.xml"
		python $SCRIPT $PATH_IN$FOLDER"/subtypes_test_doc.xml" $FOLDER"/subtypes_test_sent_doc.xml"

		python $SCRIPT $PATH_IN$FOLDER"/filtered_train_doc.xml" $FOLDER"/filtered_train_sent_doc.xml"
		python $SCRIPT $PATH_IN$FOLDER"/filtered_test_doc.xml" $FOLDER"/filtered_test_sent_doc.xml"
	done

	FOLDER=../outputs/repeat-$r/joined
	python $SCRIPT $PATH_IN$FOLDER"/cat_train_doc.xml" $FOLDER"/cat_train_sent_doc.xml"
	python $SCRIPT $PATH_IN$FOLDER"/cat_test_doc.xml" $FOLDER"/cat_test_sent_doc.xml"

	python $SCRIPT $PATH_IN$FOLDER"/types_train_doc.xml" $FOLDER"/types_train_sent_doc.xml"
	python $SCRIPT $PATH_IN$FOLDER"/types_test_doc.xml" $FOLDER"/types_test_sent_doc.xml"

	python $SCRIPT $PATH_IN$FOLDER"/subtypes_train_doc.xml" $FOLDER"/subtypes_train_sent_doc.xml"
	python $SCRIPT $PATH_IN$FOLDER"/subtypes_test_doc.xml" $FOLDER"/subtypes_test_sent_doc.xml"

	python $SCRIPT $PATH_IN$FOLDER"/filtered_train_doc.xml" $FOLDER"/filtered_train_sent_doc.xml"
	python $SCRIPT $PATH_IN$FOLDER"/filtered_test_doc.xml" $FOLDER"/filtered_test_sent_doc.xml"
done