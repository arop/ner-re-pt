#!/bin/bash

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"
		python check-equal.py "cat" $i $r
		#python check-equal.py "types" $i
		#python check-equal.py "subtypes" $i
		python check-equal.py "filtered" $i $r
	done

	printf "\n** experiences **\n"
	python check-equal-exp.py "cat" $r "tolerance" "1e-3" "1e-4" "1e-5"
	python check-equal-exp.py "filtered" $r "tolerance" "1e-3" "1e-4" "1e-5"
done