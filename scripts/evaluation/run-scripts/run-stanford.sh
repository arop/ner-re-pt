#!/bin/bash

# join output from stanford ner and test file
# evaluate results

declare -a levels=("cat" "filtered") # levels=("cat" "types" "subtypes" "filtered")
for level in "${levels[@]}"
do
	for r in {0..3}
	do
		for i in {0..9}
		do
			TOOL=../../../tools/stanford-ner
			IN_NER=$TOOL/outputs/repeat-$r/ner-results/fold-$i
			IN_GOLD=$TOOL/outputs/repeat-$r/fold-$i
			OUT_RES=../results/stanford-ner/repeat-$r/fold-$i

			../join-output-golden.sh $IN_NER/out-$level-iob.txt $IN_GOLD/"t_"$level"_test-iob".txt | ../conlleval > $OUT_RES/$level.txt
		done

		python ../src/avg-results.py stanford-ner $level $r
	done

	python ../src/avg-results-all.py stanford-ner $level
done