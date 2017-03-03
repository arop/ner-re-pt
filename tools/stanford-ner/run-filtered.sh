#!/bin/bash

java -Xmx4g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "props/filtered.prop"

java -Xmx4g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier filtered-ner-model.ser.gz -testFile "../../scripts/filter-harem/harem-to-conll/output/filtered_test"