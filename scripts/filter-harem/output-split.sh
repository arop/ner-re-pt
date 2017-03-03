#!/bin/bash

python "src/split_train_test.py" "outputs/harem-filtered.xml" "filtered"
python "src/split_train_test.py" "outputs/harem-only-categories.xml" "cat"
python "src/split_train_test.py" "outputs/harem-only-types.xml" "types"
python "src/split_train_test.py" "outputs/harem-only-subtypes.xml" "subtypes"