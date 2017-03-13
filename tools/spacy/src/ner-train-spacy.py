#!/usr/bin/env python
# -*- coding: ISO-8859-1 -*

from __future__ import unicode_literals, print_function
import json
import pathlib

import spacy
from spacy.pipeline import EntityRecognizer
from spacy.gold import GoldParse
from spacy.tagger import Tagger

import sys
 
try:
    unicode
except:
    unicode = str

def train_ner(nlp, train_data, entity_types):
    # Add new words to vocab.
    for raw_text, _ in train_data:
        doc = nlp.make_doc(raw_text)
        for word in doc:
            _ = nlp.vocab[word.orth]

    # Train NER.
    ner = EntityRecognizer(nlp.vocab, entity_types=entity_types)
    #for itn in range(5):
        #random.shuffle(train_data)
    for raw_text, entity_offsets in train_data:
        doc = nlp.make_doc(raw_text)
        gold = GoldParse(doc, entities=entity_offsets)
        ner.update(doc, gold)
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
	ann = open(input_file + '.ann', 'r').read().decode('ISO-8859-1').splitlines()
	txt = open(input_file + '.txt', 'r').read().decode('ISO-8859-1').splitlines()

	train_data = []
	train_data_sentence = []
	line_count = 0

	for line in ann:
		if line == '--NO ENTITIES--': #no entities in sentence
			continue
		if line == '': #end of sentence
			train_data.append((txt[line_count], train_data_sentence))
			train_data_sentence = []
			line_count += 1
			continue

		#get ann information
		tabs = line.split()
		train_data_sentence.append((int(tabs[0]), int(tabs[1]), tabs[2]))

	return train_data


def main(model_dir=None):
    nlp = spacy.load('pt', parser=False, entity=False, add_vectors=False)

    # v1.1.2 onwards
    if nlp.tagger is None:
        # print('---- WARNING ----')
        # print('Data directory not found')
        # print('please run: `python -m spacy.pt.download --force all` for better performance')
        # print('Using feature templates for tagging')
        print('-----------------')
        nlp.tagger = Tagger(nlp.vocab, features=Tagger.feature_templates)

    # train_data = [
    #     (
    #         'Who is Shaka Khan?',
    #         [(len('Who is '), len('Who is Shaka Khan'), 'PERSON')]
    #     ),
    #     (
    #         'I like London and Berlin.',
    #         [(len('I like '), len('I like London'), 'LOC'),
    #         (len('I like London and '), len('I like London and Berlin'), 'LOC')]
    #     )
    # ]

    if(len(sys.argv) > 1):
      	filein = sys.argv[1]
    else:
      	print ("Usage: python " + sys.argv[0] + " <input filename>\n")
      	sys.exit()

    train_data = get_training_data(filein)
    categories = open('categories','r').read().splitlines()

    ner = train_ner(nlp, train_data, categories)

    #doc = nlp.make_doc(u'O Jorge Pimenta comprou o Facebook. Fez sopa ja ontem, 2 dias já depois comeu-a.')

    text = open( '../../scripts/filter-harem/harem-to-standoff/outputs/cat_test-standoff.txt', 'r').read().decode('ISO-8859-1')
    t = ''
    for line in text.splitlines():
    	for l in line.split():
    		t += l + " "

	#print (t)
    doc = nlp.make_doc(t)

    nlp.tagger(doc)
    ner(doc)

    for word in doc:
        print(word.text, word.tag_, word.ent_type_, word.ent_iob)

    if model_dir is not None:
        save_model(ner, model_dir)


if __name__ == '__main__':
    main('ner')
