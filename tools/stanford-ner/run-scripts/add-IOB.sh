#!/bin/bash

for i in {0..9}
do
	printf "\n***** fold "$i" *****\n"
	
	FOLDER=../outputs/ner-results/fold-$i
	FOLDERG=../outputs/fold-$i
	
	python ../src/add-IOB.py $FOLDER'/out-cat.txt'
	#python ../src/add-IOB.py $FOLDER'/out-types.txt'
	#python ../src/add-IOB.py $FOLDER'/out-subtypes.txt'
	python ../src/add-IOB.py $FOLDER'/out-filtered.txt'

	python ../src/add-IOB.py $FOLDERG'/t_cat_test.txt'
	python ../src/add-IOB.py $FOLDERG'/t_types_test.txt'
	python ../src/add-IOB.py $FOLDERG'/t_subtypes_test.txt'
	python ../src/add-IOB.py $FOLDERG'/t_filtered_test.txt'
done

