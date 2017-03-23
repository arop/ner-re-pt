#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {1..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/nltk/outputs/ner-results/repeat-$r/fold-$i
		OUT_RES=../results/nltk/repeat-$r/fold-$i
		../join-output-golden.sh $TOOL/out-types-DT.txt $TOOL/out-types-gold.txt | ../conlleval > $OUT_RES/types-DT.txt
		../join-output-golden.sh $TOOL/out-types-ME.txt $TOOL/out-types-gold.txt | ../conlleval > $OUT_RES/types-ME.txt
		../join-output-golden.sh $TOOL/out-types-NB.txt $TOOL/out-types-gold.txt | ../conlleval > $OUT_RES/types-NB.txt
	done

	python ../src/avg-results.py nltk types-DT $r
	python ../src/avg-results.py nltk types-ME $r
	python ../src/avg-results.py nltk types-NB $r
done
