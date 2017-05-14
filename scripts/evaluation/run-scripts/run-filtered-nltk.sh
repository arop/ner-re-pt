#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {0..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/fold-$i
		OUT_RES=../results/nltk/repeat-$r/fold-$i
		../join-output-golden.sh $TOOL/out-filtered-DT.txt $TOOL/out-filtered-gold.txt | ../conlleval > $OUT_RES/filtered-DT.txt
		../join-output-golden.sh $TOOL/out-filtered-ME.txt $TOOL/out-filtered-gold.txt | ../conlleval > $OUT_RES/filtered-ME.txt
		../join-output-golden.sh $TOOL/out-filtered-NB.txt $TOOL/out-filtered-gold.txt | ../conlleval > $OUT_RES/filtered-NB.txt
	done

	python ../src/avg-results.py nltk filtered-DT $r
	python ../src/avg-results.py nltk filtered-ME $r
	python ../src/avg-results.py nltk filtered-NB $r

	# experiences
	TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/experiences
	GOLD=../../../tools/nltk/outputs/repeat-$r/joined
	OUT_RES=../results/nltk/repeat-$r/experiences

	for i in {10..120..10}
	do
		FOLDER=me_max_iter/$i
		../join-output-golden.sh $TOOL/$FOLDER/out-filtered-ME.txt $GOLD/out-filtered-gold.txt | ../conlleval > $OUT_RES/$FOLDER/filtered.txt
	done

	for i in 0 0.05 0.1 0.15 0.2
	do
		FOLDER=me_min_lldelta/$i
		../join-output-golden.sh $TOOL/$FOLDER/out-filtered-ME.txt $GOLD/out-filtered-gold.txt | ../conlleval > $OUT_RES/$FOLDER/filtered.txt
	done
done

python ../src/avg-results-all.py nltk filtered-DT
python ../src/avg-results-all.py nltk filtered-ME
python ../src/avg-results-all.py nltk filtered-NB


for v in {10..120..10}
do
	python ../src/avg-results-experiences.py nltk filtered me_max_iter $v
done

for v in 0 0.05 0.1 0.15 0.2
do
	python ../src/avg-results-experiences.py nltk filtered me_min_lldelta $v
done