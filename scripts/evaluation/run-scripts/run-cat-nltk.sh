#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {0..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/fold-$i
		OUT_RES=../results/nltk/repeat-$r/fold-$i
		../join-output-golden.sh $TOOL/out-cat-DT.txt $TOOL/out-cat-gold.txt | ../conlleval > $OUT_RES/cat-DT.txt
		../join-output-golden.sh $TOOL/out-cat-ME.txt $TOOL/out-cat-gold.txt | ../conlleval > $OUT_RES/cat-ME.txt
		../join-output-golden.sh $TOOL/out-cat-NB.txt $TOOL/out-cat-gold.txt | ../conlleval > $OUT_RES/cat-NB.txt
	done

	python ../src/avg-results.py nltk cat-DT $r
	python ../src/avg-results.py nltk cat-ME $r
	python ../src/avg-results.py nltk cat-NB $r

	# experiences
	TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/experiences
	GOLD=../../../tools/nltk/outputs/repeat-$r/joined
	OUT_RES=../results/nltk/repeat-$r/experiences

	for i in {10..120..10}
	do
		FOLDER=me_max_iter/$i
		../join-output-golden.sh $TOOL/$FOLDER/out-cat-ME.txt $GOLD/out-cat-gold.txt | ../conlleval > $OUT_RES/$FOLDER/cat.txt
	done

	for i in 0 0.05 0.1 0.15 0.2
	do
		FOLDER=me_min_lldelta/$i
		../join-output-golden.sh $TOOL/$FOLDER/out-cat-ME.txt $GOLD/out-cat-gold.txt | ../conlleval > $OUT_RES/$FOLDER/cat.txt
	done
done

python ../src/avg-results-all.py nltk cat-DT
python ../src/avg-results-all.py nltk cat-ME
python ../src/avg-results-all.py nltk cat-NB


for v in {10..120..10}
do
	python ../src/avg-results-experiences.py nltk cat me_max_iter $v
done

for v in 0 0.05 0.1 0.15 0.2
do
	python ../src/avg-results-experiences.py nltk cat me_min_lldelta $v
done