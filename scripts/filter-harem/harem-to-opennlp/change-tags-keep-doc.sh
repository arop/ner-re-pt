#!/bin/bash

for i in {0..9}
do
	python "src/change_tags_keep_doc.py" "../outputs/fold-"$i"/cat_train.xml" "fold-"$i"/cat_train_doc.xml"
	python "src/change_tags_keep_doc.py" "../outputs/fold-"$i"/cat_test.xml" "fold-"$i"/cat_test_doc.xml"

	python "src/change_tags_keep_doc.py" "../outputs/fold-"$i"/types_train.xml" "fold-"$i"/types_train_doc.xml"
	python "src/change_tags_keep_doc.py" "../outputs/fold-"$i"/types_test.xml" "fold-"$i"/types_test_doc.xml"

	python "src/change_tags_keep_doc.py" "../outputs/fold-"$i"/subtypes_train.xml" "fold-"$i"/subtypes_train_doc.xml"
	python "src/change_tags_keep_doc.py" "../outputs/fold-"$i"/subtypes_test.xml" "fold-"$i"/subtypes_test_doc.xml"

	python "src/change_tags_keep_doc.py" "../outputs/fold-"$i"/filtered_train.xml" "fold-"$i"/filtered_train_doc.xml"
	python "src/change_tags_keep_doc.py" "../outputs/fold-"$i"/filtered_test.xml" "fold-"$i"/filtered_test_doc.xml"
done