#!/bin/bash

python "../src/remove_unwanted_spaces.py" "../outputs/cat_all.xml" "cat_all.xml"
python "../src/remove_unwanted_spaces.py" "../outputs/cat_train.xml" "cat_train.xml"
python "../src/remove_unwanted_spaces.py" "../outputs/cat_test.xml" "cat_test.xml"

python "../src/remove_unwanted_spaces.py" "../outputs/types_all.xml" "types_all.xml"
python "../src/remove_unwanted_spaces.py" "../outputs/types_train.xml" "types_train.xml"
python "../src/remove_unwanted_spaces.py" "../outputs/types_test.xml" "types_test.xml"

python "../src/remove_unwanted_spaces.py" "../outputs/subtypes_all.xml" "subtypes_all.xml"
python "../src/remove_unwanted_spaces.py" "../outputs/subtypes_train.xml" "subtypes_train.xml"
python "../src/remove_unwanted_spaces.py" "../outputs/subtypes_test.xml" "subtypes_test.xml"

python "../src/remove_unwanted_spaces.py" "../outputs/filtered_all.xml" "filtered_all.xml"
python "../src/remove_unwanted_spaces.py" "../outputs/filtered_train.xml" "filtered_train.xml"
python "../src/remove_unwanted_spaces.py" "../outputs/filtered_test.xml" "filtered_test.xml"
