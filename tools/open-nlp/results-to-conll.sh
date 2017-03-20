#!/bin/bash

for i in {0..9}
do
	printf "\n** fold "$i" **\n"
	python "src/tokenize_from_opennlp_format.py" "train/results/fold-"$i"/out-cat.txt" "outputs/ner-results/fold-"$i"/out-cat.txt" "UTF-8"
	python "src/tokenize_from_opennlp_format.py" "train/results/fold-"$i"/out-types.txt" "outputs/ner-results/fold-"$i"/out-types.txt" "UTF-8"
	python "src/tokenize_from_opennlp_format.py" "train/results/fold-"$i"/out-subtypes.txt" "outputs/ner-results/fold-"$i"/out-subtypes.txt" "UTF-8"
	python "src/tokenize_from_opennlp_format.py" "train/results/fold-"$i"/out-filtered.txt" "outputs/ner-results/fold-"$i"/out-filtered.txt" "UTF-8"

	python "src/tokenize_from_opennlp_format.py" "outputs/fold-"$i"/cat_test_sent_doc.xml" "outputs/ner-results/fold-"$i"/out-cat-gold.txt" "ISO-8859-1"
	python "src/tokenize_from_opennlp_format.py" "outputs/fold-"$i"/types_test_sent_doc.xml" "outputs/ner-results/fold-"$i"/out-types-gold.txt" "ISO-8859-1"
	python "src/tokenize_from_opennlp_format.py" "outputs/fold-"$i"/subtypes_test_sent_doc.xml" "outputs/ner-results/fold-"$i"/out-subtypes-gold.txt" "ISO-8859-1"
	python "src/tokenize_from_opennlp_format.py" "outputs/fold-"$i"/filtered_test_sent_doc.xml" "outputs/ner-results/fold-"$i"/out-filtered-gold.txt" "ISO-8859-1"
done