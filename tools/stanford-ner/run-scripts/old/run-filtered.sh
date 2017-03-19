#!/bin/bash

java -Xmx4g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/filtered.prop"

java -Xmx4g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier models/filtered-ner-model.ser.gz -testFile "../../../scripts/filter-harem/harem-to-stanford/output/filtered_test"