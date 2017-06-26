#!/bin/bash

# declare -a levels=("cat" "types" "subtypes" "filtered")
# for level in "${levels[@]}"
# do
# 	printf "\n* level: "$level"*\n"
# 	for r in {0..3}
# 	do
# 		printf "\n** repeat "$r" **\n"
# 		for i in {0..9}
# 		do
# 			printf "\n** fold "$i" **\n"
# 			python src/check-equal.py $level $i $r
# 		done

# 		printf "\n** experiences **\n"
# 		python src/check-equal-exp.py $level $r cutoff 0 {3..7} 10
# 		python src/check-equal-exp.py $level $r iterations {70..130..10} 125 135 {150..180..10} 200

# 	done
# done

# printf "\n** sigarra **\n"
# for r in {0..3}
# do
# 	for i in {0..9}
# 	do
# 		python src/check-equal-sigarra-10fold.py $r $i
# 		python src/check-equal-sigarra-10fold.py $r $i default
# 	done

# 	python src/check-equal-sigarra.py $r
# 	python src/check-equal-sigarra.py $r default
# done

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	for i in {0..9}
	do
		python src/check-equal-crossed.py "m_cat-t_sigarra" $i $r
		python src/check-equal-crossed.py "m_sigarra-t_cat" $i $r
	done
done