#!/bin/bash

# script to loop through iterations values

SCRIPT="../src/tokenize_from_opennlp_format.py"
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	
	for i in {0..9}
	do
		TRAIN=../train/results/repeat-$r/sigarra/fold-$i
		OUTR=../outputs/repeat-$r/ner-results/sigarra/fold-$i
		OUT=../outputs/repeat-$r/sigarra/fold-$i

		python $SCRIPT $TRAIN"/out-sigarra.txt" $OUTR"/out-sigarra.txt" "UTF-8"
		python $SCRIPT $OUT"/sigarra_test_sent_doc.xml" $OUTR"/out-sigarra-gold.txt" "sigarra"
	done

	# TRAIN=../train/results/repeat-$r/sigarra
	# OUTR=../outputs/repeat-$r/ner-results/sigarra
	# OUT=../outputs/repeat-$r/sigarra
	
	# python $SCRIPT $TRAIN"/out-sigarra.txt" $OUTR"/out-sigarra.txt" "UTF-8"
	# python $SCRIPT $OUT"/sigarra_test_sent_doc.xml" $OUTR"/out-sigarra-gold.txt" "sigarra"

	# python $SCRIPT $TRAIN"/out-sigarra-default.txt" $OUTR"/out-sigarra-default.txt" "UTF-8"
	# python $SCRIPT $OUT"/sigarra_test_sent_doc.xml" $OUTR"/out-sigarra-gold.txt" "sigarra"
done