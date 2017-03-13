#!/bin/bash

python "src/join-faulty-sentences.py" "outputs/cat_all_sent.xml" "outputs/cat_all_sent.xml"
python "src/join-faulty-sentences.py" "outputs/cat_train_sent.xml" "outputs/cat_train_sent.xml"
python "src/join-faulty-sentences.py" "outputs/cat_test_sent.xml" "outputs/cat_test_sent.xml"

python "src/join-faulty-sentences.py" "outputs/cat_all_sent_doc.xml" "outputs/cat_all_sent_doc.xml"
python "src/join-faulty-sentences.py" "outputs/cat_train_sent_doc.xml" "outputs/cat_train_sent_doc.xml"
python "src/join-faulty-sentences.py" "outputs/cat_test_sent_doc.xml" "outputs/cat_test_sent_doc.xml"