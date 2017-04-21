#!/bin/bash

for r in {0..3}
do
	for i in {0..9}
	do
		rm -rf repeat-$r/fold-$i/*
		rm -rf repeat-$r/ner-results/fold-$i/*
	done
done