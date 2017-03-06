#!/bin/bash

python "../src/split_train_test.py" "outputs/filtered_all.xml" "filtered"
python "../src/split_train_test.py" "outputs/cat_all.xml" "cat"
python "../src/split_train_test.py" "outputs/types_all.xml" "types"
python "../src/split_train_test.py" "outputs/subtypes_all.xml" "subtypes"