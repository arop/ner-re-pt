#!/bin/bash

java -d64 -Xmx6g -cp stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -tokenizerFactory edu.stanford.nlp.process.WhitespaceTokenizer -loadClassifier ../models/cat-ner-model.ser.gz -textFile "../outputs/t_cat_test.txt-clean.txt" -outputFormat tsv -encoding iso-8859-1 > ../outputs/ner-results/out-cat.txt