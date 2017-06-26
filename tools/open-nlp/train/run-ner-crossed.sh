#!/bin/bash

printf "\n** performing ner crossed **\n"
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"
		FOLDER=../outputs/repeat-$r/fold-$i
		MODEL=models/repeat-$r/sigarra/fold-$i
		RESULTS=../outputs/repeat-$r/crossed/m_sigarra-t_cat/fold-$i

		iconv -f ISO-8859-1 -t UTF-8 $FOLDER/cat_test_sent_doc-clean.xml | bin/opennlp TokenNameFinder $MODEL/pt-ner-sigarra.bin > $RESULTS/out.txt

		FOLDER=../outputs/repeat-$r/sigarra/fold-$i
		MODEL=models/repeat-$r/fold-$i
		RESULTS=../outputs/repeat-$r/crossed/m_cat-t_sigarra/fold-$i

		bin/opennlp TokenNameFinder $MODEL/pt-ner-cat.bin < $FOLDER/sigarra_test_sent_doc-clean.xml > $RESULTS/out.txt
	done
done
