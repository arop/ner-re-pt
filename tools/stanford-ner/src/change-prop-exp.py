import re
import sys

if(len(sys.argv) > 5):
  filein = sys.argv[1]
  level = sys.argv[2]
  repeat = sys.argv[3]
  param = sys.argv[4]
  value = sys.argv[5]
else:
  print "Usage: python " + sys.argv[0] + " <input prop> <level> <repeat> <param> <value>\n"
  sys.exit()

if level not in ['cat','filtered','types','subtypes']:
	print "Usage: python " + sys.argv[0] + " <input prop> <level> <repeat> <param> <value>\n"
	print "Level: 'cat','filtered','types','subtypes'\n"
  	sys.exit()

f = open(filein, 'r')
file = f.read()
f.close()

trainFile = '../../outputs/repeat-' + repeat + '/experiences/joined/t_' + level + '_train.txt\n'
serializeTo = '../../models/repeat-' + repeat + '/experiences/' + param + '/' + value + '/' + level + '-ner-model.ser.gz\n'

file = re.sub(r'trainFile = .+\n','trainFile = ' + trainFile, file)
file = re.sub(r'serializeTo = .+\n','serializeTo = ' + serializeTo, file)

# output to file
f = open(filein, 'w')
f.write(file)
f.close()