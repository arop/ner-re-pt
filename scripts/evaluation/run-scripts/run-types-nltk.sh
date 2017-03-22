#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for i in {0..9}
do
	TOOL=../../../tools/nltk/outputs/ner-results/fold-$i
	../join-output-golden.sh $TOOL/out-types-DT.txt $TOOL/out-types-gold.txt | ../conlleval > ../results/nltk/fold-$i/types-DT.txt
	../join-output-golden.sh $TOOL/out-types-ME.txt $TOOL/out-types-gold.txt | ../conlleval > ../results/nltk/fold-$i/types-ME.txt
	../join-output-golden.sh $TOOL/out-types-NB.txt $TOOL/out-types-gold.txt | ../conlleval > ../results/nltk/fold-$i/types-NB.txt
done

python ../src/avg-results.py nltk types-DT
python ../src/avg-results.py nltk types-ME
python ../src/avg-results.py nltk types-NB