from lxml import etree

harem_dataset = '../outputs/cat_all.xml'

text = open(harem_dataset,'r').read()

text = text.replace('<P>','\n<P>')

categories = open('categories').read().splitlines()

for cat in categories:
	text = text.replace("<EM CATEG=\""+ cat + "\">",'')

text = text.replace('<EM>','')
text = text.replace('</EM>','')

tree = etree.fromstring(text)

etree.strip_tags(tree, 'DOC', 'P')

f = open('outputs/cleaned.txt', 'w')
f.write(etree.tostring(tree, encoding="ISO-8859-1"))
f.close()