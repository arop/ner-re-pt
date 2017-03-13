import sys
import re

if(len(sys.argv) > 1):
  filein = sys.argv[1]
  fileout = sys.argv[2]
else:
  print "Usage: python change_tags.py <input harem> <output file>\n"
  sys.exit()

f = open(filein,'r')
newdata = f.read()
f.close()

newdata = re.sub(r"<EM CATEG=\"(\w+)\">", r"<START:\1>", newdata)
newdata = newdata.replace("</EM>","<END>")

#################
# Sentence per P tag 
newdata = newdata.replace("<P>",'\n')
newdata = newdata.replace("</P>",'')

#######################
# Ignore DOC tags
newdata = re.sub(r"<DOC DOCID=\"[^\">]+\">", '--DOCSTART--', newdata)
newdata = newdata.replace("</DOC>",'\n')

newdata = "\n".join(newdata.splitlines()[4:-2])

newdata = '--DOCSTART--\n' + newdata

f = open("./outputs/"+fileout,'w')
f.write(newdata)
f.close()