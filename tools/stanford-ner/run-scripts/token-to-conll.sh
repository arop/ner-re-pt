#!/bin/bash

for r in {0..3}
do
	printf "\n***** repeat "$r" *****\n"
	# for i in {0..9}
	# do
	# 	printf "\n***** fold "$i" *****\n"
	# 	printf "\n*** categories ***\n"
	# 	python "../src/token-to-conll.py" "../outputs/repeat-"$r"/fold-"$i"/t_cat_train.txt"
	# 	python "../src/token-to-conll.py" "../outputs/repeat-"$r"/fold-"$i"/t_cat_test.txt"

	# 	printf "\n*** types ***\n"
	# 	python "../src/token-to-conll.py" "../outputs/repeat-"$r"/fold-"$i"/t_types_train.txt"
	# 	python "../src/token-to-conll.py" "../outputs/repeat-"$r"/fold-"$i"/t_types_test.txt"

	# 	printf "\n*** subtypes ***\n"
	# 	python "../src/token-to-conll.py" "../outputs/repeat-"$r"/fold-"$i"/t_subtypes_train.txt"
	# 	python "../src/token-to-conll.py" "../outputs/repeat-"$r"/fold-"$i"/t_subtypes_test.txt"

	# 	printf "\n*** filtered ***\n"
	# 	python "../src/token-to-conll.py" "../outputs/repeat-"$r"/fold-"$i"/t_filtered_train.txt"
	# 	python "../src/token-to-conll.py" "../outputs/repeat-"$r"/fold-"$i"/t_filtered_test.txt"
	# done

	# printf "\n*** experiences ***\n"
	# printf "\n*** categories ***\n"
	# python "../src/token-to-conll.py" "../outputs/repeat-"$r"/joined/t_cat_train.txt"
	# python "../src/token-to-conll.py" "../outputs/repeat-"$r"/joined/t_cat_test.txt"

	# printf "\n*** types ***\n"
	# python "../src/token-to-conll.py" "../outputs/repeat-"$r"/joined/t_types_train.txt"
	# python "../src/token-to-conll.py" "../outputs/repeat-"$r"/joined/t_types_test.txt"

	# printf "\n*** subtypes ***\n"
	# python "../src/token-to-conll.py" "../outputs/repeat-"$r"/joined/t_subtypes_train.txt"
	# python "../src/token-to-conll.py" "../outputs/repeat-"$r"/joined/t_subtypes_test.txt"

	# printf "\n*** filtered ***\n"
	# python "../src/token-to-conll.py" "../outputs/repeat-"$r"/joined/t_filtered_train.txt"
	# python "../src/token-to-conll.py" "../outputs/repeat-"$r"/joined/t_filtered_test.txt"

	printf "\n*** sigarra ***\n"
	python "../src/token-to-conll-sigarra.py" "../outputs/repeat-"$r"/sigarra/t_sigarra_train.txt"
	python "../src/token-to-conll-sigarra.py" "../outputs/repeat-"$r"/sigarra/t_sigarra_test.txt"
done
