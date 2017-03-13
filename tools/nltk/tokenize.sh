#!/bin/bash

#python "src/tokenize-files.py"

python "src/tokenize_w_categories.py" '../../scripts/filter-harem/outputs/cat_all.xml' 't-cat-all.txt'
python "src/tokenize_w_categories.py" '../../scripts/filter-harem/outputs/cat_train.xml' 't-cat-train.txt'
python "src/tokenize_w_categories.py" '../../scripts/filter-harem/outputs/cat_test.xml' 't-cat-test.txt'

python "src/tokenize_from_opennlp_format.py" '../../scripts/filter-harem/harem-to-opennlp/outputs/cat_all_doc.xml' 't-cat-all-doc.txt'
python "src/tokenize_from_opennlp_format.py" '../../scripts/filter-harem/harem-to-opennlp/outputs/cat_train_doc.xml' 't-cat-train-doc.txt'
python "src/tokenize_from_opennlp_format.py" '../../scripts/filter-harem/harem-to-opennlp/outputs/cat_test_doc.xml' 't-cat-test-doc.txt'

