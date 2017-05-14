#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {0..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/fold-$i
		OUT_RES=../results/nltk/repeat-$r/fold-$i
		../join-output-golden.sh $TOOL/out-types-DT.txt $TOOL/out-types-gold.txt | ../conlleval > $OUT_RES/types-DT.txt
		../join-output-golden.sh $TOOL/out-types-ME.txt $TOOL/out-types-gold.txt | ../conlleval > $OUT_RES/types-ME.txt
		../join-output-golden.sh $TOOL/out-types-NB.txt $TOOL/out-types-gold.txt | ../conlleval > $OUT_RES/types-NB.txt
	done

	python ../src/avg-results.py nltk types-DT $r
	python ../src/avg-results.py nltk types-ME $r
	python ../src/avg-results.py nltk types-NB $r

	# experiences
	TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/experiences
	GOLD=../../../tools/nltk/outputs/repeat-$r/joined
	OUT_RES=../results/nltk/repeat-$r/experiences

	for i in {10..120..10}
	do
		FOLDER=me_max_iter/$i
		../join-output-golden.sh $TOOL/$FOLDER/out-types-ME.txt $GOLD/out-types-gold.txt | ../conlleval > $OUT_RES/$FOLDER/types.txt
	done

	for i in 0 0.05 0.1 0.15 0.2
	do
		FOLDER=me_min_lldelta/$i
		../join-output-golden.sh $TOOL/$FOLDER/out-types-ME.txt $GOLD/out-types-gold.txt | ../conlleval > $OUT_RES/$FOLDER/types.txt
	done
done

python ../src/avg-results-all.py nltk types-DT
python ../src/avg-results-all.py nltk types-ME
python ../src/avg-results-all.py nltk types-NB

for v in {10..120..10}
do
	python ../src/avg-results-experiences.py nltk types me_max_iter $v
done

for v in 0 0.05 0.1 0.15 0.2
do
	python ../src/avg-results-experiences.py nltk types me_min_lldelta $v
done