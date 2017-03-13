import spacy
from pathlib import Path
from spacy.pipeline import EntityRecognizer
import sys

MODEL_DIR = Path(".")
nlp = spacy.load('pt', parser=False, entity=False, add_vectors=False)

def load_model(model_name):
    model_dir = MODEL_DIR / model_name
    with (model_dir / 'vocab' / 'strings.json').open('r', encoding='utf8') as file_:
        nlp.vocab.strings.load(file_)
    nlp.vocab.load_lexemes(model_dir / 'vocab' / 'lexemes.bin')
    ner = EntityRecognizer.load(path=model_dir, vocab=nlp.vocab,
                                require=True)
    return ner

if(len(sys.argv) > 1):
  	filein = sys.argv[1]
else:
  	print ("Usage: python " + sys.argv[0] + " <input filename>\n")
  	sys.exit()

# Create doc object for test text
text = open( filein + '.txt', 'r').read().decode('ISO-8859-1')
doc = nlp.make_doc(text)

# Load custom ner model
ner = load_model("ner")

# Perform NER using custom ner model
ner(doc)

# Display recognized entities
entities = []
for ent in doc.ents:
     entities.append([ent.text, ent.label_])
print(entities)

f = open('out_entities.txt','w')
f.write(str(entities))
f.close()