#!/bin/bash

java -d64 -Xmx6g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "props/subtypes.prop"

java -d64 -Xmx6g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier subtypes-ner-model.ser.gz -testFile "../../scripts/filter-harem/harem-to-conll/output/cat_test"