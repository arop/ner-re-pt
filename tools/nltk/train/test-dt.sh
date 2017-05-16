#!/bin/bash

TEST=test_chunker.py

declare -a levels=("cat" "types" "subtypes" "filtered")

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	# support cutoff
	# for i in {7..12}
	# do
	# 	printf "\n** support cutoff "$i" **\n"

	# 	for level in "${levels[@]}"
	# 	do
	# 		OUT=../outputs/repeat-$r/joined
	# 		RESULTS=../outputs/repeat-$r/ner-results/experiences/dt_support_cutoff/$i
	# 		MODELS=models/repeat-$r/experiences/dt_support_cutoff/$i

	# 		iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-$level-docs-test.txt > $OUT/pos-$level-docs-test-utf8.txt
	# 		python $TEST $MODELS/$level"_DecisionTree.pickle" $OUT/pos-$level-docs-test-utf8.txt $RESULTS/out-$level-DT.txt
	# 	done
	# done

	# entropy cutoff
	for i in 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.11 0.12 0.13
	do
		printf "\n** entropy cutoff "$i" **\n"

		for level in "${levels[@]}"
		do
			OUT=../outputs/repeat-$r/joined
			RESULTS=../outputs/repeat-$r/ner-results/experiences/dt_entropy_cutoff/$i
			MODELS=models/repeat-$r/experiences/dt_entropy_cutoff/$i

			iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-$level-docs-test.txt > $OUT/pos-$level-docs-test-utf8.txt
			python $TEST $MODELS/$level"_DecisionTree.pickle" $OUT/pos-$level-docs-test-utf8.txt $RESULTS/out-$level-DT.txt
		done
	done

	# depth cutoff
	for i in {70..120..10}
	do
		printf "\n** depth cutoff "$i" **\n"

		for level in "${levels[@]}"
		do
			OUT=../outputs/repeat-$r/joined
			RESULTS=../outputs/repeat-$r/ner-results/experiences/dt_depth_cutoff/$i
			MODELS=models/repeat-$r/experiences/dt_depth_cutoff/$i

			iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-$level-docs-test.txt > $OUT/pos-$level-docs-test-utf8.txt
			python $TEST $MODELS/$level"_DecisionTree.pickle" $OUT/pos-$level-docs-test-utf8.txt $RESULTS/out-$level-DT.txt
		done
	done
done