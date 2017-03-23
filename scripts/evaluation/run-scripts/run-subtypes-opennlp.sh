#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {1..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/open-nlp/outputs/repeat-$r/ner-results/fold-$i
		OUT_RES=../results/open-nlp/repeat-$r/fold-$i
		../join-output-golden.sh $TOOL/out-subtypes.txt $TOOL/out-subtypes-gold.txt | ../conlleval > $OUT_RES/subtypes.txt
	done

	python ../src/avg-results.py open-nlp subtypes $r
done