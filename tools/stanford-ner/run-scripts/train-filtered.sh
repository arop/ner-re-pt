#!/bin/bash

java -Xmx4g -cp stanford-ner.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/filtered.prop"
