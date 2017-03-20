#!/bin/bash

./sentence-segmentation.sh
./join-faulty-sentences.sh
./clean-docs.sh
./output-no-tags.sh