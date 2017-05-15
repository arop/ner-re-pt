#!/bin/bash

TEST=test_chunker.py

declare -a levels=("cat" "types" "subtypes" "filtered")

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	# support cutoff
	for i in {7..12}
	do
		printf "\n** support cutoff "$i" **\n"

		for level in "${levels[@]}"
		do
			OUT=../outputs/repeat-$r/joined
			RESULTS=../outputs/repeat-$r/ner-results/experiences/dt_support_cutoff/$i
			MODELS=models/repeat-$r/experiences/dt_support_cutoff/$i

			iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-$level-docs-test.txt > $OUT/pos-$level-docs-test-utf8.txt
			python $TEST $MODELS/$level"_DecisionTree.pickle" $OUT/pos-$level-docs-test-utf8.txt $RESULTS/out-$level-DT.txt
		done
	done
done