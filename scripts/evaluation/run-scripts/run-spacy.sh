#!/bin/bash

# join output from spacy ner and test file
# evaluate results

declare -a levels=("cat" "types" "subtypes" "filtered")
for level in "${levels[@]}"
do
	for r in {0..3}
	do
		# for i in {0..9}
		# do
		# 	TOOL=../../../tools/spacy/outputs/repeat-$r/fold-$i
		# 	OUT_RES=../results/spacy/repeat-$r/fold-$i
		# 	../join-output-golden.sh $TOOL/$level.txt $TOOL/out-$level-gold.txt | ../conlleval > $OUT_RES/$level.txt
		# done

		# python ../src/avg-results.py spacy $level $r

		# experiences
		# for i in {10..120..10}
		# do
		# 	TOOL=../../../tools/spacy/outputs/repeat-$r/experiences/iterations/$i
		# 	OUT_RES=../results/spacy/repeat-$r/experiences/iterations/$i
		# 	../join-output-golden.sh $TOOL/$level.txt $TOOL/out-$level-gold.txt | ../conlleval > $OUT_RES/$level.txt
		# done

		# SIGARRA

		for i in {0..9}
		do
			TOOL=../../../tools/spacy/outputs/repeat-$r/sigarra/fold-$i
			OUT_RES=../results/spacy/repeat-$r/sigarra/fold-$i
			# ../join-output-golden.sh $TOOL/sigarra.txt $TOOL/out-sigarra-gold.txt | ../conlleval > $OUT_RES/sigarra.txt
			../join-output-golden.sh $TOOL/sigarra-default.txt $TOOL/out-sigarra-gold.txt | ../conlleval > $OUT_RES/sigarra-default.txt
		done

		python ../src/avg-results-sigarra-10fold.py spacy sigarra $r
		python ../src/avg-results-sigarra-10fold.py spacy sigarra-default $r

		# TOOL=../../../tools/spacy/outputs/repeat-$r/sigarra
		# OUT_RES=../results/spacy/repeat-$r/sigarra
		# ../join-output-golden.sh $TOOL/sigarra.txt $TOOL/out-sigarra-gold.txt | ../conlleval > $OUT_RES/sigarra.txt
		# ../join-output-golden.sh $TOOL/sigarra-default.txt $TOOL/out-sigarra-default-gold.txt | ../conlleval > $OUT_RES/sigarra-default.txt
	done

	# python ../src/avg-results-all.py spacy $level

	# for i in {10..120..10}
	# do
	# 	python ../src/avg-results-experiences.py spacy $level iterations $i
	# done

	# python ../src/avg-results-sigarra.py spacy
	# python ../src/avg-results-sigarra.py spacy default

	# python ../src/avg-results-sigarra.py spacy 10fold
	python ../src/avg-results-sigarra.py spacy 10fold default
done