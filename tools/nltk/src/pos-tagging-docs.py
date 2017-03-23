import nltk
import sys
from pickle import load

if(len(sys.argv) > 1):
  filein = sys.argv[1]
  fileout = sys.argv[2]
else:
  print "Usage: python " + sys.argv[0] + " <input> <output>\n"
  sys.exit()

#tokenize
text_as_list = open(filein,'r').read().decode('ISO-8859-1').splitlines()

#remove tags
newdata = []
for line in text_as_list:
	newdata.append(line.split()[0])

# NOTE: run create_pos_tagger_model.py first!
input = open('pos-tagger/pt-tagger.pkl','rb')
tagger = load(input)
input.close()

tagged = tagger.tag(newdata)

to_file = ""
for (word,tag) in tagged:
	if not "test.txt" in fileout:
		to_file += word + '\t' + tag + '\n'
	else:
		if not (word == '--SENTENCE--' or word == '--DOCSTART--'):
			to_file += word + '\t' + tag + '\n'

# output to file
f = open(fileout, 'w')
f.write(to_file.encode('ISO-8859-1'))
f.close()