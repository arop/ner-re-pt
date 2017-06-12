#!/bin/bash

SCRIPT="../src/join-faulty-sentences.py"
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	for i in {0..9}
	do
	# 	FOLDER=../outputs/repeat-$r/fold-$i
	# 	printf "\n** fold "$i" **\n"
	# 	python $SCRIPT $FOLDER"/cat_train_sent_doc.xml" $FOLDER"/cat_train_sent_doc.xml"
	# 	python $SCRIPT $FOLDER"/cat_test_sent_doc.xml" $FOLDER"/cat_test_sent_doc.xml"

	# 	python $SCRIPT $FOLDER"/types_train_sent_doc.xml" $FOLDER"/types_train_sent_doc.xml"
	# 	python $SCRIPT $FOLDER"/types_test_sent_doc.xml" $FOLDER"/types_test_sent_doc.xml"

	# 	python $SCRIPT $FOLDER"/subtypes_train_sent_doc.xml" $FOLDER"/subtypes_train_sent_doc.xml"
	# 	python $SCRIPT $FOLDER"/subtypes_test_sent_doc.xml" $FOLDER"/subtypes_test_sent_doc.xml"

	# 	python $SCRIPT $FOLDER"/filtered_train_sent_doc.xml" $FOLDER"/filtered_train_sent_doc.xml"
	# 	python $SCRIPT $FOLDER"/filtered_test_sent_doc.xml" $FOLDER"/filtered_test_sent_doc.xml"
		
		FOLDER=../outputs/repeat-$r/sigarra/fold-$i
		python $SCRIPT $FOLDER"/sigarra_train_sent_doc.xml" $FOLDER"/sigarra_train_sent_doc.xml"
		python $SCRIPT $FOLDER"/sigarra_test_sent_doc.xml" $FOLDER"/sigarra_test_sent_doc.xml"
	done

	# FOLDER=../outputs/repeat-$r/joined
	# python $SCRIPT $FOLDER"/cat_train_sent_doc.xml" $FOLDER"/cat_train_sent_doc.xml"
	# python $SCRIPT $FOLDER"/cat_test_sent_doc.xml" $FOLDER"/cat_test_sent_doc.xml"

	# python $SCRIPT $FOLDER"/types_train_sent_doc.xml" $FOLDER"/types_train_sent_doc.xml"
	# python $SCRIPT $FOLDER"/types_test_sent_doc.xml" $FOLDER"/types_test_sent_doc.xml"

	# python $SCRIPT $FOLDER"/subtypes_train_sent_doc.xml" $FOLDER"/subtypes_train_sent_doc.xml"
	# python $SCRIPT $FOLDER"/subtypes_test_sent_doc.xml" $FOLDER"/subtypes_test_sent_doc.xml"

	# python $SCRIPT $FOLDER"/filtered_train_sent_doc.xml" $FOLDER"/filtered_train_sent_doc.xml"
	# python $SCRIPT $FOLDER"/filtered_test_sent_doc.xml" $FOLDER"/filtered_test_sent_doc.xml"

	# FOLDER=../outputs/repeat-$r/sigarra
	# python $SCRIPT $FOLDER"/sigarra_train_sent_doc.xml" $FOLDER"/sigarra_train_sent_doc.xml"
	# python $SCRIPT $FOLDER"/sigarra_test_sent_doc.xml" $FOLDER"/sigarra_test_sent_doc.xml"
done