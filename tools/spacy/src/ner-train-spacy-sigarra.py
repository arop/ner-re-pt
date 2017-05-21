#!/usr/bin/env python

from __future__ import unicode_literals, print_function
import json
import pathlib

import spacy
from spacy.pipeline import BeamEntityRecognizer
from spacy.gold import GoldParse
from spacy.tagger import Tagger
import random

import sys
 
try:
	unicode
except:
	unicode = str

def train_ner(nlp, train_data, entity_types, n_iter):
	# Train NER.
	ner = BeamEntityRecognizer(nlp.vocab, entity_types=entity_types)

	for itn in range(n_iter):
		random.shuffle(train_data)
		print('Iteration: ' + str(itn))
		for raw_text, entity_offsets in train_data:
			doc = nlp.make_doc(raw_text)
			gold = GoldParse(doc, entities=entity_offsets)
			ner.update(doc, gold)

	ner.model.end_training()
	return ner

def save_model(ner, model_dir):
	model_dir = pathlib.Path(model_dir)
	if not model_dir.exists():
		model_dir.mkdir()
	assert model_dir.is_dir()

	with (model_dir / 'config.json').open('wb') as file_:
		data = json.dumps(ner.cfg)
		if isinstance(data, unicode):
			data = data.encode('utf8')
		file_.write(data)
	ner.model.dump(str(model_dir / 'model'))
	if not (model_dir / 'vocab').exists():
		(model_dir / 'vocab').mkdir()
	ner.vocab.dump(str(model_dir / 'vocab' / 'lexemes.bin'))
	with (model_dir / 'vocab' / 'strings.json').open('w', encoding='utf8') as file_:
		ner.vocab.strings.dump(file_)

def get_training_data(input_file):
	ann = open(input_file + '.ann', 'r').read().decode('UTF-8').splitlines()
	txt = open(input_file + '.txt', 'r').read().decode('UTF-8').splitlines()

	train_data = []
	train_data_sentence = []
	line_count = 0

	for line in ann:
		if line == '--NO ENTITIES--': #no entities in sentence
			continue
		if line == '': #end of sentence
			try:
				train_data.append((txt[line_count], train_data_sentence))
				train_data_sentence = []
				line_count += 1
				continue
			except Exception as e:
				print(train_data_sentence, line_count)
				raise e

		#get ann information
		tabs = line.split()
		train_data_sentence.append((int(tabs[0]), int(tabs[1]), tabs[2]))

	return train_data


def create_vocab(nlp, data):
	# Add new words to vocab.
	for raw_text, _ in data:
		doc = nlp.make_doc(raw_text)
		for word in doc:
			_ = nlp.vocab[word.orth]
	return nlp

def main(model_dir=None):
	nlp = spacy.get_lang_class('pt')(path=None)

	# v1.1.2 onwards
	if nlp.tagger is None:
		print('Setting tagger')
		nlp.tagger = Tagger(nlp.vocab, features=Tagger.feature_templates)

	if(len(sys.argv) > 4):
	  	filetrain = sys.argv[1]
	  	model_dir = sys.argv[2]
		level = sys.argv[3]
		n_iter = sys.argv[4]
	else:
	  	print ("Usage: python " + sys.argv[0] + " <input filename train> <model_dir> <level> <n_iterations>\n")
	  	sys.exit()

	train_data = get_training_data(filetrain)

	nlp = create_vocab(nlp, train_data)

	categories = ['Pessoa','Organizacao','Localizacao','Curso','Data','Hora','Evento','UnidadeOrganica']

	ner = train_ner(nlp, train_data, categories, int(n_iter))

	if model_dir is not None:
		save_model(ner, model_dir + '/' + level)

if __name__ == '__main__':
	main('ner')
