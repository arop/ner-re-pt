#!/bin/bash

# join output from opennlp and test file
# evaluate results

declare -a levels=("cat" "types" "subtypes" "filtered")
for level in "${levels[@]}"
do
	for r in {0..3}
	do
	# 	for i in {0..9}
	# 	do
	# 		TOOL=../../../tools/open-nlp/outputs/repeat-$r/ner-results/fold-$i
	# 		OUT_RES=../results/open-nlp/repeat-$r/fold-$i
	# 		../join-output-golden.sh $TOOL/out-$level.txt $TOOL/out-$level-gold.txt | ../conlleval > $OUT_RES/$level.txt
	# 	done

	# 	python ../src/avg-results.py open-nlp $level $r

	# 	# experiences
	# 	for i in 0 {3..7} 10
	# 	do
	# 		TOOL=../../../tools/open-nlp/outputs/repeat-$r/ner-results/experiences/cutoff/$i
	# 		OUT_RES=../results/open-nlp/repeat-$r/experiences/cutoff/$i
	# 		../join-output-golden.sh $TOOL/out-$level.txt $TOOL/out-$level-gold.txt | ../conlleval > $OUT_RES/$level.txt
	# 	done

	# 	for i in {70..130..10} 125 135 {150..180..10} 200
	# 	do
	# 		TOOL=../../../tools/open-nlp/outputs/repeat-$r/ner-results/experiences/iterations/$i
	# 		OUT_RES=../results/open-nlp/repeat-$r/experiences/iterations/$i
	# 		../join-output-golden.sh $TOOL/out-$level.txt $TOOL/out-$level-gold.txt | ../conlleval > $OUT_RES/$level.txt
	# 	done

		TOOL=../../../tools/open-nlp/outputs/repeat-$r/ner-results/sigarra
		OUT_RES=../results/open-nlp/repeat-$r/sigarra
		../join-output-golden.sh $TOOL/out-sigarra.txt $TOOL/out-sigarra-gold.txt | ../conlleval > $OUT_RES/sigarra.txt
		../join-output-golden.sh $TOOL/out-sigarra-default.txt $TOOL/out-sigarra-gold.txt | ../conlleval > $OUT_RES/sigarra-default.txt
	done

	# python ../src/avg-results-all.py open-nlp $level

	# for i in 0 {3..7} 10
	# do
	# 	python ../src/avg-results-experiences.py open-nlp $level cutoff $i
	# done

	# for i in {70..130..10} 125 135 {150..180..10} 200
	# do
	# 	python ../src/avg-results-experiences.py open-nlp $level iterations $i
	# done

	python ../src/avg-results-sigarra.py open-nlp default
done
