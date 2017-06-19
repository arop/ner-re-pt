#!/bin/bash

java -d64 -Xmx28g -cp ../stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../../props/prop.prop"
