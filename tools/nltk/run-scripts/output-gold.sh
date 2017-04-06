#!/bin/bash

printf "\n*** output gold ***\n"

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"
		FOLDER=../outputs/repeat-$r/fold-$i
		OUT=../outputs/repeat-$r/ner-results/fold-$i

		python "../src/out-conll-gold.py" $FOLDER'/t-cat-test-doc.txt' $OUT'/out-cat-gold.txt'
		python "../src/out-conll-gold.py" $FOLDER'/t-types-test-doc.txt' $OUT'/out-types-gold.txt'
		python "../src/out-conll-gold.py" $FOLDER'/t-subtypes-test-doc.txt' $OUT'/out-subtypes-gold.txt'
		python "../src/out-conll-gold.py" $FOLDER'/t-filtered-test-doc.txt' $OUT'/out-filtered-gold.txt'
	done
done