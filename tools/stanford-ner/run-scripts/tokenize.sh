#!/bin/bash

java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/cat_train.xml" > "../outputs/t_cat_train.txt"
java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/cat_test.xml" > "../outputs/t_cat_test.txt"

java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/types_train.xml" > "../outputs/t_types_train.txt"
java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/types_test.xml" > "../outputs/t_types_test.txt"

java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/subtypes_train.xml" > "../outputs/t_subtypes_train.txt"
java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/subtypes_test.xml" > "../outputs/t_subtypes_test.txt"

java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/filtered_train.xml" > "../outputs/t_filtered_train.txt"
java -d64 -cp stanford-corenlp.jar edu.stanford.nlp.process.PTBTokenizer -encoding ISO-8859-1 < "../../../scripts/filter-harem/outputs/filtered_test.xml" > "../outputs/t_filtered_test.txt"


