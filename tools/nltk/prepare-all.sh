#!/bin/bash

./tokenize.sh # 13min
./pos-tag.sh # 5min
./join-pos-entities.sh #5s
./output-gold.sh #5s