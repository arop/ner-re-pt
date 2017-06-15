#!/bin/bash

TEST=../test_chunker.py

for r in {0..3}
do
	printf "\n** repeat "$r" **\n"

	for i in {0..9}
	do
		printf "\n** fold "$i" **\n"
		OUT=../../outputs/repeat-$r/sigarra/fold-$i
		RESULTS=../../outputs/repeat-$r/ner-results/sigarra/fold-$i
		MODELS=../models/repeat-$r/sigarra/fold-$i

		python $TEST $MODELS/sigarra_NaiveBayes.pickle $OUT/pos-sigarra-docs-test.txt $RESULTS/out-sigarra-NB.txt

		python $TEST $MODELS/sigarra_Maxent.pickle $OUT/pos-sigarra-docs-test.txt $RESULTS/out-sigarra-ME.txt
		# python $TEST $MODELS/sigarra_Maxent-default.pickle $OUT/pos-sigarra-docs-test.txt $RESULTS/out-sigarra-ME-default.txt

		python $TEST $MODELS/sigarra_DecisionTree.pickle $OUT/pos-sigarra-docs-test.txt $RESULTS/out-sigarra-DT.txt
		# python $TEST $MODELS/sigarra_DecisionTree-default.pickle $OUT/pos-sigarra-docs-test.txt $RESULTS/out-sigarra-DT-default.txt
	done

	# OUT=../../outputs/repeat-$r/sigarra
	# RESULTS=../../outputs/repeat-$r/ner-results/sigarra
	# MODELS=../models/repeat-$r/sigarra

	# python $TEST $MODELS/sigarra_NaiveBayes.pickle $OUT/pos-sigarra-docs-test.txt $RESULTS/out-sigarra-NB.txt

	# python $TEST $MODELS/sigarra_Maxent.pickle $OUT/pos-sigarra-docs-test.txt $RESULTS/out-sigarra-ME.txt
	# python $TEST $MODELS/sigarra_Maxent-default.pickle $OUT/pos-sigarra-docs-test.txt $RESULTS/out-sigarra-ME-default.txt

	# python $TEST $MODELS/sigarra_DecisionTree.pickle $OUT/pos-sigarra-docs-test.txt $RESULTS/out-sigarra-DT.txt
	# python $TEST $MODELS/sigarra_DecisionTree-default.pickle $OUT/pos-sigarra-docs-test.txt $RESULTS/out-sigarra-DT-default.txt
done