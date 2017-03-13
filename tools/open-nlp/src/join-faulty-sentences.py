import re
import sys

if(len(sys.argv) > 1):
  filein = sys.argv[1]
  fileout = sys.argv[2]
else:
  print "Usage: python join-faulty-sentences.py <input harem> <output file>\n"
  sys.exit()

# join sentence with previous one if it has an <END> tag without match
file = open(filein,'r')
f = file.read().splitlines()
file.close()

out_f = []

for line in f:
	matched_start = re.search(r"<START:\w+>",line)
	matched_end = re.search(r"<END>",line)

	if (matched_start is not None) and (matched_end is not None): #there are both tags
		if matched_start.start() > matched_end.start(): # <END> without starting tag
			out_f[-1] += ' ' + line #concatenate with previous
		else: #normal case
			out_f.append(line)
	elif (matched_end is not None) and (matched_start is None): #only <END> tag
		out_f[-1] += ' ' + line #concatenate with previous
	else: # only start tag or no tags at all
		out_f.append(line)


out = open(fileout,'w')
out.write("" . join([a + '\n' for a in out_f]))
out.close()