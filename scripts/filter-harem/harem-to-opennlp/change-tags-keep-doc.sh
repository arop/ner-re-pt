#!/bin/bash

python "src/change_tags_keep_doc.py" "../outputs/cat_all.xml" "cat_all_doc.xml"
python "src/change_tags_keep_doc.py" "../outputs/cat_train.xml" "cat_train_doc.xml"
python "src/change_tags_keep_doc.py" "../outputs/cat_test.xml" "cat_test_doc.xml"