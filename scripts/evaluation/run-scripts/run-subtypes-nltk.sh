#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for i in {0..9}
do
	TOOL=../../../tools/nltk/outputs/ner-results/fold-$i
	../join-output-golden.sh $TOOL/out-subtypes-DT.txt $TOOL/out-subtypes-gold.txt | ../conlleval -r > ../results/nltk/fold-$i/subtypes-DT.txt
	../join-output-golden.sh $TOOL/out-subtypes-ME.txt $TOOL/out-subtypes-gold.txt | ../conlleval -r > ../results/nltk/fold-$i/subtypes-ME.txt
	../join-output-golden.sh $TOOL/out-subtypes-NB.txt $TOOL/out-subtypes-gold.txt | ../conlleval -r > ../results/nltk/fold-$i/subtypes-NB.txt
done

python ../src/avg-results.py nltk subtypes-DT
python ../src/avg-results.py nltk subtypes-ME
python ../src/avg-results.py nltk subtypes-NB