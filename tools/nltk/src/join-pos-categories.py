import sys

if(len(sys.argv) > 1):
  pos_tagged = sys.argv[1]
  tokenized_w_categories = sys.argv[2]
  fileout = sys.argv[3]
else:
  print "Usage: python " + sys.argv[0] + " <input_pos> <input_iob> <output>\n"
  sys.exit()

pos_tagged = open(pos_tagged,'r')
tokenized_w_categories = open(tokenized_w_categories,'r')

# from http://stackoverflow.com/a/1830663/3599718
from itertools import izip

new_file = ""
with pos_tagged as pos, tokenized_w_categories as entities:
    for p, e in izip(pos, entities):
        ps = p.split()
        es = e.split()

        if not ps[0] == es[0]:
        	print "ERROR: " + ps[0] + " | " + es[0] + '\n'
        elif es[0] == '--SENTENCE--':
          new_file += '--SENTENCE--\n'
        elif es[0] == '--DOCSTART--':
          new_file += '--DOCSTART--\n'
        else:
        	new_file += ps[0] + '\t' + ps[1] + '\t' + es[1] + '\n'

new_file = new_file.replace('--SENTENCE--','')
new_file = new_file.replace('--DOCSTART--\n','')

# output to file
f = open('outputs/' + fileout, 'w')
f.write(new_file)
f.close()