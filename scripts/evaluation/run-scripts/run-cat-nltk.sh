#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {1..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/fold-$i
		OUT_RES=../results/nltk/repeat-$r/fold-$i
		../join-output-golden.sh $TOOL/out-cat-DT.txt $TOOL/out-cat-gold.txt | ../conlleval > $OUT_RES/cat-DT.txt
		../join-output-golden.sh $TOOL/out-cat-ME.txt $TOOL/out-cat-gold.txt | ../conlleval > $OUT_RES/cat-ME.txt
		../join-output-golden.sh $TOOL/out-cat-NB.txt $TOOL/out-cat-gold.txt | ../conlleval > $OUT_RES/cat-NB.txt
	done

	python ../src/avg-results.py nltk cat-DT $r
	python ../src/avg-results.py nltk cat-ME $r
	python ../src/avg-results.py nltk cat-NB $r
done

python ../src/avg-results-all.py nltk cat-DT
python ../src/avg-results-all.py nltk cat-ME
python ../src/avg-results-all.py nltk cat-NB