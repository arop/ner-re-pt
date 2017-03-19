#!/bin/bash

# join output from stanford ner and test file
# evaluate results
../join-output-golden.sh ../../../tools/stanford-ner/outputs/ner-results/out-types.txt ../../../tools/stanford-ner/outputs/t_types_test.txt | ../conlleval -r > ../results/stanford-ner/types.txt
