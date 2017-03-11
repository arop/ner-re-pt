#!/bin/bash

python "join-faulty-sentences.py" "outputs/cat_all_sent.xml" "outputs/cat_all_sent.xml"
python "join-faulty-sentences.py" "outputs/cat_train_sent.xml" "outputs/cat_train_sent.xml"
python "join-faulty-sentences.py" "outputs/cat_test_sent.xml" "outputs/cat_test_sent.xml"