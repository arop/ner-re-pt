import nltk
import nltk.data
from nltk.corpus import floresta

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

text = "Isto vai servir para testar o Jorge Rocha para saber se o tagger funciona mesmo. Se funcionar vai identificar Facebook e Universidade do Porto."
tagged = tagger2.tag(text.split())

#chunker = nltk.data.load('chunkers/harem_NaiveBayes.pickle')
#chunker = nltk.data.load('chunkers/harem_Maxent.pickle')
chunker = nltk.data.load('chunkers/harem_DecisionTree.pickle')
print chunker.parse(tagged)
