#!/bin/bash

python "../src/remove_unwanted_spaces.py" "../outputs/cat_all.xml" "cat_all.xml"
python "../src/remove_unwanted_spaces.py" "../outputs/types_all.xml" "types_all.xml"
python "../src/remove_unwanted_spaces.py" "../outputs/subtypes_all.xml" "subtypes_all.xml"
python "../src/remove_unwanted_spaces.py" "../outputs/filtered_all.xml" "filtered_all.xml"

for i in {0..9}
do
	python "../src/remove_unwanted_spaces.py" "../outputs/fold-"$i"/cat_train.xml" "fold-"$i"/cat_train.xml"
	python "../src/remove_unwanted_spaces.py" "../outputs/fold-"$i"/cat_test.xml" "fold-"$i"/cat_test.xml"

	python "../src/remove_unwanted_spaces.py" "../outputs/fold-"$i"/types_train.xml" "fold-"$i"/types_train.xml"
	python "../src/remove_unwanted_spaces.py" "../outputs/fold-"$i"/types_test.xml" "fold-"$i"/types_test.xml"

	python "../src/remove_unwanted_spaces.py" "../outputs/fold-"$i"/subtypes_train.xml" "fold-"$i"/subtypes_train.xml"
	python "../src/remove_unwanted_spaces.py" "../outputs/fold-"$i"/subtypes_test.xml" "fold-"$i"/subtypes_test.xml"

	python "../src/remove_unwanted_spaces.py" "../outputs/fold-"$i"/filtered_train.xml" "fold-"$i"/filtered_train.xml"
	python "../src/remove_unwanted_spaces.py" "../outputs/fold-"$i"/filtered_test.xml" "fold-"$i"/filtered_test.xml"
done
