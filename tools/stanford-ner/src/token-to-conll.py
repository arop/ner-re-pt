import re
import sys

if(len(sys.argv) > 1):
  filein = sys.argv[1]
else:
  print "Usage: python " + sys.argv[0] + " <input tokenized>\n"
  sys.exit()

f = open(filein, 'r')
file = f.read().decode('ISO-8859-1')
f.close()

#############################
###### SET CATEGORIES #######
patternBegin = re.compile(ur"<EM\sCATEG=\"(\w+)\">", re.U)
patternEnd = re.compile(r"</EM>")
ignorePattern = re.compile(r"<P>|</P>|<DOC\sDOCID=\".+\">|</DOC>", re.U)
insideEntity = False
to_file = ""
to_clean_file = ""

for line in file.splitlines()[3:]:
	if (not insideEntity) and patternBegin.match(line): # begin tag, start tagging next time
		entityClass = patternBegin.match(line).group(1)
		insideEntity = True
	elif insideEntity and patternEnd.match(line): # end tag, finish tagging
		begin = False
		insideEntity = False
	elif insideEntity: # tag 
		to_file += line + '\t' + entityClass + '\n'
		to_clean_file += line + '\n'
	elif (not insideEntity) and patternEnd.match(line): # close tag for cases where entities had no category DEPRECATED
		continue
	elif (not insideEntity) and ignorePattern.match(line): # ignore paragraphs and documents
		continue
	else: # not tagging
		to_file += line + '\tO\n'
		to_clean_file += line + '\n'

# output to file
f = open(filein, 'w')
f.write(to_file.encode('ISO-8859-1'))
f.close()

# output to clean file
f = open(filein + "-clean.txt", 'w')
f.write(to_clean_file.encode('ISO-8859-1'))
f.close()