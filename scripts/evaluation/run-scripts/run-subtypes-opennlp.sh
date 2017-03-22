#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for i in {0..9}
do
	TOOL=../../../tools/open-nlp/outputs/ner-results/fold-$i
	../join-output-golden.sh $TOOL/out-subtypes.txt $TOOL/out-subtypes-gold.txt | ../conlleval > ../results/open-nlp/fold-$i/subtypes.txt
done

python ../src/avg-results.py open-nlp subtypes