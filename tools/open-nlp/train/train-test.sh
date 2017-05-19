#!/bin/bash

# time ./run-train.sh
# time ./run-ner.sh

# time ./run-train-cutoff.sh
# time ./run-ner-cutoff.sh

# time ./run-train-iterations.sh
# time ./run-ner-iterations.sh

time ./run-train-sigarra.sh
time ./run-ner-sigarra.sh

cd .. && ./results-to-conll.sh
