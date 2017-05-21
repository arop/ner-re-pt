#!/bin/bash

# perform ner on test set
# remove empty lines (sentence segmentation)
# from http://unix.stackexchange.com/questions/76061/can-sed-remove-double-newline-characters
for r in {0..3}
do
	for v in 10 50 100
	do
		CRF=edu.stanford.nlp.ie.crf.CRFClassifier
		TOKENIZER=edu.stanford.nlp.process.WhitespaceTokenizer
		CLASSIFIER=../../models/repeat-$r/experiences/max-iterations/$v/filtered-ner-model.ser.gz
		TXT=../../outputs/repeat-$r/experiences/max-iterations/$v/t_filtered_test.txt-clean.txt
		OUT=../../outputs/repeat-$r/ner-results/experiences/max-iterations/$v/out-filtered.txt

		java -d64 -Xmx6g -cp ../stanford-corenlp.jar $CRF -tokenizerFactory $TOKENIZER -loadClassifier $CLASSIFIER -textFile $TXT -outputFormat tsv -encoding iso-8859-1 |  tr -s '\n' > $OUT
	done
done
