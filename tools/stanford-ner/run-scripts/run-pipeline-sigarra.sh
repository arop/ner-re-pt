#!/bin/bash

# tokenize train and test set, in filter-sigarra/outputs/
# printf "***tokenizing***\n"
# time ./tokenize.sh
# convert tokens to conll annotation scheme
# printf "\n***token to conll***\n"
# time ./token-to-conll.sh

# train
for r in {0..3}
do
	printf "\n*****repeat "$r"*****\n"
	# printf "\n***training sigarra***\n"
	# python ../src/change-prop-sigarra.py ../props/sigarra.prop sigarra $r
	# time java -d64 -Xmx28g -cp stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/sigarra.prop"

	printf "\n***training sigarra default ***\n"
	python ../src/change-prop-sigarra.py ../props/sigarra-default.prop sigarra-default $r
	time java -d64 -Xmx28g -cp stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/sigarra-default.prop"
done

# test - perform ner
printf "\n***testing sigarra***\n"
cd test && time ./test-sigarra.sh ; cd - 

# Add IOB tags
printf "\n*** Adding IOB tags ***\n"
time ./add-IOB.sh