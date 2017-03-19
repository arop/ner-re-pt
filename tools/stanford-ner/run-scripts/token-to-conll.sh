#!/bin/bash

python "../src/token-to-conll.py" "../outputs/t_cat_test.txt"
python "../src/token-to-conll.py" "../outputs/t_cat_train.txt"

python "../src/token-to-conll.py" "../outputs/t_types_train.txt"
python "../src/token-to-conll.py" "../outputs/t_types_test.txt"

python "../src/token-to-conll.py" "../outputs/t_subtypes_train.txt"
python "../src/token-to-conll.py" "../outputs/t_subtypes_test.txt"

python "../src/token-to-conll.py" "../outputs/t_filtered_train.txt"
python "../src/token-to-conll.py" "../outputs/t_filtered_test.txt"


