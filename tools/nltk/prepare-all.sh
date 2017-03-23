#!/bin/bash

time ./tokenize.sh # 13min
time ./pos-tag.sh # 5min
time ./join-pos-entities.sh #5s
time ./output-gold.sh #5s