#!/bin/bash

for r in {0..3}
do
	printf '\n*** repeat '$r' ***\n'

	for i in {0..9}
	do
		printf '\n*** fold '$i' ***\n'
		TRAIN=../../scripts/filter-harem/harem-to-standoff/outputs/repeat-$r/fold-$i
		MODEL=models/repeat-$r/fold-$i

		python "src/ner-train-spacy.py" $TRAIN"/cat_train-standoff" $MODEL cat 
		python "src/ner-train-spacy.py" $TRAIN"/types_train-standoff" $MODEL types 
		python "src/ner-train-spacy.py" $TRAIN"/subtypes_train-standoff" $MODEL subtypes 
		python "src/ner-train-spacy.py" $TRAIN"/filtered_train-standoff" $MODEL filtered 
	done
done
