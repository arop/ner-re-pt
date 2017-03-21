#!/bin/bash

python "src/ner-train-spacy.py" "../../scripts/filter-harem/harem-to-standoff/outputs/cat_train-standoff" "../../scripts/filter-harem/harem-to-standoff/outputs/cat_test-standoff"
