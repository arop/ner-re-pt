#!/bin/bash

time ./run-open-nlp-train.sh
time ./run-open-nlp-ner.sh
cd .. && ./results-to-conll.sh
