#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for i in {0..9}
do
	../join-output-golden.sh ../../../tools/open-nlp/outputs/ner-results/fold-$i/out-cat.txt ../../../tools/open-nlp/outputs/ner-results/fold-$i/out-cat-gold.txt | ../conlleval -r > ../results/open-nlp/fold-$i/cat.txt
done

python ../src/avg-results.py open-nlp cat