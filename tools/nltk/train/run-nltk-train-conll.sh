#!/bin/bash

# CATEGORIES
python train_chunker.py corpora/harem --fileids 'out-conll-cat-utf8.txt' --reader nltk.corpus.reader.conll.ConllChunkCorpusReader --classifier NaiveBayes --fraction 0.75
#python train_chunker.py corpora/harem --fileids 'out-conll-cat-utf8.txt' --reader nltk.corpus.reader.conll.ConllChunkCorpusReader --classifier Maxent --fraction 0.75
#python train_chunker.py corpora/harem --fileids 'out-conll-cat-utf8.txt' --reader nltk.corpus.reader.conll.ConllChunkCorpusReader --classifier DecisionTree --fraction 0.75
#python train_chunker.py corpora/harem --fileids 'out-conll-cat-utf8.txt' --reader nltk.corpus.reader.conll.ConllChunkCorpusReader --sequential 'ubt' --fraction 0.75

# TYPES
#python train_chunker.py corpora/harem --fileids 'out-conll-types-utf8.txt' --reader nltk.corpus.reader.conll.ConllChunkCorpusReader --classifier NaiveBayes --fraction 0.75
#python train_chunker.py corpora/harem --fileids 'out-conll-types-utf8.txt' --reader nltk.corpus.reader.conll.ConllChunkCorpusReader --classifier Maxent --fraction 0.75
#python train_chunker.py corpora/harem --fileids 'out-conll-types-utf8.txt' --reader nltk.corpus.reader.conll.ConllChunkCorpusReader --classifier DecisionTree --fraction 0.75
#python train_chunker.py corpora/harem --fileids 'out-conll-types-utf8.txt' --reader nltk.corpus.reader.conll.ConllChunkCorpusReader --sequential 'ubt' --fraction 0.75

# SUBTYPES
#python train_chunker.py corpora/harem --fileids 'out-conll-subtypes-utf8.txt' --reader nltk.corpus.reader.conll.ConllChunkCorpusReader --classifier NaiveBayes --fraction 0.75
#python train_chunker.py corpora/harem --fileids 'out-conll-subtypes-utf8.txt' --reader nltk.corpus.reader.conll.ConllChunkCorpusReader --classifier Maxent --fraction 0.75
#python train_chunker.py corpora/harem --fileids 'out-conll-subtypes-utf8.txt' --reader nltk.corpus.reader.conll.ConllChunkCorpusReader --classifier DecisionTree --fraction 0.75
#python train_chunker.py corpora/harem --fileids 'out-conll-subtypes-utf8.txt' --reader nltk.corpus.reader.conll.ConllChunkCorpusReader --sequential 'ubt' --fraction 0.75