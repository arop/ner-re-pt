#!/bin/bash

TEST=test_chunker.py

declare -a levels=("cat" "types" "subtypes" "filtered")

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	# max_iter
	# for i in {10..120..10}
	# do
	# 	printf "\n** iterations "$i" **\n"

	# 	for level in "${levels[@]}"
	# 	do
	# 		OUT=../outputs/repeat-$r/joined
	# 		RESULTS=../outputs/repeat-$r/ner-results/experiences/me_max_iter/$i
	# 		MODELS=models/repeat-$r/experiences/me_max_iter/$i

	# 		iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-$level-docs-test.txt > $OUT/pos-$level-docs-test-utf8.txt
	# 		python $TEST $MODELS/$level"_Maxent.pickle" $OUT/pos-$level-docs-test-utf8.txt $RESULTS/out-$level-ME.txt
	# 	done
	# done

	# min_lldelta
	# for i in 0 0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.05 0.1 0.15 0.2
	# do
	# 	printf "\n** min_lldelta "$i" **\n"

	# 	for level in "${levels[@]}"
	# 	do
	# 		OUT=../outputs/repeat-$r/joined
	# 		RESULTS=../outputs/repeat-$r/ner-results/experiences/me_min_lldelta/$i
	# 		MODELS=models/repeat-$r/experiences/me_min_lldelta/$i

	# 		iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-$level-docs-test.txt > $OUT/pos-$level-docs-test-utf8.txt
	# 		python $TEST $MODELS/$level"_Maxent.pickle" $OUT/pos-$level-docs-test-utf8.txt $RESULTS/out-$level-ME.txt
	# 	done
	# done

	# min_lldelta with max_iter = 100
	printf "\n** max_iter = 100 **\n"
	for i in 0 0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.05 0.1 0.15 0.2
	do
		printf "\n** min_lldelta "$i" **\n"

		for level in "${levels[@]}"
		do
			OUT=../outputs/repeat-$r/joined
			RESULTS=../outputs/repeat-$r/ner-results/experiences/me_min_lldelta-iter-50/$i
			MODELS=models/repeat-$r/experiences/me_min_lldelta-iter-50/$i

			iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-$level-docs-test.txt > $OUT/pos-$level-docs-test-utf8.txt
			python $TEST $MODELS/$level"_Maxent.pickle" $OUT/pos-$level-docs-test-utf8.txt $RESULTS/out-$level-ME.txt
		done
	done
done