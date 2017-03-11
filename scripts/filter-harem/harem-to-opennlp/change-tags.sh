#!/bin/bash

python "change_tags.py" "../outputs/cat_all.xml" "cat_all.xml" "categories"
python "change_tags.py" "../outputs/cat_train.xml" "cat_train.xml" "categories"
python "change_tags.py" "../outputs/cat_test.xml" "cat_test.xml" "categories"