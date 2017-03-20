#!/bin/bash

for i in {0..9}
do
	printf "\n** fold "$i" **\n"
	printf "\n** training categories **\n"
	bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data ../outputs/fold-$i/cat_train_sent_doc.xml -model models/fold-$i/pt-ner-cat.bin
	printf "\n** training types **\n"
	bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data ../outputs/fold-$i/types_train_sent_doc.xml -model models/fold-$i/pt-ner-types.bin
	printf "\n** training subtypes **\n"
	bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data ../outputs/fold-$i/subtypes_train_sent_doc.xml -model models/fold-$i/pt-ner-subtypes.bin
	printf "\n** training filtered **\n"
	bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data ../outputs/fold-$i/filtered_train_sent_doc.xml -model models/fold-$i/pt-ner-filtered.bin
done

