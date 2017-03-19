#!/bin/bash

java -d64 -Xms6g -Xmx14g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/types.prop"

java -d64 -Xms6g -Xmx14g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier ../models/types-ner-model.ser.gz -testFile "../../../scripts/filter-harem/harem-to-stanford/output/types_test"