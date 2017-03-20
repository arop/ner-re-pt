#!/bin/bash

java -d64 -Xms6g -Xmx14g -cp ../../stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../../../props/fold-1/types.prop"
