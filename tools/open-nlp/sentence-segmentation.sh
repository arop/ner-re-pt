#!/bin/bash

PATH_IN="../../scripts/filter-harem/harem-to-opennlp/outputs/"

for i in {0..9}
do
	printf "\n** fold "$i" **\n"
	#python "src/sentence-segmentation.py" $PATH_IN"fold-"$i"/cat_all_doc.xml" "fold-"$i"/cat_all_sent_doc.xml"
	python "src/sentence-segmentation.py" $PATH_IN"fold-"$i"/cat_train_doc.xml" "fold-"$i"/cat_train_sent_doc.xml"
	python "src/sentence-segmentation.py" $PATH_IN"fold-"$i"/cat_test_doc.xml" "fold-"$i"/cat_test_sent_doc.xml"

	#python "src/sentence-segmentation.py" $PATH_IN"fold-"$i"/types_all_doc.xml" "fold-"$i"/types_all_sent_doc.xml"
	python "src/sentence-segmentation.py" $PATH_IN"fold-"$i"/types_train_doc.xml" "fold-"$i"/types_train_sent_doc.xml"
	python "src/sentence-segmentation.py" $PATH_IN"fold-"$i"/types_test_doc.xml" "fold-"$i"/types_test_sent_doc.xml"

	#python "src/sentence-segmentation.py" $PATH_IN"fold-"$i"/subtypes_all_doc.xml" "fold-"$i"/subtypes_all_sent_doc.xml"
	python "src/sentence-segmentation.py" $PATH_IN"fold-"$i"/subtypes_train_doc.xml" "fold-"$i"/subtypes_train_sent_doc.xml"
	python "src/sentence-segmentation.py" $PATH_IN"fold-"$i"/subtypes_test_doc.xml" "fold-"$i"/subtypes_test_sent_doc.xml"

	#python "src/sentence-segmentation.py" $PATH_IN"fold-"$i"/filtered_all_doc.xml" "fold-"$i"/filtered_all_sent_doc.xml"
	python "src/sentence-segmentation.py" $PATH_IN"fold-"$i"/filtered_train_doc.xml" "fold-"$i"/filtered_train_sent_doc.xml"
	python "src/sentence-segmentation.py" $PATH_IN"fold-"$i"/filtered_test_doc.xml" "fold-"$i"/filtered_test_sent_doc.xml"
done