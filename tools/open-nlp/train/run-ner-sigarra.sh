#!/bin/bash

printf "\n** performing ner sigarra **\n"
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"
		FOLDER=../outputs/repeat-$r/sigarra/fold-$i
		MODEL=models/repeat-$r/sigarra/fold-$i
		RESULTS=results/repeat-$r/sigarra/fold-$i

		# bin/opennlp TokenNameFinder $MODEL/pt-ner-sigarra.bin < $FOLDER/sigarra_test_sent_doc-clean.xml > $RESULTS/out-sigarra.txt
		bin/opennlp TokenNameFinder $MODEL/pt-ner-sigarra-default.bin < $FOLDER/sigarra_test_sent_doc-clean.xml > $RESULTS/out-sigarra-default.txt
	done

	# FOLDER=../outputs/repeat-$r/sigarra
	# MODEL=models/repeat-$r/sigarra
	# RESULTS=results/repeat-$r/sigarra

	# # bin/opennlp TokenNameFinder $MODEL/pt-ner-sigarra.bin < $FOLDER/sigarra_test_sent_doc-clean.xml > $RESULTS/out-sigarra.txt
	# bin/opennlp TokenNameFinder $MODEL/pt-ner-sigarra-default.bin < $FOLDER/sigarra_test_sent_doc-clean.xml > $RESULTS/out-sigarra-default.txt
done
