#!/bin/bash

SCRIPT="src/change_tags_keep_doc.py"
for r in {0..3}
do
	for i in {0..9}
	do
		FOLDER="repeat-"$r"/fold-"$i
		python $SCRIPT "../outputs/"$FOLDER"/cat_train.xml" $FOLDER"/cat_train_doc.xml"
		python $SCRIPT "../outputs/"$FOLDER"/cat_test.xml" $FOLDER"/cat_test_doc.xml"

		python $SCRIPT "../outputs/"$FOLDER"/types_train.xml" $FOLDER"/types_train_doc.xml"
		python $SCRIPT "../outputs/"$FOLDER"/types_test.xml" $FOLDER"/types_test_doc.xml"

		python $SCRIPT "../outputs/"$FOLDER"/subtypes_train.xml" $FOLDER"/subtypes_train_doc.xml"
		python $SCRIPT "../outputs/"$FOLDER"/subtypes_test.xml" $FOLDER"/subtypes_test_doc.xml"

		python $SCRIPT "../outputs/"$FOLDER"/filtered_train.xml" $FOLDER"/filtered_train_doc.xml"
		python $SCRIPT "../outputs/"$FOLDER"/filtered_test.xml" $FOLDER"/filtered_test_doc.xml"
	done

	FOLDER="repeat-"$r"/joined"
	python $SCRIPT "../outputs/"$FOLDER"/cat_train.xml" $FOLDER"/cat_train_doc.xml"
	python $SCRIPT "../outputs/"$FOLDER"/cat_test.xml" $FOLDER"/cat_test_doc.xml"

	python $SCRIPT "../outputs/"$FOLDER"/types_train.xml" $FOLDER"/types_train_doc.xml"
	python $SCRIPT "../outputs/"$FOLDER"/types_test.xml" $FOLDER"/types_test_doc.xml"

	python $SCRIPT "../outputs/"$FOLDER"/subtypes_train.xml" $FOLDER"/subtypes_train_doc.xml"
	python $SCRIPT "../outputs/"$FOLDER"/subtypes_test.xml" $FOLDER"/subtypes_test_doc.xml"

	python $SCRIPT "../outputs/"$FOLDER"/filtered_train.xml" $FOLDER"/filtered_train_doc.xml"
	python $SCRIPT "../outputs/"$FOLDER"/filtered_test.xml" $FOLDER"/filtered_test_doc.xml"
done