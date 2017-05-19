from lxml import etree
import sys
import re

if(len(sys.argv) > 2):
  input_filename = sys.argv[1]
  output_name = sys.argv[2]
else:
  print "Usage: python remove_unwanted_spaces.py <input> <output file>"
  sys.exit()

tree = etree.parse(input_filename)

temp_str = etree.tostring(tree, encoding="UTF-8")

temp_str = re.sub(r"(?<=\w)<EM", " <EM", temp_str)
temp_str = re.sub(r"</EM>(?=\w)", "</EM> ", temp_str)

# output to file
f = open("../outputs/"+output_name,'w')
f.write(temp_str)
f.close()