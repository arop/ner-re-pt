#!/bin/bash

cd run-scripts && time ./tokenize.sh; cd - # 1h50
cd run-scripts && time ./pos-tag.sh; cd - # 45min
cd run-scripts && time ./join-pos-entities.sh; cd - #30s
cd run-scripts && time ./output-gold.sh; cd - #4s