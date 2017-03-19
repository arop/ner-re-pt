#!/bin/bash

python "../src/output-no-tags.py" "../outputs/cat_test.xml" "cat"
python "../src/output-no-tags.py" "../outputs/types_test.xml" "types"
python "../src/output-no-tags.py" "../outputs/subtypes_test.xml" "subtypes"
python "../src/output-no-tags.py" "../outputs/filtered_test.xml" "filtered"