#!/bin/bash

java -d64 -Xmx6g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "props/cat.prop"

java -d64 -Xmx6g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier cat-ner-model.ser.gz -testFile "../../scripts/filter-harem/harem-to-stanford/output/cat_test"