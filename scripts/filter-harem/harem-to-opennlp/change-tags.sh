#!/bin/bash

python "src/change_tags.py" "../outputs/cat_all.xml" "cat_all.xml"
python "src/change_tags.py" "../outputs/cat_train.xml" "cat_train.xml"
python "src/change_tags.py" "../outputs/cat_test.xml" "cat_test.xml"