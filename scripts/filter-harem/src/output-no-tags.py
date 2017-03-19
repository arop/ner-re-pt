from lxml import etree
import sys
import re

if(len(sys.argv) > 1):
  harem_filename = sys.argv[1]
  output_name = sys.argv[2]
else:
  print "Usage: python " + sys.argv[0] + " <input file> <output file>"
  sys.exit()

out_tree_test = etree.parse(harem_filename)

##### remove tags
etree.strip_tags(out_tree_test,'DOC')

out_clean = etree.tostring(out_tree_test, encoding="ISO-8859-1")
out_clean = out_clean.splitlines()[3:-1]
out_clean = "\n".join(out_clean)

out_clean = re.sub(r'<P>', r" ", out_clean)
out_clean = re.sub(r'</P>', r" ", out_clean)

out_clean = re.sub(r'(\w+|\.)<EM CATEG=\"\w+\">', r"\1 ", out_clean)
out_clean = re.sub(r'</EM>(\w+|\.)', r" \1", out_clean)

out_clean = re.sub(r'(.|\n)<EM CATEG=\"\w+\">', r"\1", out_clean)
out_clean = re.sub(r'</EM>(.)', r"\1 ", out_clean)


# output to file, test file without tags
f = open("../outputs/"+output_name+"_test-clean.xml",'w')
f.write(out_clean)
f.close()