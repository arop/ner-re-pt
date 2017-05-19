import sys
import re

if(len(sys.argv) > 2):
  filein = sys.argv[1]
  fileout = sys.argv[2]
else:
  print "Usage: python " + sys.argv[0] + " <input harem> <output file>\n"
  sys.exit()

f = open(filein,'r')
newdata = f.read()
f.close()

newdata = re.sub(r"<EM CATEG=\"(\w+)\">", r"<START:\1>", newdata)
newdata = newdata.replace("</EM>","<END>")

#######################
# Ignore DOC tags
newdata = re.sub(r"<DOC id=\"[^\">]+\">", '--DOCSTART--', newdata)
newdata = newdata.replace("</DOC>",'\n')

newdata = "\n".join(newdata.splitlines()[4:-2])

newdata = '--DOCSTART--\n' + newdata

f = open("./outputs/"+fileout,'w')
f.write(newdata)
f.close()