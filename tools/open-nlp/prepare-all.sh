#!/bin/bash

# All repeats - 7min
cd run-scripts && time ./sentence-segmentation.sh; cd -
cd run-scripts && time ./join-faulty-sentences.sh; cd -
cd run-scripts && time ./clean-docs.sh; cd -
cd run-scripts && time ./output-no-tags.sh; cd -