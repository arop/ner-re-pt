#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for i in {0..9}
do
	TOOL=../../../tools/nltk/outputs/ner-results/fold-$i
	../join-output-golden.sh $TOOL/out-cat-DT.txt $TOOL/out-cat-gold.txt | ../conlleval > ../results/nltk/fold-$i/cat-DT.txt
	../join-output-golden.sh $TOOL/out-cat-ME.txt $TOOL/out-cat-gold.txt | ../conlleval > ../results/nltk/fold-$i/cat-ME.txt
	../join-output-golden.sh $TOOL/out-cat-NB.txt $TOOL/out-cat-gold.txt | ../conlleval > ../results/nltk/fold-$i/cat-NB.txt
done

python ../src/avg-results.py nltk cat-DT
python ../src/avg-results.py nltk cat-ME
python ../src/avg-results.py nltk cat-NB