#!/bin/bash

CRF=edu.stanford.nlp.ie.crf.CRFClassifier
TOKENIZER=edu.stanford.nlp.process.WhitespaceTokenizer

for r in {0..3}
do
	# ner: txt=harem, model=sigarra
	for i in {0..9}
	do
		CLASSIFIER=../models/repeat-$r/sigarra/fold-$i/sigarra-ner-model.ser.gz
		TXT=../outputs/repeat-$r/fold-$i/t_cat_test.txt-clean.txt
		OUT=../outputs/repeat-$r/crossed/m_sigarra-t_cat/fold-$i/out.txt
		OUTC=../outputs/repeat-$r/crossed/m_sigarra-t_cat/fold-$i/out-iob.txt

		java -d64 -Xmx6g -cp ./stanford-corenlp.jar $CRF -tokenizerFactory $TOKENIZER -loadClassifier $CLASSIFIER -textFile $TXT -outputFormat tsv -encoding iso-8859-1 |  tr -s '\n' > $OUT
		python ../src/add-IOB.py $OUT $OUTC
	done

	# ner: txt=sigarra, model=harem
	for i in {0..9}
	do
		CLASSIFIER=../models/repeat-$r/fold-$i/cat-ner-model.ser.gz
		TXT=../outputs/repeat-$r/sigarra/fold-$i/t_sigarra_test.txt-clean.txt
		OUT=../outputs/repeat-$r/crossed/m_cat-t_sigarra/fold-$i/out.txt
		OUTC=../outputs/repeat-$r/crossed/m_cat-t_sigarra/fold-$i/out-iob.txt

		java -d64 -Xmx6g -cp ./stanford-corenlp.jar $CRF -tokenizerFactory $TOKENIZER -loadClassifier $CLASSIFIER -textFile $TXT -outputFormat tsv -encoding utf-8 |  tr -s '\n' > $OUT
		python ../src/add-IOB.py $OUT $OUTC
	done
done