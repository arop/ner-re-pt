#!/bin/bash

OPENNLP=../../../tools/open-nlp
for r in {0..3}
do
	# FOLDER=outputs/repeat-$r
	# python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/sigarra/sigarra_train_sent_doc.xml" $FOLDER"/sigarra_train"
	# python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/sigarra/sigarra_test_sent_doc.xml" $FOLDER"/sigarra_test"

	for i in {0..9}
	do
		FOLDER=outputs/repeat-$r/sigarra/fold-$i
		FOLDER_OUT=outputs/repeat-$r/fold-$i
		python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/sigarra_train_sent_doc.xml" $FOLDER_OUT"/sigarra_train"
		python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/sigarra_test_sent_doc.xml" $FOLDER_OUT"/sigarra_test"
	done
done