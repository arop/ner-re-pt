#!/bin/bash

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	# for i in {0..9}
	# do
	# 	printf "\n** fold "$i" **\n"
	# 	python src/check-equal.py "cat" $i $r
	# 	# python check-equal.py "types" $i
	# 	# python check-equal.py "subtypes" $i
	# 	python src/check-equal.py "filtered" $i $r
	# done

	# printf "\n** experiences **\n"
	# python src/check-equal-exp.py "cat" $r "tolerance" "1e-3" "1e-4" "1e-5" "5e-3" "5e-4" "5e-5"
	# python src/check-equal-exp.py "filtered" $r "tolerance" "1e-3" "1e-4" "1e-5" "5e-3" "5e-4" "5e-5"

	# python src/check-equal-exp.py "cat" $r "epsilon" 0.005 0.01 0.015 0.02 
	# python src/check-equal-exp.py "filtered" $r "epsilon" 0.005 0.01 0.015 0.02 

	# python src/check-equal-exp.py "cat" $r "maxNGramLeng" {4..7}
	# python src/check-equal-exp.py "filtered" $r "maxNGramLeng" {4..7}

	# printf "\n** sigarra **\n"
	# python src/check-equal-sigarra.py "sigarra" $r
	# python src/check-equal-sigarra.py "sigarra" $r default

	# for i in {0..9}
	# do
	# 	python src/check-equal-sigarra-10fold.py "sigarra" $r $i
	# 	python src/check-equal-sigarra-10fold.py "sigarra" $r $i default
	# done

	for i in {0..9}
	do
		python src/check-equal-crossed.py "m_cat-t_sigarra" $i $r
		python src/check-equal-crossed.py "m_sigarra-t_cat" $i $r
	done
done