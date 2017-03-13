#!/bin/bash

python "src/opennlp2standoff.py" "../../../tools/open-nlp/outputs/cat_all_sent.xml" "outputs/cat_all"
python "src/opennlp2standoff.py" "../../../tools/open-nlp/outputs/cat_train_sent.xml" "outputs/cat_train"
python "src/opennlp2standoff.py" "../../../tools/open-nlp/outputs/cat_test_sent.xml" "outputs/cat_test"