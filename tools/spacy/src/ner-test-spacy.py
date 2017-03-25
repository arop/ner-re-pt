import spacy
from pathlib import Path
from spacy.pipeline import BeamEntityRecognizer
from spacy.gold import biluo_tags_from_offsets
from spacy.tokens.doc import Doc
import sys

import re

def load_model(model_name):
  model_dir = MODEL_DIR / model_name
  with (model_dir / 'vocab' / 'strings.json').open('r', encoding='utf8') as file_:
    nlp.vocab.strings.load(file_)
    nlp.vocab.load_lexemes(model_dir / 'vocab' / 'lexemes.bin')
    nlp.entity = BeamEntityRecognizer.load(path=model_dir, vocab=nlp.vocab,
      require=True)
    return nlp

def get_testing_data(input_file):
	ann = open(input_file + '.ann', 'r').read().decode('ISO-8859-1').splitlines()
	txt = open(input_file + '.txt', 'r').read().decode('ISO-8859-1').splitlines()

	testing_data = []
	testing_data_sentence = []
	line_count = 0

	for line in ann:
		if line == '--NO ENTITIES--': #no entities in sentence
			continue
		if line == '': #end of sentence
			try:
				testing_data.append((txt[line_count], testing_data_sentence))
				testing_data_sentence = []
				line_count += 1
				continue
			except Exception as e:
				print(testing_data_sentence, line_count)
				raise e

		#get ann information
		tabs = line.split()
		testing_data_sentence.append((int(tabs[0]), int(tabs[1]), tabs[2]))

	return testing_data, txt

def output_gold(nlp, testing_data):
	out = []
	for raw_text, entity_offsets in testing_data:
		doc = nlp.tokenizer(raw_text)
		gold = biluo_tags_from_offsets(doc, entity_offsets)
		out.append((doc,gold))
	return out

if(len(sys.argv) > 2):
  filein = sys.argv[1]
  model = sys.argv[2]
else:
  print ("Usage: python " + sys.argv[0] + " <input training> <model>\n")
  sys.exit()

MODEL_DIR = Path("./models")
nlp = spacy.get_lang_class('pt')(path=None)

# Load custom ner model
nlp = load_model(model)

testing_data, text = get_testing_data(filein)

to_file = ""
for line in text:
	doc = nlp.tokenizer(line)

	# Perform NER using custom ner model
	nlp.entity(doc)
	for i,token in enumerate(doc):
		if not re.match(r'\s+', token.text) and not re.match(r'--DOCSTART--', token.text):
			to_file += token.text + '\t' + ['I-','O','B-'][token.ent_iob-1] + token.ent_type_ + '\n'

f = open('outputs/'+model+'.txt','w')
f.write(to_file.encode('ISO-8859-1'))
f.close()

gold = output_gold(nlp, testing_data)
to_gold = ""

for span in gold:
	for i in range(len(span[0])):
		t = str(span[0][i]).decode('ISO-8859-1')
		tag = span[1][i]
		if not re.match(r'\s',t) and not re.match(r'--DOCSTART--',t):
			to_gold += t + '\t' + tag + '\n'

to_gold = re.sub(r'\tU-(\w+)',r'\tB-\1',to_gold)
to_gold = re.sub(r'\tL-(\w+)',r'\tI-\1',to_gold)

f = open('outputs/'+model+'-gold.txt','w')
f.write(to_gold.encode('ISO-8859-1'))
f.close()