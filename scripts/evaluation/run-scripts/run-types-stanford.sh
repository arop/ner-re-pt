#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for i in {0..9}
do
	TOOL=../../../tools/stanford-ner
	../join-output-golden.sh $TOOL/outputs/ner-results/fold-$i/out-types.txt $TOOL/outputs/fold-$i/t_types_test.txt | ../conlleval > ../results/stanford-ner/fold-$i/types.txt
done

python ../src/avg-results.py stanford-ner types