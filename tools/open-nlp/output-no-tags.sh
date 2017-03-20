#!/bin/bash

for i in {0..9}
do
	printf "\n** fold "$i" **\n"
	python "src/output-no-tags.py" "outputs/fold-"$i"/cat_test_sent_doc.xml" "outputs/fold-"$i"/cat_test_sent_doc-clean.xml"
	python "src/output-no-tags.py" "outputs/fold-"$i"/types_test_sent_doc.xml" "outputs/fold-"$i"/types_test_sent_doc-clean.xml"
	python "src/output-no-tags.py" "outputs/fold-"$i"/subtypes_test_sent_doc.xml" "outputs/fold-"$i"/subtypes_test_sent_doc-clean.xml"
	python "src/output-no-tags.py" "outputs/fold-"$i"/filtered_test_sent_doc.xml" "outputs/fold-"$i"/filtered_test_sent_doc-clean.xml"
done