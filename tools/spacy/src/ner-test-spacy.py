import spacy
from pathlib import Path
from spacy.pipeline import EntityRecognizer
from spacy.tagger import Tagger
import sys

import re

def load_model(model_name):
  model_dir = MODEL_DIR / model_name
  with (model_dir / 'vocab' / 'strings.json').open('r', encoding='utf8') as file_:
    nlp.vocab.strings.load(file_)
    nlp.vocab.load_lexemes(model_dir / 'vocab' / 'lexemes.bin')
    ner = EntityRecognizer.load(path=model_dir, vocab=nlp.vocab,
      require=True)
    return ner, nlp

if(len(sys.argv) > 2):
  filein = sys.argv[1]
  model = sys.argv[2]
else:
  print ("Usage: python " + sys.argv[0] + " <input training> <model>\n")
  sys.exit()

MODEL_DIR = Path("./models")
nlp = spacy.get_lang_class('pt')(path=None)

# Load custom ner model
ner, nlp = load_model(model)

# Create doc object for test text
text = open( filein + '.txt', 'r').read().decode('ISO-8859-1')
doc = nlp(text,entity=False)

# Perform NER using custom ner model
ner(doc)
temp = ""

for line in doc:
	if not re.match(r'\s',line.text):
		temp += line.text + '\t' + ['I-','O','B-'][line.ent_iob-1] + line.ent_type_ + '\n'

f = open('out_entities.txt','w')
#f.write(str(entities))
f.write(temp.encode('ISO-8859-1'))
f.close()