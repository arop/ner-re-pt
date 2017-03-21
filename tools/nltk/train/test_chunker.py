import nltk
import sys
import pickle

if len(sys.argv) > 1:
	model = sys.argv[1]
	test_file = sys.argv[2]
	fileout = sys.argv[3]
else:
	print "Usage: python " + sys.argv[0] + " <model> <test file>\n"
	sys.exit()

f = open(test_file,'r')
text = f.read().decode('UTF-8')
f.close()

tagged = []
for line in text.splitlines():
	temp = line.split()
	tagged.append((temp[0], temp[1]))

chunker = pickle.load(open(model))

ner_result = chunker.parse(tagged)

conll_result = nltk.chunk.util.tree2conlltags(ner_result)

txt = ""
for (word, pos, tag) in conll_result:
	#txt += word + '\t' + pos + '\t' + tag + '\n'
	if not (word == '--SENTENCE--' or word == '--DOCSTART--'):
		txt += word + '\t' + tag + '\n'

f = open(fileout,'w')
f.write(txt.encode('UTF-8'))
f.close()
