pos_tagged = open('outputs/pos-tagged.txt','r')
tokenized_w_categories = open('outputs/tokenized_w_categories.txt','r')

# from http://stackoverflow.com/a/1830663/3599718
from itertools import izip

new_file = ""
with pos_tagged as pos, tokenized_w_categories as entities:
    for p, e in izip(pos, entities):
        ps = p.split()
        es = e.split()

        if not ps[0] == es[0]:
        	print "ERROR: " + ps[0] + " | " + es[0] + '\n'
        else:
        	new_file += ps[0] + '\t' + ps[1] + '\t' + es[1] + '\n'

# output to file
fileout = "ready_to_nltk.txt"
f = open('outputs/' + fileout, 'w')
f.write(new_file)
f.close()