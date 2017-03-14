#!/bin/bash

#python "src/tokenize-files.py"

#python "src/tokenize_w_categories.py" '../../scripts/filter-harem/outputs/cat_all.xml' 't-cat-all.txt'
#python "src/tokenize_w_categories.py" '../../scripts/filter-harem/outputs/cat_train.xml' 't-cat-train.txt'
#python "src/tokenize_w_categories.py" '../../scripts/filter-harem/outputs/cat_test.xml' 't-cat-test.txt'

#python "src/tokenize_from_opennlp_format.py" '../open-nlp/outputs/cat_all_sent_doc.xml' 't-cat-all-doc.txt'
#python "src/tokenize_from_opennlp_format.py" '../open-nlp/outputs/cat_train_sent_doc.xml' 't-cat-train-doc.txt'
#python "src/tokenize_from_opennlp_format.py" '../open-nlp/outputs/cat_test_sent_doc.xml' 't-cat-test-doc.txt'

#python "src/tokenize_from_opennlp_format.py" '../open-nlp/outputs/types_all_sent_doc.xml' 't-types-all-doc.txt'
#python "src/tokenize_from_opennlp_format.py" '../open-nlp/outputs/subtypes_all_sent_doc.xml' 't-subtypes-all-doc.txt'
python "src/tokenize_from_opennlp_format.py" '../open-nlp/outputs/filtered_all_sent_doc.xml' 't-filtered-all-doc.txt'
