#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {0..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/fold-$i
		OUT_RES=../results/nltk/repeat-$r/fold-$i
		../join-output-golden.sh $TOOL/out-filtered-DT.txt $TOOL/out-filtered-gold.txt | ../conlleval > $OUT_RES/filtered-DT.txt
		../join-output-golden.sh $TOOL/out-filtered-ME.txt $TOOL/out-filtered-gold.txt | ../conlleval > $OUT_RES/filtered-ME.txt
		../join-output-golden.sh $TOOL/out-filtered-NB.txt $TOOL/out-filtered-gold.txt | ../conlleval > $OUT_RES/filtered-NB.txt
	done

	python ../src/avg-results.py nltk filtered-DT $r
	python ../src/avg-results.py nltk filtered-ME $r
	python ../src/avg-results.py nltk filtered-NB $r
done

python ../src/avg-results-all.py nltk filtered-DT
python ../src/avg-results-all.py nltk filtered-ME
python ../src/avg-results-all.py nltk filtered-NB