#!/bin/bash

# join output from stanford ner and test file
# evaluate results

declare -a levels=("cat" "filtered") # levels=("cat" "types" "subtypes" "filtered")
declare -a tolerances=("1e-3" "1e-4" "1e-5" "5e-3" "5e-4" "5e-5")
declare -a epsilons=(0.005 0.01 0.015 0.02)

for level in "${levels[@]}"
do
	for r in {0..3}
	do
		# for i in {0..9}
		# do
		# 	TOOL=../../../tools/stanford-ner
		# 	IN_NER=$TOOL/outputs/repeat-$r/ner-results/fold-$i
		# 	IN_GOLD=$TOOL/outputs/repeat-$r/fold-$i
		# 	OUT_RES=../results/stanford-ner/repeat-$r/fold-$i

		# 	../join-output-golden.sh $IN_NER/out-$level-iob.txt $IN_GOLD/"t_"$level"_test-iob".txt | ../conlleval > $OUT_RES/$level.txt
		# done

		# python ../src/avg-results.py stanford-ner $level $r


		# for v in "${tolerances[@]}"
		# do
		# 	TOOL=../../../tools/stanford-ner
		# 	IN_NER=$TOOL/outputs/repeat-$r/ner-results/experiences/tolerance/$v
		# 	IN_GOLD=$TOOL/outputs/repeat-$r/joined
		# 	OUT_RES=../results/stanford-ner/repeat-$r/experiences/tolerance/$v

		# 	../join-output-golden.sh $IN_NER/out-$level-iob.txt $IN_GOLD/"t_"$level"_test-iob".txt | ../conlleval > $OUT_RES/$level.txt
		# done

		# for v in "${epsilons[@]}"
		# do
		# 	TOOL=../../../tools/stanford-ner
		# 	IN_NER=$TOOL/outputs/repeat-$r/ner-results/experiences/epsilon/$v
		# 	IN_GOLD=$TOOL/outputs/repeat-$r/joined
		# 	OUT_RES=../results/stanford-ner/repeat-$r/experiences/epsilon/$v

		# 	../join-output-golden.sh $IN_NER/out-$level-iob.txt $IN_GOLD/"t_"$level"_test-iob".txt | ../conlleval > $OUT_RES/$level.txt
		# done

		for v in {4..10}
		do
			TOOL=../../../tools/stanford-ner
			IN_NER=$TOOL/outputs/repeat-$r/ner-results/experiences/maxNGramLeng/$v
			IN_GOLD=$TOOL/outputs/repeat-$r/joined
			OUT_RES=../results/stanford-ner/repeat-$r/experiences/maxNGramLeng/$v

			../join-output-golden.sh $IN_NER/out-$level-iob.txt $IN_GOLD/"t_"$level"_test-iob".txt | ../conlleval > $OUT_RES/$level.txt
		done
	done

	# python ../src/avg-results-all.py stanford-ner $level

	# for v in "${tolerances[@]}"
	# do
	# 	python ../src/avg-results-experiences.py stanford-ner $level tolerance $v
	# done

	# for v in "${epsilons[@]}"
	# do
	# 	python ../src/avg-results-experiences.py stanford-ner $level epsilon $v
	# done

	for v in {4..10}
	do
		python ../src/avg-results-experiences.py stanford-ner $level maxNGramLeng $v
	done
done