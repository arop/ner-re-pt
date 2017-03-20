#!/bin/bash

for i in {0..9}
do
	printf "\n** fold "$i" **\n"
	printf "\n** training categories **\n"
	iconv -f ISO-8859-1 -t UTF-8 ../outputs/fold-$i/cat_test_sent_doc-clean.xml | bin/opennlp TokenNameFinder models/fold-$i/pt-ner-cat.bin > results/fold-$i/out-cat.txt
	printf "\n** testing types **\n"
	iconv -f ISO-8859-1 -t UTF-8 ../outputs/fold-$i/types_test_sent_doc-clean.xml | bin/opennlp TokenNameFinder models/fold-$i/pt-ner-types.bin > results/fold-$i/out-types.txt
	printf "\n** testing subtypes **\n"
	iconv -f ISO-8859-1 -t UTF-8 ../outputs/fold-$i/subtypes_test_sent_doc-clean.xml | bin/opennlp TokenNameFinder models/fold-$i/pt-ner-subtypes.bin > results/fold-$i/out-subtypes.txt
	printf "\n** testing filtered **\n"
	iconv -f ISO-8859-1 -t UTF-8 ../outputs/fold-$i/filtered_test_sent_doc-clean.xml | bin/opennlp TokenNameFinder models/fold-$i/pt-ner-filtered.bin > results/fold-$i/out-filtered.txt
done

