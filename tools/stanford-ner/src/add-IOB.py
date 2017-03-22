import re
import sys

if len(sys.argv) > 1:
	filein = sys.argv[1]
else:
	print "Usage: python " + sys.argv[0] + " <input file>\n"
	sys.exit()

f = open(filein,'r')
f_str = f.read().splitlines()
f.close()

# get first line tag
if not f_str[0].split()[1] == 'O':
	f_str[0] = re.sub(r'(\w+)\t(\w+)',r'\1\tB-\2',f_str[0])

for i,line in enumerate(f_str[1:]):
	tag = line.split()[1]
	if not tag == 'O':
		previous_tag = f_str[i].split()[1]
		if re.match(r'[BI]-' + tag, previous_tag):
			f_str[i+1] = line.split()[0] + '\tI-' + tag
		else:
			f_str[i+1] = line.split()[0] + '\tB-' + tag

to_file = "\n".join(f_str)

o = open(filein,'w')
o.write(to_file)
o.close()
