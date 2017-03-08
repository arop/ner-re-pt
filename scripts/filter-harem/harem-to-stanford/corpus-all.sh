#!/bin/bash

corpus-processor process "../outputs/filtered_all.xml" "output/filtered_all" --categories="ymls/filtered.yml"
corpus-processor process "../outputs/filtered_train.xml" "output/filtered_train" --categories="ymls/filtered.yml"
corpus-processor process "../outputs/filtered_test.xml" "output/filtered_test" --categories="ymls/filtered.yml"

corpus-processor process "../outputs/cat_all.xml" "output/cat_all" --categories="ymls/cats.yml"
corpus-processor process "../outputs/cat_train.xml" "output/cat_train" --categories="ymls/cats.yml"
corpus-processor process "../outputs/cat_test.xml" "output/cat_test" --categories="ymls/cats.yml"

corpus-processor process "../outputs/types_all.xml" "output/types_all" --categories="ymls/types.yml"
corpus-processor process "../outputs/types_train.xml" "output/types_train" --categories="ymls/types.yml"
corpus-processor process "../outputs/types_test.xml" "output/types_test" --categories="ymls/types.yml"

corpus-processor process "../outputs/subtypes_all.xml" "output/subtypes_all" --categories="ymls/subtypes.yml"
corpus-processor process "../outputs/subtypes_train.xml" "output/subtypes_train" --categories="ymls/subtypes.yml"
corpus-processor process "../outputs/subtypes_test.xml" "output/subtypes_test" --categories="ymls/subtypes.yml"
