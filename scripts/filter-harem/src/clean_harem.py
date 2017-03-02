from lxml import etree
import sys
import filter_alt_tags

if(len(sys.argv) > 1):
  harem_filename = sys.argv[1]
  output_name = sys.argv[2]
else:
  print "Usage: python clean-harem.py <input harem> <output file> <x>\nx: 0- only categories, 1- only types, 2- only subtypes, 3- filtered"
  sys.exit()

tree = etree.parse(harem_filename)

# filter unnecessary categories, types and subtypes
if(sys.argv[3] == "3"):
  import filter_harem
  print "Filtering dataset"
  filter_harem.filter_dataset(tree)

##########################
### REMOVE ATTRIBUTES ####
##########################
# http://stackoverflow.com/questions/2720396/how-to-remove-attribute-of-a-etree-element
def remove_attrib(tree,attr):
  for el in tree.iter():
    el.attrib.pop(attr, None)

attr_name = ['TIPO','SUBTIPO','COREL','TIPOREL','ID','COMENT']
for at in attr_name:
  remove_attrib(tree,at)

# remove elements OMITIDO, check livro HAREM pag 109, secao 5.6.1.3
etree.strip_elements(tree,'OMITIDO')

# deal with ALT tags
filter_alt_tags.filter_alt_tags(tree)

# output to file
f = open("./outputs/"+output_name,'w')
f.write(etree.tostring(tree, encoding="ISO-8859-1"))
f.close()
