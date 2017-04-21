#!/bin/bash

# stanford
# cd run-scripts && ./run-cat-stanford.sh ; cd -
# cd run-scripts && ./run-filtered-stanford.sh ; cd -
# cd run-scripts && ./run-types-stanford.sh ; cd -
# cd run-scripts && ./run-subtypes-stanford.sh ; cd -

# open-nlp
cd run-scripts && ./run-cat-opennlp.sh ; cd -
cd run-scripts && ./run-filtered-opennlp.sh ; cd -
cd run-scripts && ./run-types-opennlp.sh ; cd -
cd run-scripts && ./run-subtypes-opennlp.sh ; cd -

# nltk
# cd run-scripts && ./run-cat-nltk.sh ; cd -
# cd run-scripts && ./run-types-nltk.sh ; cd -
# cd run-scripts && ./run-subtypes-nltk.sh ; cd -
# cd run-scripts && ./run-filtered-nltk.sh ; cd -

# spacy
cd run-scripts && ./run-cat-spacy.sh ; cd -
cd run-scripts && ./run-types-spacy.sh ; cd -
cd run-scripts && ./run-subtypes-spacy.sh ; cd -
cd run-scripts && ./run-filtered-spacy.sh ; cd -