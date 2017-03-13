import nltk
import sys

if(len(sys.argv) > 1):
  filein = sys.argv[1]
  fileout = sys.argv[2]
else:
  print "Usage: python sentence-segmentation.py <input harem> <output file>\n"
  sys.exit()

#run first time
#nltk.download('punkt')

# sentence segmentation
stok = nltk.data.load('tokenizers/punkt/portuguese.pickle')
file = open(filein,'r')
sentences = stok.tokenize(file.read().decode('ISO-8859-1'))

to_file = ""
for s in sentences:
	to_file += s + '\n'

# output to file
f = open('outputs/' + fileout, 'w')
f.write(to_file.encode('ISO-8859-1'))
f.close()