#!/bin/bash

printf "\n** performing ner default **\n"
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	for i in {0..9}
	do
		FOLDER=repeat-$r/fold-$i
		printf "\n** fold "$i" **\n"
		printf "\n** testing categories **\n"
		iconv -f ISO-8859-1 -t UTF-8 ../outputs/$FOLDER/cat_test_sent_doc-clean.xml | bin/opennlp TokenNameFinder models/$FOLDER/pt-ner-cat.bin > results/$FOLDER/out-cat.txt
		printf "\n** testing types **\n"
		iconv -f ISO-8859-1 -t UTF-8 ../outputs/$FOLDER/types_test_sent_doc-clean.xml | bin/opennlp TokenNameFinder models/$FOLDER/pt-ner-types.bin > results/$FOLDER/out-types.txt
		printf "\n** testing subtypes **\n"
		iconv -f ISO-8859-1 -t UTF-8 ../outputs/$FOLDER/subtypes_test_sent_doc-clean.xml | bin/opennlp TokenNameFinder models/$FOLDER/pt-ner-subtypes.bin > results/$FOLDER/out-subtypes.txt
		printf "\n** testing filtered **\n"
		iconv -f ISO-8859-1 -t UTF-8 ../outputs/$FOLDER/filtered_test_sent_doc-clean.xml | bin/opennlp TokenNameFinder models/$FOLDER/pt-ner-filtered.bin > results/$FOLDER/out-filtered.txt
	done
done
