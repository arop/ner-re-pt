#!/bin/bash

OPENNLP=../../../tools/open-nlp
for r in {0..3}
do
	for i in {0..9}
	do
		FOLDER=outputs/repeat-$r/fold-$i
		python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/cat_train_sent_doc.xml" $FOLDER"/cat_train"
		python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/cat_test_sent_doc.xml" $FOLDER"/cat_test"

		python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/types_train_sent_doc.xml" $FOLDER"/types_train"
		python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/types_test_sent_doc.xml" $FOLDER"/types_test"

		python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/subtypes_train_sent_doc.xml" $FOLDER"/subtypes_train"
		python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/subtypes_test_sent_doc.xml" $FOLDER"/subtypes_test"

		python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/filtered_train_sent_doc.xml" $FOLDER"/filtered_train"
		python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/filtered_test_sent_doc.xml" $FOLDER"/filtered_test"
	done

	FOLDER=outputs/repeat-$r/joined
	python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/cat_train_sent_doc.xml" $FOLDER"/cat_train"
	python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/cat_test_sent_doc.xml" $FOLDER"/cat_test"

	python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/types_train_sent_doc.xml" $FOLDER"/types_train"
	python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/types_test_sent_doc.xml" $FOLDER"/types_test"

	python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/subtypes_train_sent_doc.xml" $FOLDER"/subtypes_train"
	python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/subtypes_test_sent_doc.xml" $FOLDER"/subtypes_test"

	python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/filtered_train_sent_doc.xml" $FOLDER"/filtered_train"
	python "src/opennlp2standoff.py" $OPENNLP"/"$FOLDER"/filtered_test_sent_doc.xml" $FOLDER"/filtered_test"

done