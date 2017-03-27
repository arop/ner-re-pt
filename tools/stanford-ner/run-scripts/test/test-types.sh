#!/bin/bash

# perform ner on test set
# remove empty lines (sentence segmentation)
# from http://unix.stackexchange.com/questions/76061/can-sed-remove-double-newline-characters
for r in {0..3}
do
	for i in {0..9}
	do
		CRF=edu.stanford.nlp.ie.crf.CRFClassifier
		TOKENIZER=edu.stanford.nlp.process.WhitespaceTokenizer
		CLASSIFIER=../../models/repeat-$r/fold-$i/types-ner-model.ser.gz
		TXT="../../outputs/repeat-"$r"/fold-"$i"/t_types_test.txt-clean.txt"
		OUT=../../outputs/ner-results/fold-$i/out-types.txt

		java -d64 -Xmx6g -cp ../stanford-corenlp.jar $CRF -tokenizerFactory $TOKENIZER -loadClassifier $CLASSIFIER -textFile $TXT -outputFormat tsv -encoding iso-8859-1 |  tr -s '\n' > $OUT
	done
done
