#!/bin/bash

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
	# max-iterations
	for v in 10 50 100
	do
		FOLDER=../outputs/repeat-$r/ner-results/experiences/max-iterations/$v
		FOLDERG=../outputs/repeat-$r/joined
	
		python ../src/add-IOB.py $FOLDER'/out-cat.txt' $FOLDER'/out-cat-iob.txt'
		python ../src/add-IOB.py $FOLDER'/out-filtered.txt' $FOLDER'/out-filtered-iob.txt'

		python ../src/add-IOB.py $FOLDERG'/t_cat_test.txt' $FOLDERG'/t_cat_test-iob.txt'
		python ../src/add-IOB.py $FOLDERG'/t_filtered_test.txt' $FOLDERG'/t_filtered_test-iob.txt'
	done
done
