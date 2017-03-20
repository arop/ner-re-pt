#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for i in {0..9}
do
	../join-output-golden.sh ../../../tools/stanford-ner/outputs/ner-results/fold-$i/out-filtered.txt ../../../tools/stanford-ner/outputs/fold-$i/t_filtered_test.txt | ../conlleval -r > ../results/stanford-ner/fold-$i/filtered.txt
done