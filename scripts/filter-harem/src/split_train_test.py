from lxml import etree
import sys
#129 documents
#90 train
#39 test

if(len(sys.argv) > 1):
  harem_filename = sys.argv[1]
  output_name = sys.argv[2]
else:
  print "Usage: python split_train_test.py <input file> <output file>"
  sys.exit()

tree = etree.parse(harem_filename)
train = tree.xpath("//DOC[position() <= 90]")
test = tree.xpath("//DOC[position() > 90]")

out_tree_str = "<?xml version='1.0' encoding='ISO-8859-1'?>\n"
out_tree_str += "<!DOCTYPE colHAREM>\n"
out_tree_str += "<colHAREM versao=\"Segundo_dourada_com_relacoes_14Abril2010\">\n"
out_tree_str += "</colHAREM>"

out_tree_train = etree.fromstring(out_tree_str)
out_tree_test = etree.fromstring(out_tree_str)

for el in train:
	out_tree_train.append(el)

for el in test:
	out_tree_test.append(el)

# output to file
f = open("../outputs/"+output_name+"_train.xml",'w')
f.write(etree.tostring(out_tree_train, encoding="ISO-8859-1"))
f.close()

# output to file
f = open("../outputs/"+output_name+"_test.xml",'w')
f.write(etree.tostring(out_tree_test, encoding="ISO-8859-1"))
f.close()
