#!/bin/bash

python "sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_all.xml" "cat_all_sent.xml"
python "sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_train.xml" "cat_train_sent.xml"
python "sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_test.xml" "cat_test_sent.xml"