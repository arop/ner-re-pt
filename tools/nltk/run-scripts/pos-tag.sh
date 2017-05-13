#!/bin/bash

declare -a levels=("cat" "types" "subtypes" "filtered")
SCRIPT="../src/pos-tagging-docs.py"
printf "\n*** pos tagging ***\n"
# all 20min
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	for level in "${levels[@]}"
	do
		for i in {0..9}
		do
			FOLDER=../outputs/repeat-$r/fold-$i
		
			printf "\n** fold "$i" **\n"
			python $SCRIPT $FOLDER/t-$level-train-doc.txt $FOLDER/pos-$level-docs-train.txt
			python $SCRIPT $FOLDER/t-$level-test-doc.txt $FOLDER/pos-$level-docs-test.txt
		done

		FOLDER=../outputs/repeat-$r/joined
		
		printf "\n** experiences **\n"
		python $SCRIPT $FOLDER/t-$level-train-doc.txt $FOLDER/pos-$level-docs-train.txt
		python $SCRIPT $FOLDER/t-$level-test-doc.txt $FOLDER/pos-$level-docs-test.txt
	done
done