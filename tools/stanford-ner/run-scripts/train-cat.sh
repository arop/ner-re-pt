#!/bin/bash

java -d64 -Xmx6g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/cat.prop"
