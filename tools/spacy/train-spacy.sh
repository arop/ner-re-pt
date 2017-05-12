#!/bin/bash

for r in {0..3}
do
	printf '\n*** repeat '$r' ***\n'

	# for i in {0..9}
	# do
	# 	printf '\n*** fold '$i' ***\n'
	# 	TRAIN=../../scripts/filter-harem/harem-to-standoff/outputs/repeat-$r/fold-$i
	# 	MODEL=models/repeat-$r/fold-$i

	# 	time python "src/ner-train-spacy.py" $TRAIN"/cat_train-standoff" $MODEL cat 
	# 	time python "src/ner-train-spacy.py" $TRAIN"/types_train-standoff" $MODEL types 
	# 	time python "src/ner-train-spacy.py" $TRAIN"/subtypes_train-standoff" $MODEL subtypes 
	# 	time python "src/ner-train-spacy.py" $TRAIN"/filtered_train-standoff" $MODEL filtered 
	# done

	# experiences
	#for i in {10..60..10} 100
	for i in 100
	do
		printf '\n*** iterations: '$i' ***\n'
		TRAIN=../../scripts/filter-harem/harem-to-standoff/outputs/repeat-$r/joined
		MODEL=models/repeat-$r/experiences/iterations/$i

		time python "src/ner-train-spacy-exp.py" $TRAIN"/cat_train-standoff" $MODEL cat $i
		time python "src/ner-train-spacy-exp.py" $TRAIN"/types_train-standoff" $MODEL types $i
		time python "src/ner-train-spacy-exp.py" $TRAIN"/subtypes_train-standoff" $MODEL subtypes $i
		time python "src/ner-train-spacy-exp.py" $TRAIN"/filtered_train-standoff" $MODEL filtered $i
	done
done
