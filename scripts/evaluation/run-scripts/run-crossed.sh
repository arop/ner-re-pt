#!/bin/bash

for r in {0..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/stanford-ner
		IN_NER=$TOOL/outputs/repeat-$r/crossed/m_cat-t_sigarra/fold-$i
		IN_GOLD=$TOOL/outputs/repeat-$r/crossed/m_cat-t_sigarra/fold-$i
		OUT_RES=../results/stanford-ner/repeat-$r/crossed/fold-$i

		../join-output-golden.sh $IN_NER/out-iob-done.txt $IN_GOLD/out-iob-gold-done.txt | ../conlleval > $OUT_RES/m_cat-t_sigarra.txt

		IN_NER=$TOOL/outputs/repeat-$r/crossed/m_sigarra-t_cat/fold-$i
		IN_GOLD=$TOOL/outputs/repeat-$r/crossed/m_sigarra-t_cat/fold-$i
		OUT_RES=../results/stanford-ner/repeat-$r/crossed/fold-$i

		../join-output-golden.sh $IN_NER/out-iob-done.txt $IN_GOLD/out-iob-gold-done.txt | ../conlleval > $OUT_RES/m_sigarra-t_cat.txt
	done

	python ../src/avg-results-crossed.py stanford-ner m_cat-t_sigarra $r
	python ../src/avg-results-crossed.py stanford-ner m_sigarra-t_cat $r
done

python ../src/avg-results-all-crossed.py stanford-ner m_cat-t_sigarra
python ../src/avg-results-all-crossed.py stanford-ner m_sigarra-t_cat
