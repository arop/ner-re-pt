#!/bin/bash

for i in {0..9}
do
	printf "\n** fold "$i" **\n"
	OUT=../outputs/fold-$i
	RESULTS=../outputs/ner-results/fold-$i
	iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-cat-docs-test.txt > $OUT/pos-cat-docs-test-utf8.txt
	python test_chunker.py models/fold-$i/cat_NaiveBayes.pickle $OUT/pos-cat-docs-test-utf8.txt $RESULTS/out-cat-NB.txt
	python test_chunker.py models/fold-$i/cat_Maxent.pickle $OUT/pos-cat-docs-test-utf8.txt $RESULTS/out-cat-ME.txt
	python test_chunker.py models/fold-$i/cat_DecisionTree.pickle $OUT/pos-cat-docs-test-utf8.txt $RESULTS/out-cat-DT.txt

	iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-types-docs-test.txt > $OUT/pos-types-docs-test-utf8.txt
	python test_chunker.py models/fold-$i/types_NaiveBayes.pickle $OUT/pos-types-docs-test-utf8.txt $RESULTS/out-types-NB.txt
	python test_chunker.py models/fold-$i/types_Maxent.pickle $OUT/pos-types-docs-test-utf8.txt $RESULTS/out-types-ME.txt
	python test_chunker.py models/fold-$i/types_DecisionTree.pickle $OUT/pos-types-docs-test-utf8.txt $RESULTS/out-types-DT.txt

	iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-subtypes-docs-test.txt > $OUT/pos-subtypes-docs-test-utf8.txt
	python test_chunker.py models/fold-$i/subtypes_NaiveBayes.pickle $OUT/pos-subtypes-docs-test-utf8.txt $RESULTS/out-subtypes-NB.txt
	python test_chunker.py models/fold-$i/subtypes_Maxent.pickle $OUT/pos-subtypes-docs-test-utf8.txt $RESULTS/out-subtypes-ME.txt
	python test_chunker.py models/fold-$i/subtypes_DecisionTree.pickle $OUT/pos-subtypes-docs-test-utf8.txt $RESULTS/out-subtypes-DT.txt

	# iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-filtered-docs-test.txt > $OUT/pos-filtered-docs-test-utf8.txt
	# python test_chunker.py models/fold-$i/filtered_NaiveBayes.pickle $OUT/pos-filtered-docs-test-utf8.txt $RESULTS/out-filtered-NB.txt
	# python test_chunker.py models/fold-$i/filtered_Maxent.pickle $OUT/pos-filtered-docs-test-utf8.txt $RESULTS/out-filtered-ME.txt
	# python test_chunker.py models/fold-$i/filtered_DecisionTree.pickle $OUT/pos-filtered-docs-test-utf8.txt $RESULTS/out-filtered-DT.txt
done