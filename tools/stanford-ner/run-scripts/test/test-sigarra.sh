#!/bin/bash

# perform ner on test set
# remove empty lines (sentence segmentation)
# from http://unix.stackexchange.com/questions/76061/can-sed-remove-double-newline-characters
for r in {0..3}
do
	printf "** testing repeat - "$r" **\n" 

	printf "** testing sigarra **\n"
	CRF=edu.stanford.nlp.ie.crf.CRFClassifier
	TOKENIZER=edu.stanford.nlp.process.WhitespaceTokenizer

	CLASSIFIER=../../models/repeat-$r/sigarra/"sigarra-ner-model.ser.gz"
	TXT=../../outputs/repeat-$r/sigarra/"t_sigarra_test.txt-clean.txt"
	OUT=../../outputs/repeat-$r/ner-results/sigarra/"out-sigarra.txt"

	java -d64 -Xmx26g -cp ../stanford-corenlp.jar $CRF -tokenizerFactory $TOKENIZER -loadClassifier $CLASSIFIER -textFile $TXT -outputFormat tsv -encoding utf-8 |  tr -s '\n' > $OUT

	printf "** testing sigarra default **\n"
	CLASSIFIER=../../models/repeat-$r/sigarra/"sigarra-default-ner-model.ser.gz"
	TXT=../../outputs/repeat-$r/sigarra/"t_sigarra_test.txt-clean.txt"
	OUT=../../outputs/repeat-$r/ner-results/sigarra/"out-sigarra-default.txt"

	java -d64 -Xmx26g -cp ../stanford-corenlp.jar $CRF -tokenizerFactory $TOKENIZER -loadClassifier $CLASSIFIER -textFile $TXT -outputFormat tsv -encoding utf-8 |  tr -s '\n' > $OUT
done
