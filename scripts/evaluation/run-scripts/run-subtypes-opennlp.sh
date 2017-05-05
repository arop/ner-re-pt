#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {0..3}
do
	# for i in {0..9}
	# do
	# 	TOOL=../../../tools/open-nlp/outputs/repeat-$r/ner-results/fold-$i
	# 	OUT_RES=../results/open-nlp/repeat-$r/fold-$i
	# 	../join-output-golden.sh $TOOL/out-subtypes.txt $TOOL/out-subtypes-gold.txt | ../conlleval > $OUT_RES/subtypes.txt
	# done

	# python ../src/avg-results.py open-nlp subtypes $r

	# experiences
	for i in 0 10
	do
		TOOL=../../../tools/open-nlp/outputs/repeat-$r/ner-results/experiences/cutoff/$i
		OUT_RES=../results/open-nlp/repeat-$r/experiences/cutoff/$i
		../join-output-golden.sh $TOOL/out-subtypes.txt $TOOL/out-subtypes-gold.txt | ../conlleval > $OUT_RES/subtypes.txt
	done

	for i in {70..130..10}
	do
		if [[ $i == 100 ]]; then
			#skip default
			continue
		fi
		TOOL=../../../tools/open-nlp/outputs/repeat-$r/ner-results/experiences/iterations/$i
		OUT_RES=../results/open-nlp/repeat-$r/experiences/iterations/$i
		../join-output-golden.sh $TOOL/out-subtypes.txt $TOOL/out-subtypes-gold.txt | ../conlleval > $OUT_RES/subtypes.txt
	done
done

# python ../src/avg-results-all.py open-nlp subtypes
for i in 0 10
do
	python ../src/avg-results-experiences.py open-nlp subtypes cutoff $i
done

for i in {70..130..10}
do
	if [[ $i == 100 ]]; then
		#skip default
		continue
	fi

	python ../src/avg-results-experiences.py open-nlp subtypes iterations $i
done