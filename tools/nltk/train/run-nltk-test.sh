#!/bin/bash

# 25min for repeats 1..3
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"
		OUT=../outputs/repeat-$r/fold-$i
		RESULTS=../outputs/repeat-$r/ner-results/fold-$i
		MODELS=models/repeat-$r/fold-$i

		iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-cat-docs-test.txt > $OUT/pos-cat-docs-test-utf8.txt
		python test_chunker.py $MODELS/cat_NaiveBayes.pickle $OUT/pos-cat-docs-test-utf8.txt $RESULTS/out-cat-NB.txt
		python test_chunker.py $MODELS/cat_Maxent.pickle $OUT/pos-cat-docs-test-utf8.txt $RESULTS/out-cat-ME.txt
		python test_chunker.py $MODELS/cat_DecisionTree.pickle $OUT/pos-cat-docs-test-utf8.txt $RESULTS/out-cat-DT.txt

		iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-types-docs-test.txt > $OUT/pos-types-docs-test-utf8.txt
		python test_chunker.py $MODELS/types_NaiveBayes.pickle $OUT/pos-types-docs-test-utf8.txt $RESULTS/out-types-NB.txt
		python test_chunker.py $MODELS/types_Maxent.pickle $OUT/pos-types-docs-test-utf8.txt $RESULTS/out-types-ME.txt
		python test_chunker.py $MODELS/types_DecisionTree.pickle $OUT/pos-types-docs-test-utf8.txt $RESULTS/out-types-DT.txt

		iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-subtypes-docs-test.txt > $OUT/pos-subtypes-docs-test-utf8.txt
		python test_chunker.py $MODELS/subtypes_NaiveBayes.pickle $OUT/pos-subtypes-docs-test-utf8.txt $RESULTS/out-subtypes-NB.txt
		python test_chunker.py $MODELS/subtypes_Maxent.pickle $OUT/pos-subtypes-docs-test-utf8.txt $RESULTS/out-subtypes-ME.txt
		python test_chunker.py $MODELS/subtypes_DecisionTree.pickle $OUT/pos-subtypes-docs-test-utf8.txt $RESULTS/out-subtypes-DT.txt

		iconv -f ISO-8859-1 -t UTF-8 $OUT/pos-filtered-docs-test.txt > $OUT/pos-filtered-docs-test-utf8.txt
		python test_chunker.py $MODELS/filtered_NaiveBayes.pickle $OUT/pos-filtered-docs-test-utf8.txt $RESULTS/out-filtered-NB.txt
		python test_chunker.py $MODELS/filtered_Maxent.pickle $OUT/pos-filtered-docs-test-utf8.txt $RESULTS/out-filtered-ME.txt
		python test_chunker.py $MODELS/filtered_DecisionTree.pickle $OUT/pos-filtered-docs-test-utf8.txt $RESULTS/out-filtered-DT.txt
	done
done