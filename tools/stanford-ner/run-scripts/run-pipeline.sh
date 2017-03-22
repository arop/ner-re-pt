#!/bin/bash

# tokenize train and test set, in filter-harem/outputs/
printf "***tokenizing***\n"
time ./tokenize.sh
# convert tokens to conll annotation scheme
printf "\n***token to conll***\n"
time ./token-to-conll.sh

# train
for r in {1..3}
do
	printf "\n*****repeat "$r"*****\n"
	for i in {0..9}
	do
		printf "\n*****fold "$i"*****\n"
		printf "\n***training categories***\n"
		python ../src/change-prop.py ../props/prop.prop cat $r $i
		cd train/repeat-$r/fold-$i && time ./train-cat.sh ; cd -

		printf "\n***training filtered***\n"
		python ../src/change-prop.py ../props/prop.prop filtered $r $i
		cd train/repeat-$r/fold-$i && time ./train-filtered.sh ; cd -

		# printf "\n***training types***\n"
		# python ../src/change-prop.py ../props/prop.prop types $r $i
		# cd train/repeat-$r/fold-$i && time ./train-types.sh ; cd - # not enough RAM

		# printf "\n***training subtypes***\n"
		# python ../src/change-prop.py ../props/prop.prop subtypes $r $i
		# cd train/repeat-$r/fold-$i && time ./train-subtypes.sh ; cd - # not enough RAM
	done
done

# test - perform ner
printf "\n***testing categories***\n"
cd test && time ./test-cat.sh ; cd -
printf "\n***testing filtered***\n"
cd test && time ./test-filtered.sh ; cd -
# printf "\n***testing types***\n"
# cd test && time ./test-types.sh ; cd - # not enough RAM
# printf "\n***testing subtypes***\n"
# cd test && time ./test-subtypes.sh ; cd - # not enough RAM

# Add IOB tags
printf "\n*** Adding IOB tags ***\n"
time ./add-IOB.sh