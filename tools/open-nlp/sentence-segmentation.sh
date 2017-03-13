#!/bin/bash

python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_all.xml" "cat_all_sent.xml"
python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_train.xml" "cat_train_sent.xml"
python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_test.xml" "cat_test_sent.xml"

python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_all_doc.xml" "cat_all_sent_doc.xml"
python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_train_doc.xml" "cat_train_sent_doc.xml"
python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_test_doc.xml" "cat_test_sent_doc.xml"