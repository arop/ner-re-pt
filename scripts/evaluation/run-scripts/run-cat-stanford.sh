#!/bin/bash

# join output from stanford ner and test file
# evaluate results
../join-output-golden.sh ../../../tools/stanford-ner/outputs/ner-results/out-cat.txt ../../../tools/stanford-ner/outputs/t_cat_test.txt | ../conlleval -r > ../results/stanford-ner/cat.txt
