import re
import sys

if(len(sys.argv) > 2):
  filein = sys.argv[1]
  fileout = sys.argv[2]
else:
  print "Usage: python " + sys.argv[0] + " <input> <output>\n"
  sys.exit()

file_str = open(filein, 'r').read().decode('ISO-8859-1')

file_str = re.sub(r"--DOCSTART--\t--DOCSTART--\n", '', file_str)
file_str = re.sub(r"--SENTENCE--\t--SENTENCE--\n", '', file_str)

# output to file
f = open(fileout, 'w')
f.write(file_str.encode('ISO-8859-1'))
f.close()