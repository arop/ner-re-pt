#!/bin/bash

# join output from nltk and test file
# evaluate results

declare -a levels=("cat" "types" "subtypes" "filtered")
for level in "${levels[@]}"
do
	for r in {0..3}
	do
		# for i in {0..9}
		# do
		# 	TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/fold-$i
		# 	OUT_RES=../results/nltk/repeat-$r/fold-$i
		# 	../join-output-golden.sh $TOOL/out-$level-DT.txt $TOOL/out-$level-gold.txt | ../conlleval > $OUT_RES/$level-DT.txt
		# 	../join-output-golden.sh $TOOL/out-$level-ME.txt $TOOL/out-$level-gold.txt | ../conlleval > $OUT_RES/$level-ME.txt
		# 	../join-output-golden.sh $TOOL/out-$level-NB.txt $TOOL/out-$level-gold.txt | ../conlleval > $OUT_RES/$level-NB.txt
		# done

		# python ../src/avg-results.py nltk $level-DT $r
		# python ../src/avg-results.py nltk $level-ME $r
		# python ../src/avg-results.py nltk $level-NB $r

		# experiences
		# TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/experiences
		# GOLD=../../../tools/nltk/outputs/repeat-$r/joined
		# OUT_RES=../results/nltk/repeat-$r/experiences

		# MaxEnt
		# for i in {10..120..10}
		# do
		# 	FOLDER=me_max_iter/$i
		# 	../join-output-golden.sh $TOOL/$FOLDER/out-$level-ME.txt $GOLD/out-$level-gold.txt | ../conlleval > $OUT_RES/$FOLDER/$level.txt
		# done

		# for i in 0 0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.05 0.1 0.15 0.2
		# do
		# 	FOLDER=me_min_lldelta/$i
		# 	../join-output-golden.sh $TOOL/$FOLDER/out-$level-ME.txt $GOLD/out-$level-gold.txt | ../conlleval > $OUT_RES/$FOLDER/$level.txt
		# done

		# for i in 0 0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.05 0.1 0.15 0.2
		# do
		# 	FOLDER=me_min_lldelta-iter-100/$i
		# 	../join-output-golden.sh $TOOL/$FOLDER/out-$level-ME.txt $GOLD/out-$level-gold.txt | ../conlleval > $OUT_RES/$FOLDER/$level.txt
		# done

		# DecisionTree
		# for i in 3 {7..20}
		# do
		# 	FOLDER=dt_support_cutoff/$i
		# 	../join-output-golden.sh $TOOL/$FOLDER/out-$level-DT.txt $GOLD/out-$level-gold.txt | ../conlleval > $OUT_RES/$FOLDER/$level.txt
		# done

		# for i in 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.11 0.12 0.13
		# do
		# 	FOLDER=dt_entropy_cutoff/$i
		# 	../join-output-golden.sh $TOOL/$FOLDER/out-$level-DT.txt $GOLD/out-$level-gold.txt | ../conlleval > $OUT_RES/$FOLDER/$level.txt
		# done

		# for i in 2 5 {10..120..10}
		# do
		# 	FOLDER=dt_depth_cutoff/$i
		# 	../join-output-golden.sh $TOOL/$FOLDER/out-$level-DT.txt $GOLD/out-$level-gold.txt | ../conlleval > $OUT_RES/$FOLDER/$level.txt
		# done


		# SIGARRA
		TOOL=../../../tools/nltk/outputs/repeat-$r/ner-results/sigarra
		GOLD=../../../tools/nltk/outputs/repeat-$r/sigarra
		OUT_RES=../results/nltk/repeat-$r/sigarra

		# ../join-output-golden.sh $TOOL/out-sigarra-NB.txt $GOLD/out-sigarra-gold.txt | ../conlleval > $OUT_RES/sigarra-NB.txt

		# ../join-output-golden.sh $TOOL/out-sigarra-ME.txt $GOLD/out-sigarra-gold.txt | ../conlleval > $OUT_RES/sigarra-ME.txt
		# ../join-output-golden.sh $TOOL/out-sigarra-ME-default.txt $GOLD/out-sigarra-gold.txt | ../conlleval > $OUT_RES/sigarra-ME-default.txt

		# ../join-output-golden.sh $TOOL/out-sigarra-DT.txt $GOLD/out-sigarra-gold.txt | ../conlleval > $OUT_RES/sigarra-DT.txt
		../join-output-golden.sh $TOOL/out-sigarra-DT-default.txt $GOLD/out-sigarra-gold.txt | ../conlleval > $OUT_RES/sigarra-DT-default.txt

	done

	# python ../src/avg-results-all.py nltk $level-DT
	# python ../src/avg-results-all.py nltk $level-ME
	# python ../src/avg-results-all.py nltk $level-NB

	# experiences
	# MaxEnt
	# for v in {10..120..10}
	# do
	# 	python ../src/avg-results-experiences.py nltk $level me_max_iter $v
	# done

	# for v in 0 0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.05 0.1 0.15 0.2
	# do
	# 	python ../src/avg-results-experiences.py nltk $level me_min_lldelta $v
	# done

	# for v in 0 0.0000001 0.000001 0.00001 0.0001 0.001 0.01 0.05 0.1 0.15 0.2
	# do
	# 	python ../src/avg-results-experiences.py nltk $level me_min_lldelta-iter-100 $v
	# done

	# DecisionTree
	# for v in 3 {7..20}
	# do
	# 	python ../src/avg-results-experiences.py nltk $level dt_support_cutoff $v
	# done

	# for v in 2 5 {10..120..10}
	# do
	# 	python ../src/avg-results-experiences.py nltk $level dt_depth_cutoff $v
	# done

	# for v in 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.11 0.12 0.13
	# do
	# 	python ../src/avg-results-experiences.py nltk $level dt_entropy_cutoff $v
	# done

	# SIGARRA
	# python ../src/avg-results-sigarra.py nltk NB
	# python ../src/avg-results-sigarra.py nltk ME
	# python ../src/avg-results-sigarra.py nltk ME-default
	# python ../src/avg-results-sigarra.py nltk DT
	python ../src/avg-results-sigarra.py nltk DT-default
done