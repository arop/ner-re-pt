import nltk
from nltk.corpus import floresta
import sys

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

# first time
# nltk.download('floresta')

# from http://www.nltk.org/howto/portuguese_en.html
def simplify_tag(t):
     if "+" in t:
         return t[t.index("+")+1:]
     else:
         return t

tsents = floresta.tagged_sents()
tsents = [[(w.lower(),simplify_tag(t)) for (w,t) in sent] for sent in tsents if sent]
train = tsents[100:]
test = tsents[:100]

tagger0 = nltk.DefaultTagger('n')
#nltk.tag.accuracy(tagger0, test)
#print tagger0.evaluate(test)

tagger1 = nltk.UnigramTagger(train, backoff=tagger0)
#nltk.tag.accuracy(tagger1, test)
#print tagger1.evaluate(test)

tagger2 = nltk.BigramTagger(train, backoff=tagger1)
#nltk.tag.accuracy(tagger2, test)
#print tagger2.evaluate(test)

tagged = tagger2.tag(newdata)

to_file = ""
for (word,tag) in tagged:
	to_file += word + '\t' + tag + '\n'

# output to file
f = open('outputs/' + fileout, 'w')
f.write(to_file.encode('ISO-8859-1'))
f.close()