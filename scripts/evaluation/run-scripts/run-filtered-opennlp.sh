#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for i in {0..9}
do
	TOOL=../../../tools/open-nlp/outputs/ner-results/fold-$i
	../join-output-golden.sh $TOOL/out-filtered.txt $TOOL/out-filtered-gold.txt | ../conlleval > ../results/open-nlp/fold-$i/filtered.txt
done

python ../src/avg-results.py open-nlp filtered