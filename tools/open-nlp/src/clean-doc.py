import re
import sys

if(len(sys.argv) > 1):
  filein = sys.argv[1]
  fileout = sys.argv[2]
else:
  print "Usage: python " + sys.argv[0] + " <input harem> <output file>\n"
  sys.exit()

f = open(filein, 'r')
fstr = f.read()
f.close()

#add space before and after each tag when needed
fstr = re.sub(r'([^ \n])<START', r'\1 <START', fstr)
fstr = re.sub(r'([^ \n])<END>', r'\1 <END>', fstr)
fstr = re.sub(r'<START:(\w+)>([^ \n])', r'<START:\1> \2', fstr)
fstr = re.sub(r'<END>([^ \n])', r'<END> \1', fstr)

fstr = re.sub(r'<EM>([^<]+)<END>', r'\1', fstr)

fout = open(fileout, 'w')
fout.write(fstr)
fout.close()