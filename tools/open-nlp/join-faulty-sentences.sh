#!/bin/bash

for i in {0..9}
do
	printf "\n** fold "$i" **\n"
	#python "src/join-faulty-sentences.py" "outputs/fold-"$i"/cat_all_sent_doc.xml" "outputs/fold-"$i"/cat_all_sent_doc.xml"
	python "src/join-faulty-sentences.py" "outputs/fold-"$i"/cat_train_sent_doc.xml" "outputs/fold-"$i"/cat_train_sent_doc.xml"
	python "src/join-faulty-sentences.py" "outputs/fold-"$i"/cat_test_sent_doc.xml" "outputs/fold-"$i"/cat_test_sent_doc.xml"

	#python "src/join-faulty-sentences.py" "outputs/fold-"$i"/types_all_sent_doc.xml" "outputs/fold-"$i"/types_all_sent_doc.xml"
	python "src/join-faulty-sentences.py" "outputs/fold-"$i"/types_train_sent_doc.xml" "outputs/fold-"$i"/types_train_sent_doc.xml"
	python "src/join-faulty-sentences.py" "outputs/fold-"$i"/types_test_sent_doc.xml" "outputs/fold-"$i"/types_test_sent_doc.xml"

	#python "src/join-faulty-sentences.py" "outputs/fold-"$i"/subtypes_all_sent_doc.xml" "outputs/fold-"$i"/subtypes_all_sent_doc.xml"
	python "src/join-faulty-sentences.py" "outputs/fold-"$i"/subtypes_train_sent_doc.xml" "outputs/fold-"$i"/subtypes_train_sent_doc.xml"
	python "src/join-faulty-sentences.py" "outputs/fold-"$i"/subtypes_test_sent_doc.xml" "outputs/fold-"$i"/subtypes_test_sent_doc.xml"

	#python "src/join-faulty-sentences.py" "outputs/fold-"$i"/filtered_all_sent_doc.xml" "outputs/fold-"$i"/filtered_all_sent_doc.xml"
	python "src/join-faulty-sentences.py" "outputs/fold-"$i"/filtered_train_sent_doc.xml" "outputs/fold-"$i"/filtered_train_sent_doc.xml"
	python "src/join-faulty-sentences.py" "outputs/fold-"$i"/filtered_test_sent_doc.xml" "outputs/fold-"$i"/filtered_test_sent_doc.xml"
done