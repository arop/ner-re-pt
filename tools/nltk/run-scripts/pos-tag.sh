#!/bin/bash

declare -a levels=("cat" "types" "subtypes" "filtered")
SCRIPT="../src/pos-tagging-docs.py"
printf "\n*** pos tagging ***\n"
# all 20min
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	# for level in "${levels[@]}"
	# do
	# 	for i in {0..9}
	# 	do
	# 		FOLDER=../outputs/repeat-$r/fold-$i
		
	# 		printf "\n** fold "$i" **\n"
	# 		python $SCRIPT $FOLDER/t-$level-train-doc.txt $FOLDER/pos-$level-docs-train.txt 'ISO-8859-1'
	# 		python $SCRIPT $FOLDER/t-$level-test-doc.txt $FOLDER/pos-$level-docs-test.txt 'ISO-8859-1'
	# 	done

	# 	FOLDER=../outputs/repeat-$r/joined
		
	# 	printf "\n** experiences **\n"
	# 	python $SCRIPT $FOLDER/t-$level-train-doc.txt $FOLDER/pos-$level-docs-train.txt 'ISO-8859-1'
	# 	python $SCRIPT $FOLDER/t-$level-test-doc.txt $FOLDER/pos-$level-docs-test.txt 'ISO-8859-1'
	# done

	printf "\n** sigarra **\n"
	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"
		FOLDER=../outputs/repeat-$r/sigarra/fold-$i
		
		python $SCRIPT $FOLDER/t-sigarra-train-doc.txt $FOLDER/pos-sigarra-docs-train.txt 'UTF-8'
		python $SCRIPT $FOLDER/t-sigarra-test-doc.txt $FOLDER/pos-sigarra-docs-test.txt 'UTF-8'
	done

	# FOLDER=../outputs/repeat-$r/sigarra
	
	# python $SCRIPT $FOLDER/t-sigarra-train-doc.txt $FOLDER/pos-sigarra-docs-train.txt 'UTF-8'
	# python $SCRIPT $FOLDER/t-sigarra-test-doc.txt $FOLDER/pos-sigarra-docs-test.txt 'UTF-8'
done