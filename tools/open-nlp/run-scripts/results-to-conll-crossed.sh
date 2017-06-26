#!/bin/bash

SCRIPT="../src/tokenize_from_opennlp_format.py"
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	
	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"
		FOLDER=../outputs/repeat-$r/crossed/m_cat-t_sigarra/fold-$i
		
		python $SCRIPT $FOLDER"/out.txt" $FOLDER"/out-iob.txt" "UTF-8"
		
		OUT=../outputs/repeat-$r/sigarra/fold-$i
		python $SCRIPT $OUT"/sigarra_test_sent_doc.xml" $FOLDER"/out-sigarra-gold.txt" "sigarra"

		######################
		FOLDER=../outputs/repeat-$r/crossed/m_sigarra-t_cat/fold-$i
		
		python $SCRIPT $FOLDER"/out.txt" $FOLDER"/out-iob.txt" "UTF-8"

		OUT=../outputs/repeat-$r/fold-$i
		python $SCRIPT $OUT"/cat_test_sent_doc.xml" $FOLDER"/out-cat-gold.txt" "ISO-8859-1"
	done
done