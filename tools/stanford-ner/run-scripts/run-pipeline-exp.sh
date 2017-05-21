#!/bin/bash

# tokenize train and test set, in filter-harem/outputs/
# printf "***tokenizing***\n"
# time ./tokenize.sh

# convert tokens to conll annotation scheme
# printf "\n***token to conll***\n"
# time ./token-to-conll.sh

# train
for r in {0..3}
do
	printf "\n*****repeat "$r"*****\n"
	# max iterations
	for v in 10 50 100
	do
		printf "\n*****max-iterations = "$v"*****\n"
		printf "\n***training categories***\n"
		python ../src/change-prop-exp.py ../props/experiences/max-iterations/$v".prop" cat $r "max-iterations" $v
		time java -d64 -Xmx28g -cp stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/experiences/max-iterations/"$v".prop"

		printf "\n***training filtered***\n"
		python ../src/change-prop-exp.py ../props/experiences/max-iterations/$v".prop" filtered $r "max-iterations" $v
		time java -d64 -Xmx28g -cp stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/experiences/max-iterations/"$v".prop"
	done
done

# test - perform ner
printf "\n***testing categories***\n"
cd test && time ./test-cat-exp.sh ; cd -
printf "\n***testing filtered***\n"
cd test && time ./test-filtered-exp.sh ; cd -

# Add IOB tags
printf "\n*** Adding IOB tags ***\n"
time ./add-IOB.sh