#!/bin/bash

printf "\n** training sigarra **\n"
for r in {0..3}
do
	printf "\n** repeat "$r" **\n"
	FOLDER=../outputs/repeat-$r/sigarra
	MODEL=models/repeat-$r/sigarra
	PARAMS=params/sigarra/params.txt

	# time bin/opennlp TokenNameFinderTrainer -encoding UTF-8 -lang pt -data $FOLDER/sigarra_train_sent_doc.xml -params $PARAMS -model $MODEL/pt-ner-sigarra.bin
	time bin/opennlp TokenNameFinderTrainer -encoding UTF-8 -lang pt -data $FOLDER/sigarra_train_sent_doc.xml -model $MODEL/pt-ner-sigarra-default.bin
done

