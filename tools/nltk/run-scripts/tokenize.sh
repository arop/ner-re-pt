#!/bin/bash

declare -a levels=("cat" "types" "subtypes" "filtered")
printf "\n*** tokenizing ***\n"
SCRIPT="../src/tokenize_from_opennlp_format.py"

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	for level in "${levels[@]}"
	do
		for i in {0..9}
		do
			printf "\n** fold "$i" **\n"
			FOLDER=../../open-nlp/outputs/repeat-$r/fold-$i
			OUT=../outputs/repeat-$r/fold-$i

			python $SCRIPT $FOLDER/$level_train_sent_doc.xml $OUT/t-$level-train-doc.txt
			python $SCRIPT $FOLDER/$level_test_sent_doc.xml $OUT/t-$level-test-doc.txt
		done


		printf "\n** experiences **\n"
		FOLDER=../../open-nlp/outputs/repeat-$r/joined
		OUT=../outputs/repeat-$r/joined

		python $SCRIPT $FOLDER/$level_train_sent_doc.xml $OUT/t-$level-train-doc.txt
		python $SCRIPT $FOLDER/$level_test_sent_doc.xml $OUT/t-$level-test-doc.txt
	done
done