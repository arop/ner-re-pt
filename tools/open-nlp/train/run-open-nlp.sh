#!/bin/bash

bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data ../outputs/cat_train_sent_doc.xml -model models/pt-ner-cat.bin
bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data ../outputs/types_train_sent_doc.xml -model models/pt-ner-typescat.bin
bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data ../outputs/subtypes_train_sent_doc.xml -model models/pt-ner-subtypes.bin

