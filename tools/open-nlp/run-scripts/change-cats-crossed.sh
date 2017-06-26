#!/bin/bash

CRF=edu.stanford.nlp.ie.crf.CRFClassifier
TOKENIZER=edu.stanford.nlp.process.WhitespaceTokenizer

for r in {0..3}
do
	# ner: txt=sigarra, model=harem
	for i in {0..9}
	do
		IN_F=../outputs/repeat-$r/crossed/m_cat-t_sigarra/fold-$i/out-iob.txt
		OUT_F=../outputs/repeat-$r/crossed/m_cat-t_sigarra/fold-$i/out-iob-done.txt
		python ../src/crossed-change.py $IN_F $OUT_F harem

		# IN_G=../outputs/repeat-$r/crossed/m_cat-t_sigarra/fold-$i/out-sigarra-gold.txt
		IN_G=../outputs/repeat-$r/ner-results/sigarra/fold-$i/out-sigarra-gold.txt
		OUT_G=../outputs/repeat-$r/crossed/m_cat-t_sigarra/fold-$i/out-iob-gold-done.txt
		python ../src/crossed-change.py $IN_G $OUT_G sigarra-gold
	done

	# ner: txt=harem, model=sigarra
	for i in {0..9}
	do
		IN_F=../outputs/repeat-$r/crossed/m_sigarra-t_cat/fold-$i/out-iob.txt
		OUT_F=../outputs/repeat-$r/crossed/m_sigarra-t_cat/fold-$i/out-iob-done.txt
		python ../src/crossed-change.py $IN_F $OUT_F sigarra

		# IN_G=../outputs/repeat-$r/crossed/m_sigarra-t_cat/fold-$i/out-cat-gold.txt
		IN_G=../outputs/repeat-$r/ner-results/fold-$i/out-cat-gold.txt
		OUT_G=../outputs/repeat-$r/crossed/m_sigarra-t_cat/fold-$i/out-iob-gold-done.txt
		python ../src/crossed-change.py $IN_G $OUT_G harem-gold
	done
done