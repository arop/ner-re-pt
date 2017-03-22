#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for i in {0..9}
do
	TOOL=../../../tools/nltk/outputs/ner-results/fold-$i
	../join-output-golden.sh $TOOL/out-filtered-DT.txt $TOOL/out-filtered-gold.txt | ../conlleval > ../results/nltk/fold-$i/filtered-DT.txt
	../join-output-golden.sh $TOOL/out-filtered-ME.txt $TOOL/out-filtered-gold.txt | ../conlleval > ../results/nltk/fold-$i/filtered-ME.txt
	../join-output-golden.sh $TOOL/out-filtered-NB.txt $TOOL/out-filtered-gold.txt | ../conlleval > ../results/nltk/fold-$i/filtered-NB.txt
done

python ../src/avg-results.py nltk filtered-DT
python ../src/avg-results.py nltk filtered-ME
python ../src/avg-results.py nltk filtered-NB