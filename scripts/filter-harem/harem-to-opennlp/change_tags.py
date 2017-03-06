import sys

if(len(sys.argv) > 1):
  filein = sys.argv[1]
  fileout = sys.argv[2]
  input_categories = sys.argv[3]
else:
  print "Usage: python change_tags.py <input harem> <output file> <categories to change>\n"
  sys.exit()


f = open(filein,'r')
filedata = f.read()
f.close()

categories = open(input_categories).read().splitlines()

newdata = filedata

for cat in categories:
	newdata = newdata.replace("<EM CATEG=\""+ cat + "\">","<START:"+cat+">")

newdata = newdata.replace("</EM>","<END>")	

f = open(fileout,'w')
f.write(newdata)
f.close()