#!/bin/bash

TEST=src/test_chunker.py

declare -a levels=("cat" "types" "subtypes" "filtered")

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"

		for level in "${levels[@]}"
		do
			OUT=../outputs/repeat-$r/fold-$i
			RESULTS=../outputs/repeat-$r/ner-results/fold-$i
			MODELS=models/repeat-$r/fold-$i

			iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-$level-docs-test.txt > $OUT/pos-$level-docs-test-utf8.txt
			python $TEST $MODELS/$level_NaiveBayes.pickle $OUT/pos-$level-docs-test-utf8.txt $RESULTS/out-$level-NB.txt
			python $TEST $MODELS/$level_Maxent.pickle $OUT/pos-$level-docs-test-utf8.txt $RESULTS/out-$level-ME.txt
			python $TEST $MODELS/$level_DecisionTree.pickle $OUT/pos-$level-docs-test-utf8.txt $RESULTS/out-$level-DT.txt
		done
	done
done