#!/bin/bash

TEST=test_chunker.py

declare -a levels=("cat" "types" "subtypes" "filtered")

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	for i in {10..120..10}
	do
		printf "\n** iterations "$i" **\n"

		for level in "${levels[@]}"
		do
			OUT=../outputs/repeat-$r/joined
			RESULTS=../outputs/repeat-$r/ner-results/experiences/me_max_iter/$i
			MODELS=models/repeat-$r/experiences/me_max_iter/$i

			iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-$level-docs-test.txt > $OUT/pos-$level-docs-test-utf8.txt
			python $TEST $MODELS/$level"_Maxent.pickle" $OUT/pos-$level-docs-test-utf8.txt $RESULTS/out-$level-ME.txt
		done
	done
done