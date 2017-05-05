#!/bin/bash
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"
		python check-equal.py "cat" $i $r
		python check-equal.py "types" $i $r
		python check-equal.py "subtypes" $i $r
		python check-equal.py "filtered" $i $r
	done

	printf "\n** experiences **\n"
	python check-equal-exp.py "cat" $r cutoff 0 5 10
	python check-equal-exp.py "cat" $r iterations 70 80 90 100 110 120 130

	python check-equal-exp.py "types" $r cutoff 0 5 10
	python check-equal-exp.py "types" $r iterations 70 80 90 100 110 120 130

	python check-equal-exp.py "subtypes" $r cutoff 0 5 10
	python check-equal-exp.py "subtypes" $r iterations 70 80 90 100 110 120 130

	python check-equal-exp.py "filtered" $r cutoff 0 5 10
	python check-equal-exp.py "filtered" $r iterations 70 80 90 100 110 120 130

done