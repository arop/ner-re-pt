#!/bin/bash

#python "src/join-pos-categories.py" 'outputs/pos-tagged.txt' 'outputs/t-cat-all.txt' 'ready_default.txt'
python "src/join-pos-categories.py" 'outputs/pos-docs-all.txt' 'outputs/t-cat-all-doc.txt' 'conll-final.txt'
