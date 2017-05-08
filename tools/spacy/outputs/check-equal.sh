#!/bin/bash

declare -a levels=("cat" "types" "subtypes" "filtered")
for level in "${levels[@]}"
do
	printf "\n* level: "$level"*\n"
	for r in {0..3}
	do
		printf "\n** repeat "$r" **\n"
		for i in {0..9}
		do
			printf "\n** fold "$i" **\n"
			python check-equal.py $level $i $r
		done

		printf "\n** experiences **\n"
		python check-equal-exp.py $level $r iterations 10 20 30 40 50 60
	done
done