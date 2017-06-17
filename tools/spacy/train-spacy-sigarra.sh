#!/bin/bash

for r in {0..3}
do
	printf '\n*** repeat '$r' ***\n'

	for i in {0..9}
	do
		printf '\n*** fold '$i' ***\n'
		TRAIN=../../scripts/filter-sigarra/sigarra-to-standoff/outputs/repeat-$r/fold-$i
		MODEL=models/repeat-$r/sigarra/fold-$i

		# time python "src/ner-train-spacy-sigarra.py" $TRAIN"/sigarra_train-standoff" $MODEL sigarra 110
		time python "src/ner-train-spacy-sigarra.py" $TRAIN"/sigarra_train-standoff" $MODEL sigarra-default 10
	done

	# TRAIN=../../scripts/filter-sigarra/sigarra-to-standoff/outputs/repeat-$r/
	# MODEL=models/repeat-$r/sigarra

	# time python "src/ner-train-spacy-sigarra.py" $TRAIN"/sigarra_train-standoff" $MODEL sigarra 110
	# time python "src/ner-train-spacy-sigarra.py" $TRAIN"/sigarra_train-standoff" $MODEL sigarra-default 10
done
