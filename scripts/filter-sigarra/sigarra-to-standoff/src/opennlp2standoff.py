# algorithm
# 1- search till <START:tag>
# 2- Save start pos
# 3- delete tag
# 4- search till <END>
# 5- save end pos
# 6- delete tag

import re
import sys

if(len(sys.argv) > 2):
  filein = sys.argv[1]
  fileout = sys.argv[2]
else:
  print "Usage: python opennlp2standoff.py <input harem> <output file>\n"
  sys.exit()

def get_standoff(line):
	standoff = []
	while True:
		matched = re.search(r"<START:\w+>\s",line)
		if matched is None:
			break
		beginPos = matched.span()[0]
		line = line[:beginPos] + line[matched.span()[1]:]
		tag = matched.group()[ len("<START:") : len(matched.group()) - 2 ]
		matched = re.search(r"\s<END>",line)

		if matched is None:
			print 'ERROR: NO MATCH FOR <END>\n'
			print line
			break

		endPos = matched.span()[0]
		line = line[:endPos] + line[matched.span()[1]:]

		standoff.append((beginPos, endPos, tag))
	return standoff, line

input_file = open(filein,'r').read().decode('UTF-8').splitlines()

standoff_out = ""
file_out = ""
for line in input_file:
	standoff = get_standoff(line)
	if len(standoff[0]) == 0:
		standoff_out += '--NO ENTITIES--\n'
	else:
		for l in standoff[0]:
			standoff_out += str(l[0]) + '\t' + str(l[1]) + '\t' + str(l[2]) + '\n'
	standoff_out += '\n'
	file_out += standoff[1] +  '\n'

file = open(fileout + '-standoff.ann','w')
file.write(standoff_out.encode('UTF-8'))
file.close()

file = open(fileout + '-standoff.txt','w')
file.write(file_out.encode('UTF-8'))
file.close()
