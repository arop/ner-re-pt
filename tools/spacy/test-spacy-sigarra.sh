#!/bin/bash

for r in {0..3}
do
	printf '\n** repeat '$r' **\n'

	FOLDER=../../scripts/filter-sigarra/sigarra-to-standoff/outputs/repeat-$r/
	MODEL=repeat-$r/sigarra

	OUT=repeat-$r/sigarra/out-sigarra
	time python "src/ner-test-spacy-sigarra.py" $FOLDER/"sigarra_test-standoff" $MODEL/sigarra $OUT
	
	# OUT=repeat-$r/sigarra/out-sigarra-default
	# time python "src/ner-test-spacy-sigarra.py" $FOLDER/"sigarra_test-standoff" $MODEL/sigarra-default $OUT
done
