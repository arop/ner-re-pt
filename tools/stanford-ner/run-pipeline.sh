#!/bin/bash

# tokenize train and test set, in filter-harem/outputs/
./run-scripts/tokenize.sh
# convert tokens to conll annotation scheme
./run-scripts/token-to-conll.sh

# train
./run-scripts/train/train-cat.sh
./run-scripts/train/train-filtered.sh
# ./run-scripts/train/train-types.sh # not enough RAM
# ./run-scripts/train/train-subtypes.sh # not enough RAM

# test - perform ner
./run-scripts/test/test-cat.sh
./run-scripts/test/test-filtered.sh
# ./run-scripts/test/test-types.sh # not enough RAM
# ./run-scripts/test/test-subtypes.sh # not enough RAM