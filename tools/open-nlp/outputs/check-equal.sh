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
		python check-equal-exp.py $level $r cutoff 0 {3..7} 10
		python check-equal-exp.py $level $r iterations {70..130..10} 125 135 {150..180..10} 200
	done
done