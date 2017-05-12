#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {0..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/open-nlp/outputs/repeat-$r/ner-results/fold-$i
		OUT_RES=../results/open-nlp/repeat-$r/fold-$i
		../join-output-golden.sh $TOOL/out-filtered.txt $TOOL/out-filtered-gold.txt | ../conlleval > $OUT_RES/filtered.txt
	done

	python ../src/avg-results.py open-nlp filtered $r

	# experiences
	for i in 0 {3..7} 10
	do
		TOOL=../../../tools/open-nlp/outputs/repeat-$r/ner-results/experiences/cutoff/$i
		OUT_RES=../results/open-nlp/repeat-$r/experiences/cutoff/$i
		../join-output-golden.sh $TOOL/out-filtered.txt $TOOL/out-filtered-gold.txt | ../conlleval > $OUT_RES/filtered.txt
	done

	for i in {70..130..10} 125 135 150 170 200
	do
		TOOL=../../../tools/open-nlp/outputs/repeat-$r/ner-results/experiences/iterations/$i
		OUT_RES=../results/open-nlp/repeat-$r/experiences/iterations/$i
		../join-output-golden.sh $TOOL/out-filtered.txt $TOOL/out-filtered-gold.txt | ../conlleval > $OUT_RES/filtered.txt
	done
done

python ../src/avg-results-all.py open-nlp filtered

for i in 0 {3..7} 10
do
	python ../src/avg-results-experiences.py open-nlp filtered cutoff $i
done

for i in {70..130..10} 125 135 150 170 200
do
	python ../src/avg-results-experiences.py open-nlp filtered iterations $i
done