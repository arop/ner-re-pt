#!/bin/bash

for r in {0..3}
do
	printf '\n** repeat '$r' **\n'
	for i in {0..9}
	do
		printf '\n** fold '$i' **\n'
		FOLDER=../../scripts/filter-harem/harem-to-standoff/outputs/repeat-$r/fold-$i
		FOLDER_OUT=outputs/repeat-$r/fold-$i
		MODEL=repeat-$r/fold-$i

		time python "src/ner-test-spacy.py" $FOLDER/"cat_test-standoff" $MODEL/cat
		time python "src/ner-test-spacy.py" $FOLDER/"types_test-standoff" $MODEL/types
		time python "src/ner-test-spacy.py" $FOLDER/"subtypes_test-standoff" $MODEL/subtypes
		time python "src/ner-test-spacy.py" $FOLDER/"filtered_test-standoff" $MODEL/filtered

		iconv -f UTF-8 -t ISO-8859-1 $FOLDER_OUT/cat-gold.txt > $FOLDER_OUT/out-cat-gold.txt
		iconv -f UTF-8 -t ISO-8859-1 $FOLDER_OUT/types-gold.txt > $FOLDER_OUT/out-types-gold.txt
		iconv -f UTF-8 -t ISO-8859-1 $FOLDER_OUT/subtypes-gold.txt > $FOLDER_OUT/out-subtypes-gold.txt
		iconv -f UTF-8 -t ISO-8859-1 $FOLDER_OUT/filtered-gold.txt > $FOLDER_OUT/out-filtered-gold.txt
	done

	# experiences
	for i in {10..60..10}
	do
		printf '\n** iterations: '$i' **\n'
		FOLDER=../../scripts/filter-harem/harem-to-standoff/outputs/repeat-$r/joined
		FOLDER_OUT=outputs/repeat-$r/experiences/iterations/$i
		MODEL=repeat-$r/experiences/iterations/$i

		time python "src/ner-test-spacy.py" $FOLDER/"cat_test-standoff" $MODEL/cat
		time python "src/ner-test-spacy.py" $FOLDER/"types_test-standoff" $MODEL/types
		time python "src/ner-test-spacy.py" $FOLDER/"subtypes_test-standoff" $MODEL/subtypes
		time python "src/ner-test-spacy.py" $FOLDER/"filtered_test-standoff" $MODEL/filtered

		iconv -f UTF-8 -t ISO-8859-1 $FOLDER_OUT/cat-gold.txt > $FOLDER_OUT/out-cat-gold.txt
		iconv -f UTF-8 -t ISO-8859-1 $FOLDER_OUT/types-gold.txt > $FOLDER_OUT/out-types-gold.txt
		iconv -f UTF-8 -t ISO-8859-1 $FOLDER_OUT/subtypes-gold.txt > $FOLDER_OUT/out-subtypes-gold.txt
		iconv -f UTF-8 -t ISO-8859-1 $FOLDER_OUT/filtered-gold.txt > $FOLDER_OUT/out-filtered-gold.txt
	done
done
