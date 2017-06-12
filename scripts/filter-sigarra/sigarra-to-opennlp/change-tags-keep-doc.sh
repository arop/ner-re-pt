#!/bin/bash

SCRIPT="src/change_tags_keep_doc.py"
for r in {0..3}
do
	# python $SCRIPT "../outputs/repeat-"$r"/sigarra_train.xml" repeat-$r"/sigarra_train_doc.xml"
	# python $SCRIPT "../outputs/repeat-"$r"/sigarra_test.xml" repeat-$r"/sigarra_test_doc.xml"

	for i in {0..9}
	do
		python $SCRIPT "../outputs/repeat-"$r"/fold-"$i"/sigarra_train.xml" repeat-$r"/fold-"$i"/sigarra_train_doc.xml"
		python $SCRIPT "../outputs/repeat-"$r"/fold-"$i"/sigarra_test.xml" repeat-$r"/fold-"$i"/sigarra_test_doc.xml"		
	done
done