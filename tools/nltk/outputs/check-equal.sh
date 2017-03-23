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
done