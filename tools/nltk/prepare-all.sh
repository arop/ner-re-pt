#!/bin/bash

cd run-scripts && time ./tokenize.sh; cd - # 13min
cd run-scripts && time ./pos-tag.sh; cd - # 5min
cd run-scripts && time ./join-pos-entities.sh; cd - #5s
cd run-scripts && time ./output-gold.sh; cd - #5s