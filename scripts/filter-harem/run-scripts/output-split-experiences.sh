#!/bin/bash

for r in {0..3}
do
	python "../src/split_train_test_experiences.py" "../outputs/filtered_all.xml" "filtered" $r
	python "../src/split_train_test_experiences.py" "../outputs/cat_all.xml" "cat" $r
	python "../src/split_train_test_experiences.py" "../outputs/types_all.xml" "types" $r
	python "../src/split_train_test_experiences.py" "../outputs/subtypes_all.xml" "subtypes" $r
done