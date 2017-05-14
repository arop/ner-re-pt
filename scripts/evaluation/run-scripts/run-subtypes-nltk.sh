#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {0..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/fold-$i
		OUT_RES=../results/nltk/repeat-$r/fold-$i
		../join-output-golden.sh $TOOL/out-subtypes-DT.txt $TOOL/out-subtypes-gold.txt | ../conlleval > $OUT_RES/subtypes-DT.txt
		../join-output-golden.sh $TOOL/out-subtypes-ME.txt $TOOL/out-subtypes-gold.txt | ../conlleval > $OUT_RES/subtypes-ME.txt
		../join-output-golden.sh $TOOL/out-subtypes-NB.txt $TOOL/out-subtypes-gold.txt | ../conlleval > $OUT_RES/subtypes-NB.txt
	done

	python ../src/avg-results.py nltk subtypes-DT $r
	python ../src/avg-results.py nltk subtypes-ME $r
	python ../src/avg-results.py nltk subtypes-NB $r

	# experiences
	TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/experiences
	GOLD=../../../tools/nltk/outputs/repeat-$r/joined
	OUT_RES=../results/nltk/repeat-$r/experiences

	for i in {10..120..10}
	do
		FOLDER=me_max_iter/$i
		../join-output-golden.sh $TOOL/$FOLDER/out-subtypes-ME.txt $GOLD/out-subtypes-gold.txt | ../conlleval > $OUT_RES/$FOLDER/subtypes.txt
	done

	for i in 0 0.05 0.1 0.15 0.2
	do
		FOLDER=me_min_lldelta/$i
		../join-output-golden.sh $TOOL/$FOLDER/out-subtypes-ME.txt $GOLD/out-subtypes-gold.txt | ../conlleval > $OUT_RES/$FOLDER/subtypes.txt
	done
done

python ../src/avg-results-all.py nltk subtypes-DT
python ../src/avg-results-all.py nltk subtypes-ME
python ../src/avg-results-all.py nltk subtypes-NB


for v in {10..120..10}
do
	python ../src/avg-results-experiences.py nltk subtypes me_max_iter $v
done

for v in 0 0.05 0.1 0.15 0.2
do
	python ../src/avg-results-experiences.py nltk subtypes me_min_lldelta $v
done