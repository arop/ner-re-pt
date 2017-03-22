#!/bin/bash

SCRIPT="src/pos-tagging-docs.py"
printf "\n*** pos tagging ***\n"

for r in {1..3}
do
	printf "\n** repeat "$r" **\n"

	for i in {0..9}
	do
		FOLDER=repeat-$r/fold-$i
		
		printf "\n** fold "$i" **\n"
		python $SCRIPT "outputs/"$FOLDER"/t-cat-train-doc.txt" $FOLDER"/pos-cat-docs-train.txt"
		python $SCRIPT "outputs/"$FOLDER"/t-cat-test-doc.txt" $FOLDER"/pos-cat-docs-test.txt"

		python $SCRIPT "outputs/"$FOLDER"/t-types-train-doc.txt" $FOLDER"/pos-types-docs-train.txt"
		python $SCRIPT "outputs/"$FOLDER"/t-types-test-doc.txt" $FOLDER"/pos-types-docs-test.txt"

		python $SCRIPT "outputs/"$FOLDER"/t-subtypes-train-doc.txt" $FOLDER"/pos-subtypes-docs-train.txt"
		python $SCRIPT "outputs/"$FOLDER"/t-subtypes-test-doc.txt" $FOLDER"/pos-subtypes-docs-test.txt"

		python $SCRIPT "outputs/"$FOLDER"/t-filtered-train-doc.txt" $FOLDER"/pos-filtered-docs-train.txt"
		python $SCRIPT "outputs/"$FOLDER"/t-filtered-test-doc.txt" $FOLDER"/pos-filtered-docs-test.txt"
	done
done
