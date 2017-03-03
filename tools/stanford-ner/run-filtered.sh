#!/bin/bash

java -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "props/filtered.prop"

java -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier cat-ner-model.ser.gz -testFile "../../scripts/filter-harem/harem-to-conll/output/filtered_test"