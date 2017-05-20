import re
import sys

if(len(sys.argv) > 3):
  filein = sys.argv[1]
  fileout = sys.argv[2]
  encoding = sys.argv[3]
else:
  print "Usage: python " + sys.argv[0] + " <input> <output> <encoding>\n"
  sys.exit()

file_str = open(filein, 'r').read().decode(encoding)

file_str = re.sub(r"--DOCSTART--\t--DOCSTART--\n", '', file_str)
file_str = re.sub(r"--SENTENCE--\t--SENTENCE--\n", '', file_str)

# output to file
f = open(fileout, 'w')
f.write(file_str.encode(encoding))
f.close()