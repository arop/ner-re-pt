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
file_str = string_tree.split('\n',3)[3]

#tokenize file
text_as_list = word_tokenize(file_str.decode('ISO-8859-1'))

tokenized = ""
for token in text_as_list:
	tokenized += token + '\n'

#replace tokenized entity tag with single entity tag
file_str = re.sub(r"<\nEM\nCATEG=\n''\n(\w+)\n''\n>", r"<EM CATEG='\1'>", tokenized)
file_str = re.sub(r"<\nEM\n>\n", '', file_str)
file_str = re.sub(r"<\n/EM\n>", r"</EM>", file_str)

#remove last tag
file_str = re.sub(r"<\n/colHAREM\n>", '', file_str)


#############################
###### SET CATEGORIES #######
patternBegin = re.compile(r"<EM CATEG='(\w+)'>")
patternEnd = re.compile(r"</EM>")
insideEntity = False
begin = False
first = False
to_file = ""

for line in file_str.splitlines():
	if (not insideEntity) and patternBegin.match(line): # begin tag, start tagging next time
		entityClass = patternBegin.match(line).group(1)
		begin = True
		first = True
		insideEntity = True
	elif insideEntity and patternEnd.match(line): # end tag, finish tagging
		begin = False
		first = False
		insideEntity = False
	elif insideEntity and first: # start tag -> B
		first = False
		to_file += line + '\tB-' + entityClass + '\n'
	elif insideEntity and (not first): # middle tag -> I
		to_file += line + '\tI-' + entityClass + '\n'
	elif (not insideEntity) and patternEnd.match(line): # close tag for cases where entities had no category
		continue
	else: # not tagging
		to_file += line + '\tO\n'

# output to file
fileout = "tokenized_w_categories.txt"
f = open('outputs/' + fileout, 'w')
f.write(to_file.encode('ISO-8859-1'))
f.close()