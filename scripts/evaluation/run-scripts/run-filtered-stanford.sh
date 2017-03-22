#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for i in {0..9}
do
	TOOL=../../../tools/stanford-ner/outputs
	../join-output-golden.sh $TOOL/ner-results/fold-$i/out-filtered.txt $TOOL/fold-$i/t_filtered_test.txt | ../conlleval > ../results/stanford-ner/fold-$i/filtered.txt
done

python ../src/avg-results.py stanford-ner filtered