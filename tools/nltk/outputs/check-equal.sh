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
		python check-equal-exp.py $level $r "ME" "me_max_iter" {10..120..10}
		python check-equal-exp.py $level $r "ME" "me_min_lldelta" 0 0.05 0.1 0.15 0.2

		python check-equal-exp.py $level $r "DT" "dt_support_cutoff" 3 {7..12}
		python check-equal-exp.py $level $r "DT" "dt_entropy_cutoff" 0.03 0.04 0.05 0.06 0.07 0.08 0.09 0.1 0.11 0.12 0.13
		python check-equal-exp.py $level $r "DT" "dt_depth_cutoff" {70..120..10}
	done
done