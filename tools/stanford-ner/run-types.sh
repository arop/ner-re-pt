#!/bin/bash

java -d64 -Xms6g -Xmx7g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "props/types.prop"

java -d64 -Xms6g -Xmx7g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier types-ner-model.ser.gz -testFile "../../scripts/filter-harem/harem-to-stanford/output/cat_test"