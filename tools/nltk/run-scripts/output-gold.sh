#!/bin/bash

declare -a levels=("cat" "types" "subtypes" "filtered")
printf "\n*** output gold ***\n"
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	# for level in "${levels[@]}"
	# do
	# 	for i in {0..9}
	# 	do
	# 		printf "\n** fold "$i" **\n"
	# 		FOLDER=../outputs/repeat-$r/fold-$i
	# 		OUT=../outputs/repeat-$r/ner-results/fold-$i

	# 		python "../src/out-conll-gold.py" $FOLDER/t-$level-test-doc.txt $OUT/out-$level-gold.txt 'ISO-8859-1'
	# 	done

	# 	printf "\n** experiences **\n"
	# 	FOLDER=../outputs/repeat-$r/joined
	# 	python "../src/out-conll-gold.py" $FOLDER/t-$level-test-doc.txt $FOLDER/out-$level-gold.txt 'ISO-8859-1'
	# done

	printf "\n** sigarra **\n"
	FOLDER=../outputs/repeat-$r/sigarra
	python "../src/out-conll-gold.py" $FOLDER/t-sigarra-test-doc.txt $FOLDER/out-sigarra-gold.txt 'UTF-8'
done