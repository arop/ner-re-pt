#!/bin/bash

printf "\n*** pos tagging ***\n"
for i in {0..9}
do
	printf "\n** fold "$i" **\n"
	python "src/pos-tagging-docs.py" "outputs/fold-"$i"/t-cat-train-doc.txt" "fold-"$i"/pos-cat-docs-train.txt"
	python "src/pos-tagging-docs.py" "outputs/fold-"$i"/t-cat-test-doc.txt" "fold-"$i"/pos-cat-docs-test.txt"

	python "src/pos-tagging-docs.py" "outputs/fold-"$i"/t-types-train-doc.txt" "fold-"$i"/pos-types-docs-train.txt"
	python "src/pos-tagging-docs.py" "outputs/fold-"$i"/t-types-test-doc.txt" "fold-"$i"/pos-types-docs-test.txt"

	python "src/pos-tagging-docs.py" "outputs/fold-"$i"/t-subtypes-train-doc.txt" "fold-"$i"/pos-subtypes-docs-train.txt"
	python "src/pos-tagging-docs.py" "outputs/fold-"$i"/t-subtypes-test-doc.txt" "fold-"$i"/pos-subtypes-docs-test.txt"

	python "src/pos-tagging-docs.py" "outputs/fold-"$i"/t-filtered-train-doc.txt" "fold-"$i"/pos-filtered-docs-train.txt"
	python "src/pos-tagging-docs.py" "outputs/fold-"$i"/t-filtered-test-doc.txt" "fold-"$i"/pos-filtered-docs-test.txt"
done

