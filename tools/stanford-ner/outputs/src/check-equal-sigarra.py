import sys

if len(sys.argv) > 2:
	level = sys.argv[1]
	repeat = sys.argv[2]
	default = False
	if len(sys.argv) > 3:
		default = True
else:
	print "Usage: " + sys.argv[0] + " <level> <repeat>\n"
	sys.exit()

if default:
	one = open('repeat-'+repeat+'/ner-results/sigarra/out-'+level+'-default-iob.txt','r').read().splitlines()
else:
	one = open('repeat-'+repeat+'/ner-results/sigarra/out-'+level+'-iob.txt','r').read().splitlines()

two = open('repeat-'+repeat+'/sigarra/t_sigarra_test-iob.txt','r').read().splitlines()

i = 0
for i,line in enumerate(one):
	if not line.split()[0] == two[i].split()[0]:
		print "ERROR: " + line.split()[0] + " vs. " + two[i].split()[0] + " | line: " + str(i)
		print "Level: " + level
		break
	i += 1
