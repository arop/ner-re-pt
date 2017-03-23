#!/bin/bash

# for i in {0..9}
# do
# 	printf '\n*** fold '$i' ***\n'
# 	TRAIN=../../scripts/filter-harem/harem-to-standoff/outputs/repeat-$r/fold-$i

# 	python "src/ner-train-spacy.py" $TRAIN"/cat_train-standoff" "models/fold-"$i cat 
# 	python "src/ner-train-spacy.py" $TRAIN"/types_train-standoff" "models/fold-"$i types 
# 	python "src/ner-train-spacy.py" $TRAIN"/subtypes_train-standoff" "models/fold-"$i subtypes 
# 	python "src/ner-train-spacy.py" $TRAIN"/filtered_train-standoff" "models/fold-"$i filtered 
# done

TRAIN=../../scripts/filter-harem/harem-to-standoff/outputs/repeat-0/fold-0
python "src/ner-train-spacy.py" $TRAIN"/cat_train-standoff" "models/repeat-0/fold-0" cat 