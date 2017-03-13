#!/bin/bash

opennlp TokenNameFinderTrainer -encoding ISO-8859-1 -lang pt -data outputs/cat_train_sent.xml -model outputs/pt-ner-cat.bin