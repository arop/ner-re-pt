import re
import sys

if(len(sys.argv) > 1):
  filein = sys.argv[1]
  fileout = sys.argv[2]
else:
  print "Usage: python " + sys.argv[0] + " <input harem> <output file>\n"
  sys.exit()

f = open(filein, 'r')
fstr = f.read()
f.close()

#remove tags
fstr = re.sub(r'<START:(\w+)>', '', fstr)
fstr = re.sub(r'<END>', '', fstr)

fout = open(fileout, 'w')
fout.write(fstr)
fout.close()
