import re
import sys
from nltk.tokenize import word_tokenize

if(len(sys.argv) > 1):
  filein = sys.argv[1]
  fileout = sys.argv[2]
  encoding = sys.argv[3]
else:
  print "Usage: python " + sys.argv[0] + " <input> <output>\n"
  sys.exit()

file_str = open(filein, 'r').read().decode(encoding)

#tokenize file
text_as_list = word_tokenize(file_str)

tokenized = ""
for token in text_as_list:
	tokenized += token + '\n'

#replace tokenized entity tag with single entity tag
file_str = re.sub(r"<\nSTART\n:\n(\w+)\n>", r"<EM CATEG='\1'>", tokenized)
file_str = re.sub(r"<\nEND\n>", r"</EM>", file_str)

file_str = re.sub(r"--\nDOCSTART\n--", r"--DOCSTART--", file_str)

#############################
###### SET CATEGORIES #######
patternBegin = re.compile(r"<EM CATEG='(\w+)'>")
patternEnd = re.compile(r"</EM>")
docstart = re.compile(r"--DOCSTART--")
insideEntity = False
to_file = ""

if encoding == "UTF-8": #means its results, remove last lines
	file_str = "\n".join(file_str.splitlines()[:-5])

for line in file_str.splitlines():
	if (not insideEntity) and patternBegin.match(line): # begin tag, start tagging next time
		entityClass = patternBegin.match(line).group(1)
		insideEntity = True
	elif insideEntity and patternEnd.match(line): # end tag, finish tagging
		insideEntity = False
	elif insideEntity: # tag
		to_file += line + '\t' + entityClass + '\n'
	elif (not insideEntity) and patternEnd.match(line): # close tag for cases where entities had no category
		continue
	elif docstart.match(line):
		continue
	else: # not tagging
		to_file += line + '\tO\n'

to_file = re.sub('``', '\'\'', to_file)

# output to file
f = open(fileout, 'w')
f.write(to_file.encode('ISO-8859-1'))
f.close()