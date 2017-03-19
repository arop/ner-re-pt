from lxml import etree
import sys
import re

if(len(sys.argv) > 1):
  input_filename = sys.argv[1]
  output_name = sys.argv[2]
else:
  print "Usage: python remove_unwanted_spaces.py <input harem> <output file>"
  sys.exit()

tree = etree.parse(input_filename)

for ps in tree.iterfind('//P'):
	inside_ps = etree.tostring(ps).replace('\n','').replace('\t',' ').replace('      ',' ')
	inside_elem = etree.fromstring('<temp>'+inside_ps+'</temp>')
	ps.getparent().replace(ps,inside_elem)

etree.strip_tags(tree,'temp')

temp_str = etree.tostring(tree, encoding="ISO-8859-1")

temp_str = re.sub(r"(?<=\w)<EM", " <EM", temp_str)
temp_str = re.sub(r"</EM>(?=\w)", "</EM> ", temp_str)

# output to file
f = open("../outputs/"+output_name,'w')
f.write(temp_str)
f.close()