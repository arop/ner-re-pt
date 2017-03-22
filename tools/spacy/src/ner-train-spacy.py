#!/usr/bin/env python
# -*- coding: ISO-8859-1 -*

from __future__ import unicode_literals, print_function
import json
import pathlib

import spacy
from spacy.pipeline import EntityRecognizer
from spacy.gold import GoldParse
from spacy.tagger import Tagger
import random

import sys
 
try:
    unicode
except:
    unicode = str

def train_ner(nlp, train_data, entity_types):
    # Train NER.
    ner = EntityRecognizer(nlp.vocab, entity_types=entity_types)
    for itn in range(100):
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
	ann = open(input_file + '.ann', 'r').read().decode('ISO-8859-1').splitlines()
	txt = open(input_file + '.txt', 'r').read().decode('ISO-8859-1').splitlines()

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


def create_vocab(nlp, all_data):
    # Add new words to vocab.
    for raw_text, _ in all_data:
        doc = nlp.make_doc(raw_text)
        for word in doc:
            _ = nlp.vocab[word.orth]
    return nlp

def main(model_dir=None):
    nlp = spacy.load('en_default', parser=False, entity=False, add_vectors=False)

    # v1.1.2 onwards
    if nlp.tagger is None:
        print('Setting tagger')
        nlp.tagger = Tagger(nlp.vocab, features=Tagger.feature_templates)

    if(len(sys.argv) > 1):
      	filetrain = sys.argv[1]
      	#model_dir = sys.argv[2]
      	level = sys.argv[3]
    else:
      	print ("Usage: python " + sys.argv[0] + " <input filename train> <model_dir> <level>\n")
      	sys.exit()

    train_data = get_training_data(filetrain)

    nlp = create_vocab(nlp, train_data)

    cat = ['ABSTRACCAO','OUTRO','LOCAL','ACONTECIMENTO','TEMPO','PESSOA','OBRA','ORGANIZACAO','VALOR','COISA']
    types = ['ABSTRACCAO_IDEIA','LOCAL_HUMANO','ACONTECIMENTO_EVENTO','ACONTECIMENTO_EFEMERIDE','TEMPO_TEMPO_CALEND','PESSOA_POVO','PESSOA_INDIVIDUAL','OBRA_REPRODUZIDA','ABSTRACCAO_DISCIPLINA','PESSOA_GRUPOMEMBRO','ORGANIZACAO_INSTITUICAO','PESSOA_CARGO','OBRA_PLANO','ORGANIZACAO_ADMINISTRACAO','TEMPO_GENERICO','ABSTRACCAO_NOME','TEMPO_FREQUENCIA','LOCAL_FISICO','VALOR_QUANTIDADE','COISA_SUBSTANCIA','LOCAL_VIRTUAL','COISA_OBJECTO','PESSOA_GRUPOIND','ORGANIZACAO_EMPRESA','PESSOA_MEMBRO','COISA_CLASSE','ACONTECIMENTO_ORGANIZADO','TEMPO_DURACAO','VALOR_MOEDA','VALOR_CLASSIFICACAO','OBRA_ARTE','PESSOA_GRUPOCARGO','COISA_MEMBROCLASSE','ABSTRACCAO_ESTADO','ABSTRACCAO_','ORGANIZACAO_','OUTRO_','ACONTECIMENTO_','LOCAL_OUTRO','COISA_OUTRO']
    subtypes = ['LOCAL_HUMANO_DIVISAO','TEMPO_TEMPO_CALEND_DATA','LOCAL_HUMANO_PAIS','OBRA_REPRODUZIDA_LIVRO','PESSOA_POVO_','LOCAL_HUMANO_REGIAO','TEMPO_TEMPO_CALEND_INTERVALO','LOCAL_FISICO_AGUACURSO','LOCAL_FISICO_AGUAMASSA','TEMPO_TEMPO_CALEND_HORA','LOCAL_FISICO_PLANETA','LOCAL_HUMANO_RUA','LOCAL_HUMANO_CONSTRUCAO','LOCAL_FISICO_OUTRO','LOCAL_VIRTUAL_SITIO','OBRA_REPRODUZIDA_PROGRAMA','ORGANIZACAO_INSTITUICAO_','LOCAL_HUMANO_OUTRO','OBRA_REPRODUZIDA_MUSICA','OBRA_REPRODUZIDA_OUTRO','ORGANIZACAO_INSTITUICAO_SUB','ORGANIZACAO_ADMINISTRACAO_','LOCAL_FISICO_REGIAO','ABSTRACCAO_IDEIA_','OBRA_ARTE_CONSTRUCAO','OBRA_ARTE_OUTRO','LOCAL_FISICO_RELEVO','ORGANIZACAO_ADMINISTRACAO_SUB','LOCAL_VIRTUAL_COMSOCIAL','ACONTECIMENTO_EFEMERIDE_','ACONTECIMENTO_EVENTO_','COISA_OBJECTO_','LOCAL_FISICO_ILHA','OBRA_PLANO_','OBRA_REPRODUZIDA_FILME','ORGANIZACAO_EMPRESA_','LOCAL_VIRTUAL_OBRA','ORGANIZACAO_EMPRESA_SUB','ACONTECIMENTO_ORGANIZADO_','OBRA_REPRODUZIDA_','LOCAL_VIRTUAL_OUTRO','OBRA_ARTE_','ABSTRACCAO_NOME_','TEMPO_DURACAO_','OBRA_REPRODUZIDA_TEATRO','OBRA_ARTE_PINTURA','OBRA_ARTE_EDIFICIO']
    filtered = ['LOCAL','ACONTECIMENTO','TEMPO','PESSOA','ORGANIZACAO','VALOR']

    if level == 'cat':
    	categories = cat
    elif level == 'types':
    	categories = types
    elif level == 'subtypes':
    	categories = subtypes
    else:
    	categories = filtered

    ner = train_ner(nlp, train_data, categories)

    if model_dir is not None:
        save_model(ner, model_dir + '/' + level)


if __name__ == '__main__':
    main('ner')
