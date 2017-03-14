#!/bin/bash

#python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_all.xml" "cat_all_sent.xml"
#python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_train.xml" "cat_train_sent.xml"
#python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_test.xml" "cat_test_sent.xml"

python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_all_doc.xml" "cat_all_sent_doc.xml"
python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_train_doc.xml" "cat_train_sent_doc.xml"
python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/cat_test_doc.xml" "cat_test_sent_doc.xml"

python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/types_all_doc.xml" "types_all_sent_doc.xml"
python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/types_train_doc.xml" "types_train_sent_doc.xml"
python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/types_test_doc.xml" "types_test_sent_doc.xml"

python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/subtypes_all_doc.xml" "subtypes_all_sent_doc.xml"
python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/subtypes_train_doc.xml" "subtypes_train_sent_doc.xml"
python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/subtypes_test_doc.xml" "subtypes_test_sent_doc.xml"

python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/filtered_all_doc.xml" "filtered_all_sent_doc.xml"
python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/filtered_train_doc.xml" "filtered_train_sent_doc.xml"
python "src/sentence-segmentation.py" "../../scripts/filter-harem/harem-to-opennlp/outputs/filtered_test_doc.xml" "filtered_test_sent_doc.xml"