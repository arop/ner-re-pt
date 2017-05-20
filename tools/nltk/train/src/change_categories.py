import re
import sys

if(len(sys.argv) > 1):
  level = sys.argv[1]
  if level not in ['cat', 'types', 'subtypes', 'filtered', 'sigarra']:
  	print "ERROR: wrong level! Use cat or types or subtypes or filtered. Or sigarra.\n"
  	sys.exit()	
else:
  print "Usage: python " + sys.argv[0] + " <level>\n"
  sys.exit()

file = '../nltk_trainer/__init__.py'

f = open(file,'r')
file_str = f.read()
f.close()

pattern = re.compile(r'########### HERE ############\n\t\tkwargs\[\'chunk_types\'\] = \w+')

replacement = "########### HERE ############\n\t\tkwargs['chunk_types'] = "+ level

file_str = re.sub(pattern, replacement, file_str)

f = open(file,'w')
f.write(file_str)
f.close()