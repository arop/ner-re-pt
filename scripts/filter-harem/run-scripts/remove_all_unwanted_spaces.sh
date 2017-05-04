#!/bin/bash

SCRIPT="../src/remove_unwanted_spaces.py"
python $SCRIPT "../outputs/cat_all.xml" "cat_all.xml"
python $SCRIPT "../outputs/types_all.xml" "types_all.xml"
python $SCRIPT "../outputs/subtypes_all.xml" "subtypes_all.xml"
python $SCRIPT "../outputs/filtered_all.xml" "filtered_all.xml"

for r in {0..3}
do
	for i in {0..9}
	do
		FOLDER="repeat-"$r"/fold-"$i
		python $SCRIPT "../outputs/"$FOLDER"/cat_train.xml" $FOLDER"/cat_train.xml"
		python $SCRIPT "../outputs/"$FOLDER"/cat_test.xml" $FOLDER"/cat_test.xml"

		python $SCRIPT "../outputs/"$FOLDER"/types_train.xml" $FOLDER"/types_train.xml"
		python $SCRIPT "../outputs/"$FOLDER"/types_test.xml" $FOLDER"/types_test.xml"

		python $SCRIPT "../outputs/"$FOLDER"/subtypes_train.xml" $FOLDER"/subtypes_train.xml"
		python $SCRIPT "../outputs/"$FOLDER"/subtypes_test.xml" $FOLDER"/subtypes_test.xml"

		python $SCRIPT "../outputs/"$FOLDER"/filtered_train.xml" $FOLDER"/filtered_train.xml"
		python $SCRIPT "../outputs/"$FOLDER"/filtered_test.xml" $FOLDER"/filtered_test.xml"
	done

	FOLDER="repeat-"$r"/joined"
	python $SCRIPT "../outputs/"$FOLDER"/cat_train.xml" $FOLDER"/cat_train.xml"
	python $SCRIPT "../outputs/"$FOLDER"/cat_test.xml" $FOLDER"/cat_test.xml"

	python $SCRIPT "../outputs/"$FOLDER"/types_train.xml" $FOLDER"/types_train.xml"
	python $SCRIPT "../outputs/"$FOLDER"/types_test.xml" $FOLDER"/types_test.xml"

	python $SCRIPT "../outputs/"$FOLDER"/subtypes_train.xml" $FOLDER"/subtypes_train.xml"
	python $SCRIPT "../outputs/"$FOLDER"/subtypes_test.xml" $FOLDER"/subtypes_test.xml"

	python $SCRIPT "../outputs/"$FOLDER"/filtered_train.xml" $FOLDER"/filtered_train.xml"
	python $SCRIPT "../outputs/"$FOLDER"/filtered_test.xml" $FOLDER"/filtered_test.xml"
done
