#!/bin/bash

SCRIPT="../src/pos-tagging-docs.py"
printf "\n*** pos tagging ***\n"
# all 20min
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	for i in {0..9}
	do
		FOLDER=../outputs/repeat-$r/fold-$i
		
		printf "\n** fold "$i" **\n"
		python $SCRIPT $FOLDER"/t-cat-train-doc.txt" $FOLDER"/pos-cat-docs-train.txt"
		python $SCRIPT $FOLDER"/t-cat-test-doc.txt" $FOLDER"/pos-cat-docs-test.txt"

		python $SCRIPT $FOLDER"/t-types-train-doc.txt" $FOLDER"/pos-types-docs-train.txt"
		python $SCRIPT $FOLDER"/t-types-test-doc.txt" $FOLDER"/pos-types-docs-test.txt"

		python $SCRIPT $FOLDER"/t-subtypes-train-doc.txt" $FOLDER"/pos-subtypes-docs-train.txt"
		python $SCRIPT $FOLDER"/t-subtypes-test-doc.txt" $FOLDER"/pos-subtypes-docs-test.txt"

		python $SCRIPT $FOLDER"/t-filtered-train-doc.txt" $FOLDER"/pos-filtered-docs-train.txt"
		python $SCRIPT $FOLDER"/t-filtered-test-doc.txt" $FOLDER"/pos-filtered-docs-test.txt"
	done
done
