#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {0..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/open-nlp/outputs/repeat-$r/ner-results/fold-$i
		OUT_RES=../results/open-nlp/repeat-$r/fold-$i
		../join-output-golden.sh $TOOL/out-cat.txt $TOOL/out-cat-gold.txt | ../conlleval > $OUT_RES/cat.txt
	done

	python ../src/avg-results.py open-nlp cat $r
done

python ../src/avg-results-all.py open-nlp cat