#!/bin/bash

declare -a tolerances=("1e-3" "1e-4" "1e-5")
declare -a epsilon=("0.01" "0.02" "0.005") # for Huber
declare -a levels=("cat" "filtered")

# perform ner on test set
# remove empty lines (sentence segmentation)
# from http://unix.stackexchange.com/questions/76061/can-sed-remove-double-newline-characters
for r in {0..3}
do
	printf "** testing repeat - "$r" **\n" 
	for level in "${levels[@]}"
	do
		printf "** testing level - "$level" **\n"

		printf "** useQuartic **\n"
		CRF=edu.stanford.nlp.ie.crf.CRFClassifier
		TOKENIZER=edu.stanford.nlp.process.WhitespaceTokenizer
		CLASSIFIER=../../models/repeat-$r/experiences/useQuartic/$level"-ner-model.ser.gz"
		TXT=../../outputs/repeat-$r/experiences/useQuartic/t_$level"_test.txt-clean.txt"
		OUT=../../outputs/repeat-$r/ner-results/experiences/useQuartic/out-$level".txt"

		java -d64 -Xmx26g -cp ../stanford-corenlp.jar $CRF -tokenizerFactory $TOKENIZER -loadClassifier $CLASSIFIER -textFile $TXT -outputFormat tsv -encoding iso-8859-1 |  tr -s '\n' > $OUT

		##############################
		# for v in "${tolerances[@]}"
		# do
		# 	printf "** tolerance - "$v" **\n"
		# 	CRF=edu.stanford.nlp.ie.crf.CRFClassifier
		# 	TOKENIZER=edu.stanford.nlp.process.WhitespaceTokenizer
		# 	CLASSIFIER=../../models/repeat-$r/experiences/tolerance/$v/$level"-ner-model.ser.gz"
		# 	TXT=../../outputs/repeat-$r/experiences/tolerance/$v/t_$level"_test.txt-clean.txt"
		# 	OUT=../../outputs/repeat-$r/ner-results/experiences/tolerance/$v/out-$level".txt"

		# 	java -d64 -Xmx26g -cp ../stanford-corenlp.jar $CRF -tokenizerFactory $TOKENIZER -loadClassifier $CLASSIFIER -textFile $TXT -outputFormat tsv -encoding iso-8859-1 |  tr -s '\n' > $OUT
		# done

		##############################
		# for v in "${epsilon[@]}"
		# do
		# 	printf "** epsilon - "$v" **\n"
		# 	CRF=edu.stanford.nlp.ie.crf.CRFClassifier
		# 	TOKENIZER=edu.stanford.nlp.process.WhitespaceTokenizer
		# 	CLASSIFIER=../../models/repeat-$r/experiences/epsilon/$v/$level"-ner-model.ser.gz"
		# 	TXT=../../outputs/repeat-$r/experiences/epsilon/$v/t_$level"_test.txt-clean.txt"
		# 	OUT=../../outputs/repeat-$r/ner-results/experiences/epsilon/$v/out-$level".txt"

		# 	java -d64 -Xmx26g -cp ../stanford-corenlp.jar $CRF -tokenizerFactory $TOKENIZER -loadClassifier $CLASSIFIER -textFile $TXT -outputFormat tsv -encoding iso-8859-1 |  tr -s '\n' > $OUT
		# done
	done
done
