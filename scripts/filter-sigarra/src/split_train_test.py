from lxml import etree
import sys
from random import shuffle

if(len(sys.argv) > 3):
  sigarra_filename = sys.argv[1]
  output_name = sys.argv[2]
  repeat = sys.argv[3]
else:
  print "Usage: python " + sys.argv[0] + " <input file> <output file> <n repeat>"
  sys.exit()

tree = etree.parse(sigarra_filename)

dataset = tree.xpath("//DOC")
shuffle(dataset)

# split into 10 folds
fold_size = int(len(dataset)/9)
folds = [dataset[i:(i + fold_size)] for i in xrange(0, len(dataset), fold_size)]

for i in range(len(folds)):
	out_tree_str = "<?xml version='1.0' encoding='UTF-8'?>\n"
	out_tree_str += "<!DOCTYPE sigarra>\n"
	out_tree_str += "<sigarra versao=\"Primeira_versao_19Maio2017\">\n"
	out_tree_str += "</sigarra>"

	out_tree_train = etree.fromstring(out_tree_str)
	out_tree_test = etree.fromstring(out_tree_str)

	train = folds[:i] + folds[i+1:]
	train = [item for sublist in train for item in sublist]
	test = folds[i]

	for el in train:
		out_tree_train.append(el)

	for el in test:
		out_tree_test.append(el)

	# output to file
	f = open("../outputs/repeat-"+str(repeat)+"/fold-"+str(i)+"/"+output_name+"_train.xml",'w')
	f.write(etree.tostring(out_tree_train, encoding="UTF-8"))
	f.close()

	# output to file
	f = open("../outputs/repeat-"+str(repeat)+"/fold-"+str(i)+"/"+output_name+"_test.xml",'w')
	f.write(etree.tostring(out_tree_test, encoding="UTF-8"))
	f.close()
