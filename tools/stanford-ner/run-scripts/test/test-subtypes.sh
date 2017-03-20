#!/bin/bash

# perform ner on test set
# remove empty lines (sentence segmentation)
# from http://unix.stackexchange.com/questions/76061/can-sed-remove-double-newline-characters
for i in {0..9}
do
	java -d64 -Xmx6g -cp ../stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -tokenizerFactory edu.stanford.nlp.process.WhitespaceTokenizer -loadClassifier ../../models/fold-$i/subtypes-ner-model.ser.gz -textFile "../../outputs/fold-"$i"/t_subtypes_test.txt-clean.txt" -outputFormat tsv -encoding iso-8859-1 |  tr -s '\n' > ../../outputs/ner-results/fold-$i/out-subtypes.txt
done
