#!/bin/bash

# join output from spacy ner and test file
# evaluate results

declare -a levels=("cat" "types" "subtypes" "filtered")
for level in "${levels[@]}"
do
	for r in {0..3}
	do
		for i in {0..9}
		do
			TOOL=../../../tools/spacy/outputs/repeat-$r/fold-$i
			OUT_RES=../results/spacy/repeat-$r/fold-$i
			../join-output-golden.sh $TOOL/$level.txt $TOOL/out-$level-gold.txt | ../conlleval > $OUT_RES/$level.txt
		done

		python ../src/avg-results.py spacy $level $r

		for i in {10..60..10} 100
		do
			TOOL=../../../tools/spacy/outputs/repeat-$r/experiences/iterations/$i
			OUT_RES=../results/spacy/repeat-$r/experiences/iterations/$i
			../join-output-golden.sh $TOOL/$level.txt $TOOL/out-$level-gold.txt | ../conlleval > $OUT_RES/$level.txt
		done
	done

	python ../src/avg-results-all.py spacy $level

	for i in {10..60..10} 100
	do
		python ../src/avg-results-experiences.py spacy $level iterations $i
	done
done