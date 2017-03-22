#!/bin/bash

for r in {1..3}
do
	printf "\n** repeat "$r" **\n"
	for i in {0..9}
	do
		FOLDER=repeat-$r/fold-$i
		printf "\n** fold "$i" **\n"
		printf "\n** training categories **\n"
		bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data ../outputs/$FOLDER/cat_train_sent_doc.xml -model models/$FOLDER/pt-ner-cat.bin
		printf "\n** training types **\n"
		bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data ../outputs/$FOLDER/types_train_sent_doc.xml -model models/$FOLDER/pt-ner-types.bin
		printf "\n** training subtypes **\n"
		bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data ../outputs/$FOLDER/subtypes_train_sent_doc.xml -model models/$FOLDER/pt-ner-subtypes.bin
		printf "\n** training filtered **\n"
		bin/opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data ../outputs/$FOLDER/filtered_train_sent_doc.xml -model models/$FOLDER/pt-ner-filtered.bin
	done
done

