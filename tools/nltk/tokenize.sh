#!/bin/bash

python "src/tokenize-files.py"

python "src/tokenize_w_categories.py" '../../scripts/filter-harem/outputs/cat_all.xml' 'tokenized_w_categories_all'
python "src/tokenize_w_categories.py" '../../scripts/filter-harem/outputs/cat_train.xml' 'tokenized_w_categories_train'
python "src/tokenize_w_categories.py" '../../scripts/filter-harem/outputs/cat_test.xml' 'tokenized_w_categories_test'


