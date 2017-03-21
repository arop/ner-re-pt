#!/bin/bash

printf "\n*** joining pos with entities ***\n"
for i in {0..9}
do
	printf "\n** fold "$i" **\n"
	FOLDER=outputs/fold-$i
	python "src/join-pos-categories.py" $FOLDER'/pos-cat-docs-train.txt' $FOLDER'/t-cat-train-doc.txt' $FOLDER'/out-conll-cat.txt'
	python "src/join-pos-categories.py" $FOLDER'/pos-types-docs-train.txt' $FOLDER'/t-types-train-doc.txt' $FOLDER'/out-conll-types.txt'
	python "src/join-pos-categories.py" $FOLDER'/pos-subtypes-docs-train.txt' $FOLDER'/t-subtypes-train-doc.txt' $FOLDER'/out-conll-subtypes.txt'
	python "src/join-pos-categories.py" $FOLDER'/pos-filtered-docs-train.txt' $FOLDER'/t-filtered-train-doc.txt' $FOLDER'/out-conll-filtered.txt'
done