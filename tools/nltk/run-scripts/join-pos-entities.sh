#!/bin/bash

SCRIPT="../src/join-pos-categories.py"
printf "\n*** joining pos with entities ***\n"

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	
	# for i in {0..9}
	# do
	# 	printf "\n** fold "$i" **\n"
	# 	FOLDER=../outputs/repeat-$r/fold-$i

	# 	python $SCRIPT $FOLDER'/pos-cat-docs-train.txt' $FOLDER'/t-cat-train-doc.txt' $FOLDER'/out-conll-cat.txt' 'ISO-8859-1'
	# 	python $SCRIPT $FOLDER'/pos-types-docs-train.txt' $FOLDER'/t-types-train-doc.txt' $FOLDER'/out-conll-types.txt' 'ISO-8859-1'
	# 	python $SCRIPT $FOLDER'/pos-subtypes-docs-train.txt' $FOLDER'/t-subtypes-train-doc.txt' $FOLDER'/out-conll-subtypes.txt' 'ISO-8859-1'
	# 	python $SCRIPT $FOLDER'/pos-filtered-docs-train.txt' $FOLDER'/t-filtered-train-doc.txt' $FOLDER'/out-conll-filtered.txt' 'ISO-8859-1'
	# done

	# printf "\n** experiences **\n"
	# FOLDER=../outputs/repeat-$r/joined

	# python $SCRIPT $FOLDER'/pos-cat-docs-train.txt' $FOLDER'/t-cat-train-doc.txt' $FOLDER'/out-conll-cat.txt' 'ISO-8859-1'
	# python $SCRIPT $FOLDER'/pos-types-docs-train.txt' $FOLDER'/t-types-train-doc.txt' $FOLDER'/out-conll-types.txt' 'ISO-8859-1'
	# python $SCRIPT $FOLDER'/pos-subtypes-docs-train.txt' $FOLDER'/t-subtypes-train-doc.txt' $FOLDER'/out-conll-subtypes.txt' 'ISO-8859-1'
	# python $SCRIPT $FOLDER'/pos-filtered-docs-train.txt' $FOLDER'/t-filtered-train-doc.txt' $FOLDER'/out-conll-filtered.txt' 'ISO-8859-1'

	printf "\n** experiences **\n"
	FOLDER=../outputs/repeat-$r/sigarra

	python $SCRIPT $FOLDER'/pos-sigarra-docs-train.txt' $FOLDER'/t-sigarra-train-doc.txt' $FOLDER'/out-conll-sigarra.txt' 'UTF-8'
done