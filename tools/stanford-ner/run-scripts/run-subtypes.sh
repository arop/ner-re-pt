#!/bin/bash

java -d64 -Xmx14g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/subtypes.prop"

java -d64 -Xmx14g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier ../models/subtypes-ner-model.ser.gz -testFile "../../../scripts/filter-harem/harem-to-stanford/output/subtypes_test"