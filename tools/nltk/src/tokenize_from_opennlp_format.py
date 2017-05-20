import re
import sys
from nltk.tokenize import word_tokenize

if(len(sys.argv) > 3):
  filein = sys.argv[1]
  fileout = sys.argv[2]
  encoding = sys.argv[3]
else:
  print "Usage: python " + sys.argv[0] + " <input> <output> <encoding>\n"
  sys.exit()

file = open(filein, 'r').read()
file_str = "--SENTENCE--\n".join(file.splitlines())

#tokenize file
text_as_list = word_tokenize(file_str.decode(encoding))

tokenized = ""
for token in text_as_list:
	tokenized += token + '\n'

#replace tokenized entity tag with single entity tag
file_str = re.sub(r"<\nSTART\n:\n(\w+)\n>", r"<EM CATEG='\1'>", tokenized)
file_str = re.sub(r"<\nEM\n>\n", '', file_str)
file_str = re.sub(r"<\nEND\n>", r"</EM>", file_str)

file_str = re.sub(r"--\nDOCSTART\n--", r"--DOCSTART--", file_str)
file_str = re.sub(r"--\nSENTENCE\n--", r"--SENTENCE--", file_str)

#############################
###### SET CATEGORIES #######
patternBegin = re.compile(r"<EM CATEG='(\w+)'>")
patternEnd = re.compile(r"</EM>")
docstart = re.compile(r"--DOCSTART--")
sentencestart = re.compile(r"--SENTENCE--")
insideEntity = False
begin = False
first = False
to_file = ""

for line in file_str.splitlines():
	if (not insideEntity) and patternBegin.match(line): # begin tag, start tagging next time
		entityClass = patternBegin.match(line).group(1)
		begin = True
		first = True
		insideEntity = True
	elif insideEntity and patternEnd.match(line): # end tag, finish tagging
		begin = False
		first = False
		insideEntity = False
	elif insideEntity and first: # start tag -> B
		first = False
		to_file += line + '\tB-' + entityClass + '\n'
	elif insideEntity and (not first): # middle tag -> I
		to_file += line + '\tI-' + entityClass + '\n'
	elif (not insideEntity) and patternEnd.match(line): # close tag for cases where entities had no category
		continue
	elif docstart.match(line):
		to_file += line + '\t--DOCSTART--\n'
	elif sentencestart.match(line):
		to_file += line + '\t--SENTENCE--\n'
	else: # not tagging
		to_file += line + '\tO\n'

# output to file
f = open(fileout, 'w')
f.write(to_file.encode(encoding))
f.close()