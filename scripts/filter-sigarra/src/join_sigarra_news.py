from lxml import etree
import os

data_path = "../outputs/all-xml"

docs = []

out_tree_str = "<?xml version='1.0' encoding='UTF-8'?>\n"
out_tree_str += "<!DOCTYPE sigarra>\n"
out_tree_str += "<sigarra versao=\"Primeira_versao_19Maio2017\">\n"

docs.append(out_tree_str)

for file in os.listdir(data_path):
	tree = etree.parse(data_path + '/' + file)
	root = tree.getroot()

	root.attrib["id"] = os.path.splitext(file)[0]

	docs.append(etree.tostring(tree, encoding="UTF-8"))

docs.append("</sigarra>")

f = open('../outputs/sigarra-corpus.xml', 'w')
for doc in docs:
	f.write(doc + "\n")
f.close()
