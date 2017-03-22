import re
import sys

if(len(sys.argv) > 4):
  filein = sys.argv[1]
  level = sys.argv[2]
  repeat = sys.argv[3]
  fold = sys.argv[4]
else:
  print "Usage: python " + sys.argv[0] + " <input prop> <level> <repeat> <fold>\n"
  sys.exit()

if level not in ['cat','filtered','types','subtypes']:
	print "Usage: python " + sys.argv[0] + " <input prop> <level> <repeat> <fold>\n"
	print "Level: 'cat','filtered','types','subtypes'\n"
  	sys.exit()

f = open(filein, 'r')
file = f.read()
f.close()

trainFile = '../../../outputs/repeat-' + repeat + '/fold-' + fold + '/t_' + level + '_train.txt\n'
serializeTo = '../../../models/repeat-' + repeat + '/fold-' + fold + '/' + level + '-ner-model.ser.gz\n'

file = re.sub(r'trainFile = .+\n','trainFile = ' + trainFile, file)
file = re.sub(r'serializeTo = .+\n','serializeTo = ' + serializeTo, file)

# output to file
f = open(filein, 'w')
f.write(file)
f.close()