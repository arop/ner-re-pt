import re
import sys

if(len(sys.argv) > 3):
	filein = sys.argv[1]
	level = sys.argv[2]
	repeat = sys.argv[3]
	fold = ""
	if(len(sys.argv) > 4):
		fold = sys.argv[4]
else:
	print "Usage: python " + sys.argv[0] + " <input prop> <level> <repeat>\n"
	sys.exit()

if level not in ['sigarra','sigarra-default']:
	print "Usage: python " + sys.argv[0] + " <input prop> <level> <repeat>\n"
	print "Level: 'sigarra','sigarra-default'\n"
  	sys.exit()

f = open(filein, 'r')
file = f.read()
f.close()

if fold != "":
	trainFile = '../outputs/repeat-' + repeat + '/sigarra/fold-' + fold + '/t_sigarra_train.txt\n'
	serializeTo = '../models/repeat-' + repeat + '/sigarra/fold-' + fold + '/' + level + '-ner-model.ser.gz\n'
else:
	trainFile = '../outputs/repeat-' + repeat + '/sigarra/t_sigarra_train.txt\n'
	serializeTo = '../models/repeat-' + repeat + '/sigarra/' + level + '-ner-model.ser.gz\n'

file = re.sub(r'trainFile = .+\n','trainFile = ' + trainFile, file)
file = re.sub(r'serializeTo = .+\n','serializeTo = ' + serializeTo, file)

# output to file
f = open(filein, 'w')
f.write(file)
f.close()