import re
from lxml import etree
from nltk.tokenize import word_tokenize

file = open('../../scripts/filter-harem/outputs/cat_all.xml','r').read()

file = file.replace('<P>','\n<P>')

#strip DOC and P tags
tree = etree.fromstring(file)
etree.strip_tags(tree, 'DOC', 'P')
string_tree = etree.tostring(tree, encoding='ISO-8859-1')

#remove first lines (with xml)
to_file = string_tree.split('\n',3)[3]

#tokenize file
text_as_list = word_tokenize(to_file.decode('ISO-8859-1'))

tokenized = ""
for token in text_as_list:
	tokenized += token + '\n'

#replace tokenized entity tag with single entity tag
to_file = re.sub(r"<\nEM\nCATEG=\n''\n(\w+)\n''\n>", r"<EM CATEG='\1'>", tokenized)
to_file = re.sub(r"<\nEM\n>\n", '', to_file)
to_file = re.sub(r"<\n/EM\n>", r"</EM>", to_file)

#remove last tag
to_file = re.sub(r"<\n/colHAREM\n>", '', to_file)

# output to file
fileout = "tokenized_w_categories.txt"
f = open('outputs/' + fileout, 'w')
f.write(to_file.encode('ISO-8859-1'))
f.close()