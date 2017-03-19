#!/bin/bash

# perform ner on test set
# remove empty lines (sentence segmentation)
# from http://unix.stackexchange.com/questions/76061/can-sed-remove-double-newline-characters

java -d64 -Xmx6g -cp ../stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -tokenizerFactory edu.stanford.nlp.process.WhitespaceTokenizer -loadClassifier ../../models/filtered-ner-model.ser.gz -textFile "../../outputs/t_filtered_test.txt-clean.txt" -outputFormat tsv -encoding iso-8859-1 |  tr -s '\n' > ../../outputs/ner-results/out-filtered.txt

