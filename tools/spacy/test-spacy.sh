#!/bin/bash
for r in {0..3}
do
	printf '\n** repeat '$r' **\n'
	for i in {0..9}
	do
		printf '\n** fold '$i' **\n'
		FOLDER=../../scripts/filter-harem/harem-to-standoff/outputs/repeat-$r/fold-$i

		python "src/ner-test-spacy.py" $FOLDER/"cat_test-standoff" repeat-$r/fold-$i/cat
		python "src/ner-test-spacy.py" $FOLDER/"cat_test-standoff" repeat-$r/fold-$i/types
		python "src/ner-test-spacy.py" $FOLDER/"cat_test-standoff" repeat-$r/fold-$i/subtypes
		python "src/ner-test-spacy.py" $FOLDER/"cat_test-standoff" repeat-$r/fold-$i/filtered

		iconv -f UTF-8 -t ISO-8859-1 outputs/repeat-$r/fold-$i/cat-gold.txt outputs/repeat-$r/fold-$i/cat-gold.txt
		iconv -f UTF-8 -t ISO-8859-1 outputs/repeat-$r/fold-$i/types-gold.txt outputs/repeat-$r/fold-$i/types-gold.txt
		iconv -f UTF-8 -t ISO-8859-1 outputs/repeat-$r/fold-$i/subtypes-gold.txt outputs/repeat-$r/fold-$i/subtypes-gold.txt
		iconv -f UTF-8 -t ISO-8859-1 outputs/repeat-$r/fold-$i/filtered-gold.txt outputs/repeat-$r/fold-$i/filtered-gold.txt
	done
done
