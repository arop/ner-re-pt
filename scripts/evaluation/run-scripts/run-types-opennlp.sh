#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for i in {0..9}
do
	../join-output-golden.sh ../../../tools/open-nlp/outputs/ner-results/fold-$i/out-types.txt ../../../tools/open-nlp/outputs/ner-results/fold-$i/out-types-gold.txt | ../conlleval -r > ../results/open-nlp/fold-$i/types.txt
done

python ../src/avg-results.py open-nlp types