#!/bin/bash

# All repeats - 7min
time ./sentence-segmentation.sh
time ./join-faulty-sentences.sh
time ./clean-docs.sh
time ./output-no-tags.sh