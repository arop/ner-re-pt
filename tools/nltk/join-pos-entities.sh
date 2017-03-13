#!/bin/bash

#python "src/join-pos-categories.py" 'outputs/pos-tagged.txt' 'outputs/t-cat-all.txt' 'ready_default.txt'
python "src/join-pos-categories.py" 'outputs/pos-cat-docs-all.txt' 'outputs/t-cat-all-doc.txt' 'conll-cat-final.txt'
python "src/join-pos-categories.py" 'outputs/pos-types-docs-all.txt' 'outputs/t-types-all-doc.txt' 'conll-types-final.txt'
python "src/join-pos-categories.py" 'outputs/pos-subtypes-docs-all.txt' 'outputs/t-subtypes-all-doc.txt' 'conll-subtypes-final.txt'
