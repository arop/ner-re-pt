#!/bin/bash

java -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "props/subtypes.prop"

java -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier subtypes-ner-model.ser.gz -testFile "../../scripts/filter-harem/harem-to-conll/output/cat_test"