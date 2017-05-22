#!/bin/bash

# tokenize train and test set, in filter-harem/outputs/
# printf "***tokenizing***\n"
# time ./tokenize.sh

# convert tokens to conll annotation scheme
# printf "\n***token to conll***\n"
# time ./token-to-conll.sh

declare -a tolerances=("1e-3" "1e-4" "1e-5")
declare -a epsilon=("0.01" "0.02" "0.005") # for Huber

# train
for r in {0..3}
do
	printf "\n*****repeat "$r"*****\n"

	# printf "\n***** useQuartic *****\n"
	# printf "\n***training categories***\n"
	# python ../src/change-prop-exp.py ../props/experiences/useQuartic/prop.prop cat $r "useQuartic" "none"
	# time java -d64 -Xmx28g -cp stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/experiences/useQuartic/prop.prop"

	# printf "\n***training filtered***\n"
	# python ../src/change-prop-exp.py ../props/experiences/useQuartic/prop.prop filtered $r "useQuartic" "none"
	# time java -d64 -Xmx28g -cp stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/experiences/useQuartic/prop.prop"

	# tolerance
	for v in "${tolerances[@]}"
	do
		printf "\n*****tolerance = "$v"*****\n"
		printf "\n***training categories***\n"
		python ../src/change-prop-exp.py ../props/experiences/tolerance/$v".prop" cat $r "tolerance" $v
		time java -d64 -Xmx28g -cp stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/experiences/tolerance/"$v".prop"

		printf "\n***training filtered***\n"
		python ../src/change-prop-exp.py ../props/experiences/tolerance/$v".prop" filtered $r "tolerance" $v
		time java -d64 -Xmx28g -cp stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/experiences/tolerance/"$v".prop"
	done

	# useHuber
	# for v in "${epsilon[@]}"
	# do
	# 	printf "\n*****epsilon = "$v"*****\n"
	# 	printf "\n***training categories***\n"
	# 	python ../src/change-prop-exp.py ../props/experiences/epsilon/$v".prop" cat $r "epsilon" $v
	# 	time java -d64 -Xmx28g -cp stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/experiences/epsilon/"$v".prop"

	# 	printf "\n***training filtered***\n"
	# 	python ../src/change-prop-exp.py ../props/experiences/epsilon/$v".prop" filtered $r "epsilon" $v
	# 	time java -d64 -Xmx28g -cp stanford-corenlp.jar edu.stanford.nlp.ie.crf.CRFClassifier -prop "../props/experiences/epsilon/"$v".prop"
	# done
done

# test - perform ner
printf "\n***testing***\n"
cd test && time ./test-exp.sh ; cd -

# Add IOB tags
printf "\n*** Adding IOB tags ***\n"
time ./add-IOB.sh