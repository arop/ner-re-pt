#!/bin/bash

corpus-processor process "../outputs/harem-filtered.xml" "output/filtered" --categories="ymls/filtered.yml"

corpus-processor process "../outputs/harem-only-categories.xml" "output/only-cat" --categories="ymls/cats.yml"

corpus-processor process "../outputs/harem-only-types.xml" "output/only-type" --categories="ymls/types.yml"

corpus-processor process "../outputs/harem-only-subtypes.xml" "output/only-subtype" --categories="ymls/subtypes.yml"
