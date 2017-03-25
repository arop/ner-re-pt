#!/bin/bash

# join output from spacy ner and test file
# evaluate results
for r in {0..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/spacy/outputs/repeat-$r/fold-$i
		OUT_RES=../results/spacy/repeat-$r/fold-$i
		../join-output-golden.sh $TOOL/types.txt $TOOL/out-types-gold.txt | ../conlleval > $OUT_RES/types.txt
	done

	python ../src/avg-results.py spacy types $r
done

python ../src/avg-results-all.py spacy types