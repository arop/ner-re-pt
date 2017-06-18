#!/bin/bash

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	# for i in {0..9}
	# do
	# 	printf "\n** fold "$i" **\n"
	# 	python check-equal.py "cat" $i $r
	# 	#python check-equal.py "types" $i
	# 	#python check-equal.py "subtypes" $i
	# 	python check-equal.py "filtered" $i $r
	# done

	# printf "\n** experiences **\n"
	# python check-equal-exp.py "cat" $r "tolerance" "1e-3" "1e-4" "1e-5" "5e-3" "5e-4" "5e-5"
	# python check-equal-exp.py "filtered" $r "tolerance" "1e-3" "1e-4" "1e-5" "5e-3" "5e-4" "5e-5"

	# python check-equal-exp.py "cat" $r "epsilon" 0.005 0.01 0.015 0.02 
	# python check-equal-exp.py "filtered" $r "epsilon" 0.005 0.01 0.015 0.02 

	# python check-equal-exp.py "cat" $r "maxNGramLeng" {4..10}
	# python check-equal-exp.py "filtered" $r "maxNGramLeng" {4..7}

	printf "\n** sigarra **\n"
	# python check-equal-sigarra.py "sigarra" $r
	# python check-equal-sigarra.py "sigarra" $r default

	for i in {0..9}
	do
		# python check-equal-sigarra-10fold.py "sigarra" $r $i
		python check-equal-sigarra-10fold.py "sigarra" $r $i default
	done
done