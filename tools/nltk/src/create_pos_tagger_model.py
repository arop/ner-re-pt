import nltk
from nltk.corpus import floresta
from pickle import dump

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

train = tsents
#test = tsents[:100]

tagger0 = nltk.DefaultTagger('n')
#nltk.tag.accuracy(tagger0, test)
#print tagger0.evaluate(test)

tagger1 = nltk.UnigramTagger(train, backoff=tagger0)
#nltk.tag.accuracy(tagger1, test)
#print tagger1.evaluate(test)

tagger2 = nltk.BigramTagger(train, backoff=tagger1)
#nltk.tag.accuracy(tagger2, test)
#print tagger2.evaluate(test)


# save tagger
output = open('../pos-tagger/pt-tagger.pkl','wb')
dump(tagger2, output, -1)
output.close()