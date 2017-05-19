#!/bin/bash

printf "\n** performing ner sigarra **\n"
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	FOLDER=../outputs/repeat-$r/sigarra
	MODEL=models/repeat-$r/sigarra
	RESULTS=results/repeat-$r/sigarra

	bin/opennlp TokenNameFinder $MODEL/pt-ner-sigarra.bin < $FOLDER/sigarra_test_sent_doc-clean.xml > $RESULTS/out-sigarra.txt
done
