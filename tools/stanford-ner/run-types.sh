#!/bin/bash

java -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "props/types.prop"

java -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -loadClassifier types-ner-model.ser.gz -testFile "../../scripts/filter-harem/harem-to-conll/output/cat_test"