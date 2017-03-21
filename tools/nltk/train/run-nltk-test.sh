#!/bin/bash

for i in {0..9}
do
	printf "\n** fold "$i" **\n"
	# iconv -f ISO-8859-1 -t UTF-8 ../outputs/fold-0/pos-cat-docs-test.txt > ../outputs/fold-0/pos-cat-docs-test-utf8.txt
	# python test_chunker.py models/fold-0/cat_NaiveBayes.pickle ../outputs/fold-0/pos-cat-docs-test-utf8.txt results/fold-$i/out-cat-NB.txt
	# python test_chunker.py models/fold-0/cat_Maxent.pickle ../outputs/fold-0/pos-cat-docs-test-utf8.txt results/fold-$i/out-cat-ME.txt
	# python test_chunker.py models/fold-0/cat_DecisionTree.pickle ../outputs/fold-0/pos-cat-docs-test-utf8.txt results/fold-$i/out-cat-DT.txt

	# iconv -f ISO-8859-1 -t UTF-8 ../outputs/fold-0/pos-types-docs-test.txt > ../outputs/fold-0/pos-types-docs-test-utf8.txt
	# python test_chunker.py models/fold-0/types_NaiveBayes.pickle ../outputs/fold-0/pos-types-docs-test-utf8.txt results/fold-$i/out-types-NB.txt
	# python test_chunker.py models/fold-0/types_Maxent.pickle ../outputs/fold-0/pos-types-docs-test-utf8.txt results/fold-$i/out-types-ME.txt
	# python test_chunker.py models/fold-0/types_DecisionTree.pickle ../outputs/fold-0/pos-types-docs-test-utf8.txt results/fold-$i/out-types-DT.txt

	# iconv -f ISO-8859-1 -t UTF-8 ../outputs/fold-0/pos-subtypes-docs-test.txt > ../outputs/fold-0/pos-subtypes-docs-test-utf8.txt
	# python test_chunker.py models/fold-0/subtypes_NaiveBayes.pickle ../outputs/fold-0/pos-subtypes-docs-test-utf8.txt results/fold-$i/out-subtypes-NB.txt
	# python test_chunker.py models/fold-0/subtypes_Maxent.pickle ../outputs/fold-0/pos-subtypes-docs-test-utf8.txt results/fold-$i/out-subtypes-ME.txt
	# python test_chunker.py models/fold-0/subtypes_DecisionTree.pickle ../outputs/fold-0/pos-subtypes-docs-test-utf8.txt results/fold-$i/out-subtypes-DT.txt

	iconv -f ISO-8859-1 -t UTF-8 ../outputs/fold-0/pos-filtered-docs-test.txt > ../outputs/fold-0/pos-filtered-docs-test-utf8.txt
	python test_chunker.py models/fold-0/filtered_NaiveBayes.pickle ../outputs/fold-0/pos-filtered-docs-test-utf8.txt results/fold-$i/out-filtered-NB.txt
	python test_chunker.py models/fold-0/filtered_Maxent.pickle ../outputs/fold-0/pos-filtered-docs-test-utf8.txt results/fold-$i/out-filtered-ME.txt
	python test_chunker.py models/fold-0/filtered_DecisionTree.pickle ../outputs/fold-0/pos-filtered-docs-test-utf8.txt results/fold-$i/out-filtered-DT.txt
done