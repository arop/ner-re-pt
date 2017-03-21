#!/bin/bash

printf "\n*** tokenizing ***\n"
for i in {0..9}
do
	printf "\n** fold "$i" **\n"
	FOLDER=outputs/fold-$i
	python "src/tokenize_from_opennlp_format.py" '../open-nlp/'$FOLDER'/cat_train_sent_doc.xml' 'fold-'$i'/t-cat-train-doc.txt'
	python "src/tokenize_from_opennlp_format.py" '../open-nlp/'$FOLDER'/cat_test_sent_doc.xml' 'fold-'$i'/t-cat-test-doc.txt'

	python "src/tokenize_from_opennlp_format.py" '../open-nlp/'$FOLDER'/types_train_sent_doc.xml' 'fold-'$i'/t-types-train-doc.txt'
	python "src/tokenize_from_opennlp_format.py" '../open-nlp/'$FOLDER'/types_test_sent_doc.xml' 'fold-'$i'/t-types-test-doc.txt'

	python "src/tokenize_from_opennlp_format.py" '../open-nlp/'$FOLDER'/subtypes_train_sent_doc.xml' 'fold-'$i'/t-subtypes-train-doc.txt'
	python "src/tokenize_from_opennlp_format.py" '../open-nlp/'$FOLDER'/subtypes_test_sent_doc.xml' 'fold-'$i'/t-subtypes-test-doc.txt'

	python "src/tokenize_from_opennlp_format.py" '../open-nlp/'$FOLDER'/filtered_train_sent_doc.xml' 'fold-'$i'/t-filtered-train-doc.txt'
	python "src/tokenize_from_opennlp_format.py" '../open-nlp/'$FOLDER'/filtered_test_sent_doc.xml' 'fold-'$i'/t-filtered-test-doc.txt'
done