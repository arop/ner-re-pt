#!/bin/bash

declare -a tolerances=("1e-3" "1e-4" "1e-5" "5e-3" "5e-4" "5e-5")
declare -a epsilon=("0.01" "0.02" "0.005" "0.015") # for Huber, deprecated?

for r in {0..3}
do
	printf "\n***** repeat "$r" *****\n"
	# for i in {0..9}
	# do
	# 	printf "\n***** fold "$i" *****\n"
		
	# 	FOLDER=../outputs/repeat-$r/ner-results/fold-$i
	# 	FOLDERG=../outputs/repeat-$r/fold-$i
		
	# 	python ../src/add-IOB.py $FOLDER'/out-cat.txt' $FOLDER'/out-cat-iob.txt'
	# 	#python ../src/add-IOB.py $FOLDER'/out-types.txt' $FOLDER'/out-types-iob.txt'
	# 	#python ../src/add-IOB.py $FOLDER'/out-subtypes.txt' $FOLDER'/out-subtypes-iob.txt'
	# 	python ../src/add-IOB.py $FOLDER'/out-filtered.txt' $FOLDER'/out-filtered-iob.txt'

	# 	python ../src/add-IOB.py $FOLDERG'/t_cat_test.txt' $FOLDERG'/t_cat_test-iob.txt'
	# 	python ../src/add-IOB.py $FOLDERG'/t_types_test.txt' $FOLDERG'/t_types_test-iob.txt'
	# 	python ../src/add-IOB.py $FOLDERG'/t_subtypes_test.txt' $FOLDERG'/t_subtypes_test-iob.txt'
	# 	python ../src/add-IOB.py $FOLDERG'/t_filtered_test.txt' $FOLDERG'/t_filtered_test-iob.txt'
	# done

	# experiences
	# gold
	# FOLDERG=../outputs/repeat-$r/joined
	# python ../src/add-IOB.py $FOLDERG'/t_cat_test.txt' $FOLDERG'/t_cat_test-iob.txt'
	# python ../src/add-IOB.py $FOLDERG'/t_filtered_test.txt' $FOLDERG'/t_filtered_test-iob.txt'

	# tolerance
	# for v in "${tolerances[@]}"
	# do
	# 	FOLDER=../outputs/repeat-$r/ner-results/experiences/tolerance/$v
	
	# 	python ../src/add-IOB.py $FOLDER'/out-cat.txt' $FOLDER'/out-cat-iob.txt'
	# 	python ../src/add-IOB.py $FOLDER'/out-filtered.txt' $FOLDER'/out-filtered-iob.txt'
	# done

	# epsilon
	# for v in "${epsilon[@]}"
	# do
	# 	FOLDER=../outputs/repeat-$r/ner-results/experiences/epsilon/$v
	
	# 	python ../src/add-IOB.py $FOLDER'/out-cat.txt' $FOLDER'/out-cat-iob.txt'
	# 	python ../src/add-IOB.py $FOLDER'/out-filtered.txt' $FOLDER'/out-filtered-iob.txt'
	# done

	# maxNGramLeng
	# for v in {4..7}
	# do
	# 	FOLDER=../outputs/repeat-$r/ner-results/experiences/maxNGramLeng/$v
	
	# 	python ../src/add-IOB.py $FOLDER'/out-cat.txt' $FOLDER'/out-cat-iob.txt'
	# 	python ../src/add-IOB.py $FOLDER'/out-filtered.txt' $FOLDER'/out-filtered-iob.txt'
	# done

	# SIGARRA
	for i in {0..9}
	do
		printf "\n***** fold "$i" *****\n"
		# gold
		# FOLDERG=../outputs/repeat-$r/sigarra/fold-$i
		# python ../src/add-IOB.py $FOLDERG'/t_sigarra_test.txt' $FOLDERG'/t_sigarra_test-iob.txt'

		FOLDER=../outputs/repeat-$r/ner-results/sigarra/fold-$i
		# python ../src/add-IOB.py $FOLDER'/out-sigarra.txt' $FOLDER'/out-sigarra-iob.txt'
		python ../src/add-IOB.py $FOLDER'/out-sigarra-default.txt' $FOLDER'/out-sigarra-default-iob.txt'
	done
	
	# gold
	# FOLDERG=../outputs/repeat-$r/sigarra
	# python ../src/add-IOB.py $FOLDERG'/t_sigarra_test.txt' $FOLDERG'/t_sigarra_test-iob.txt'

	# FOLDER=../outputs/repeat-$r/ner-results/sigarra
	# python ../src/add-IOB.py $FOLDER'/out-sigarra.txt' $FOLDER'/out-sigarra-iob.txt'
	# python ../src/add-IOB.py $FOLDER'/out-sigarra-default.txt' $FOLDER'/out-sigarra-default-iob.txt'
done
