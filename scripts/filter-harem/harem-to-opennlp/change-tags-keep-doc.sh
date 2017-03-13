#!/bin/bash

python "src/change_tags_keep_doc.py" "../outputs/cat_all.xml" "cat_all_doc.xml"
python "src/change_tags_keep_doc.py" "../outputs/cat_train.xml" "cat_train_doc.xml"
python "src/change_tags_keep_doc.py" "../outputs/cat_test.xml" "cat_test_doc.xml"

python "src/change_tags_keep_doc.py" "../outputs/types_all.xml" "types_all_doc.xml"
python "src/change_tags_keep_doc.py" "../outputs/types_train.xml" "types_train_doc.xml"
python "src/change_tags_keep_doc.py" "../outputs/types_test.xml" "types_test_doc.xml"

python "src/change_tags_keep_doc.py" "../outputs/subtypes_all.xml" "subtypes_all_doc.xml"
python "src/change_tags_keep_doc.py" "../outputs/subtypes_train.xml" "subtypes_train_doc.xml"
python "src/change_tags_keep_doc.py" "../outputs/subtypes_test.xml" "subtypes_test_doc.xml"