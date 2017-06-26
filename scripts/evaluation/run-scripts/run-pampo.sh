#!/bin/bash

# join output from stanford ner and test file
# evaluate results

declare -a levels=("cat" "types" "subtypes")

for level in "${levels[@]}"
do
	for r in {0..3}
	do
		for i in {0..9}
		do
			TOOL=../../../tools/pampo
			IN_NER=$TOOL/outputs/repeat-$r/fold-$i
			IN_GOLD=$TOOL/outputs/repeat-$r/fold-$i
			OUT_RES=../results/pampo/repeat-$r/fold-$i

			../join-output-golden.sh $IN_NER/conll-pampo-$level.xml $IN_GOLD/conll-pampo-$level-gold.xml | ../conlleval > $OUT_RES/$level.txt
		done

		python ../src/avg-results.py pampo $level $r
	done

	python ../src/avg-results-all.py pampo $level
done