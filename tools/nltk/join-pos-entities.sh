#!/bin/bash

python "src/join-pos-categories.py" 'outputs/pos-tagged.txt' 'outputs/t-cat-all.txt' 'ready_default.txt'
python "src/join-pos-categories.py" 'outputs/pos-docs-test.txt' 'outputs/t-cat-test-doc.txt' 'ready_docs.txt'
