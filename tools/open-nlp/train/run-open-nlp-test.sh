#!/bin/bash

#bin/opennlp TokenNameFinderEvaluator -encoding ISO-8859-1 -data ../outputs/cat_test_sent_doc.xml -model models/pt-ner-cat.bin
#bin/opennlp TokenNameFinderEvaluator -encoding ISO-8859-1 -data ../outputs/types_test_sent_doc.xml -model models/pt-ner-types.bin
#bin/opennlp TokenNameFinderEvaluator -encoding ISO-8859-1 -data ../outputs/subtypes_test_sent_doc.xml -model models/pt-ner-subtypes.bin
bin/opennlp TokenNameFinderEvaluator -encoding ISO-8859-1 -data ../outputs/filtered_test_sent_doc.xml -model models/pt-ner-filtered.bin
