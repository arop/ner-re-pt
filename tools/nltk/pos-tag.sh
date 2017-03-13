#!/bin/bash

#python "src/pos-tagging.py"
python "src/pos-tagging-docs.py" "outputs/t-cat-all-doc.txt" "pos-cat-docs-all.txt"
#python "src/pos-tagging-docs.py" "outputs/t-cat-test-doc.txt" "pos-cat-docs-test.txt"
#python "src/pos-tagging-docs.py" "outputs/t-cat-train-doc.txt" "pos-cat-docs-train.txt"

python "src/pos-tagging-docs.py" "outputs/t-types-all-doc.txt" "pos-types-docs-all.txt"

python "src/pos-tagging-docs.py" "outputs/t-subtypes-all-doc.txt" "pos-subtypes-docs-all.txt"
