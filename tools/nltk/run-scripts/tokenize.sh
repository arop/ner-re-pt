#!/bin/bash

declare -a levels=("cat" "types" "subtypes" "filtered")
printf "\n*** tokenizing ***\n"
SCRIPT="../src/tokenize_from_opennlp_format.py"

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	# for level in "${levels[@]}"
	# do
	# 	for i in {0..9}
	# 	do
	# 		printf "\n** fold "$i" **\n"
	# 		FOLDER=../../open-nlp/outputs/repeat-$r/fold-$i
	# 		OUT=../outputs/repeat-$r/fold-$i

	# 		python $SCRIPT $FOLDER/$level_train_sent_doc.xml $OUT/t-$level-train-doc.txt 'ISO-8859-1'
	# 		python $SCRIPT $FOLDER/$level_test_sent_doc.xml $OUT/t-$level-test-doc.txt 'ISO-8859-1'
	# 	done


		# printf "\n** experiences **\n"
		# FOLDER=../../open-nlp/outputs/repeat-$r/joined
		# OUT=../outputs/repeat-$r/joined

	# 	python $SCRIPT $FOLDER/$level'_train_sent_doc.xml' $OUT/t-$level-train-doc.txt 'ISO-8859-1'
		# python $SCRIPT $FOLDER/$level'_test_sent_doc.xml' $OUT/t-$level-test-doc.txt 'ISO-8859-1'
	# done

	# printf "\n** sigarra **\n"

	# for i in {0..9}
	# do
	# 	FOLDER=../../open-nlp/outputs/repeat-$r/sigarra/fold-$i
	# 	OUT=../outputs/repeat-$r/sigarra/fold-$i

	# 	python $SCRIPT $FOLDER/sigarra_train_sent_doc.xml $OUT/t-sigarra-train-doc.txt 'UTF-8'
	# 	python $SCRIPT $FOLDER/sigarra_test_sent_doc.xml $OUT/t-sigarra-test-doc.txt 'UTF-8'
	# done

	# FOLDER=../../open-nlp/outputs/repeat-$r/sigarra
	# OUT=../outputs/repeat-$r/sigarra

	# python $SCRIPT $FOLDER/sigarra_train_sent_doc.xml $OUT/t-sigarra-train-doc.txt 'UTF-8'
	# python $SCRIPT $FOLDER/sigarra_test_sent_doc.xml $OUT/t-sigarra-test-doc.txt 'UTF-8'
done