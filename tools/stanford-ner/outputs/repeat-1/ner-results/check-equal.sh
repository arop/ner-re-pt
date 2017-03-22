#!/bin/bash

for i in {0..9}
do
	printf "\n** fold "$i" **\n"
	python check-equal.py "cat" $i
	#python check-equal.py "types" $i
	#python check-equal.py "subtypes" $i
	python check-equal.py "filtered" $i
done