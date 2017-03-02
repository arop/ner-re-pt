#!/usr/bin/python3

import sys, os, string
from nltk.tokenize import WordPunctTokenizer

if len(sys.argv) < 3:
    print("Usage: %s BRATDIR COLFILE [BASENAME]" % sys.argv[0])
    sys.exit(1)

if len(sys.argv) > 3:
    basename_match = sys.argv[3]
else:
    basename_match = None

brat_data_dirname = sys.argv[1]
col_filename = sys.argv[2]

tokenizer = WordPunctTokenizer()

with open(col_filename, 'w') as col_file:
    for (dirpath, dirnames, filenames) in os.walk(brat_data_dirname):
        for filename in filenames:
            if not filename.endswith('.ann'): continue
            basename = filename.split('.')[0]
            if basename_match is not None and basename != basename_match: continue

            print("===> Processing %s" % basename)

            ann_path = os.path.join(brat_data_dirname, filename)
            if os.stat(ann_path).st_size > 0:
                doc_path = os.path.join(brat_data_dirname, '%s.txt' % basename)
                
                with open(doc_path, 'r') as doc_file, open(ann_path, 'r') as ann_file:
                    start_dict = {}
                    end_dict = {}
                    for (id, type_pos, entity) in (tuple(line.strip().split('\t')) for line in ann_file):
                        (type, start, end) = type_pos.split(' ')
                        start_dict[start] = type
                        end_dict[end] = type

                    content = doc_file.read()
                    ann_content = ""

                    active_type = 'O'
                    for (start, end) in tokenizer.span_tokenize(content):
                        if str(start) in start_dict:
                            active_type = start_dict[str(start)]

                        #print("%s\t%s" % (content[start:end], active_type))
                        col_file.write("%s\t%s\n" % (content[start:end], active_type))

                        if str(end) in end_dict:
                            active_type = 'O'
