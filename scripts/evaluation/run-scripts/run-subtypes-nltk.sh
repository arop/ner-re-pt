#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {1..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/fold-$i
		OUT_RES=../results/nltk/repeat-$r/fold-$i
		../join-output-golden.sh $TOOL/out-subtypes-DT.txt $TOOL/out-subtypes-gold.txt | ../conlleval > $OUT_RES/subtypes-DT.txt
		../join-output-golden.sh $TOOL/out-subtypes-ME.txt $TOOL/out-subtypes-gold.txt | ../conlleval > $OUT_RES/subtypes-ME.txt
		../join-output-golden.sh $TOOL/out-subtypes-NB.txt $TOOL/out-subtypes-gold.txt | ../conlleval > $OUT_RES/subtypes-NB.txt
	done

	python ../src/avg-results.py nltk subtypes-DT $r
	python ../src/avg-results.py nltk subtypes-ME $r
	python ../src/avg-results.py nltk subtypes-NB $r
done

python ../src/avg-results-all.py nltk subtypes-DT
python ../src/avg-results-all.py nltk subtypes-ME
python ../src/avg-results-all.py nltk subtypes-NB