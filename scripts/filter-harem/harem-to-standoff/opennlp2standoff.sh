#!/bin/bash

OPENNLP=../../../tools/open-nlp
for i in {0..9}
do
	python "src/opennlp2standoff.py" $OPENNLP"/outputs/fold-"$i"/cat_train_sent_doc.xml" "outputs/fold-"$i"/cat_train"
	python "src/opennlp2standoff.py" $OPENNLP"/outputs/fold-"$i"/cat_test_sent_doc.xml" "outputs/fold-"$i"/cat_test"

	python "src/opennlp2standoff.py" $OPENNLP"/outputs/fold-"$i"/types_train_sent_doc.xml" "outputs/fold-"$i"/types_train"
	python "src/opennlp2standoff.py" $OPENNLP"/outputs/fold-"$i"/types_test_sent_doc.xml" "outputs/fold-"$i"/types_test"

	python "src/opennlp2standoff.py" $OPENNLP"/outputs/fold-"$i"/subtypes_train_sent_doc.xml" "outputs/fold-"$i"/subtypes_train"
	python "src/opennlp2standoff.py" $OPENNLP"/outputs/fold-"$i"/subtypes_test_sent_doc.xml" "outputs/fold-"$i"/subtypes_test"

	python "src/opennlp2standoff.py" $OPENNLP"/outputs/fold-"$i"/filtered_train_sent_doc.xml" "outputs/fold-"$i"/filtered_train"
	python "src/opennlp2standoff.py" $OPENNLP"/outputs/fold-"$i"/filtered_test_sent_doc.xml" "outputs/fold-"$i"/filtered_test"
done