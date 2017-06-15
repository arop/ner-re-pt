import sys

if len(sys.argv) > 3:
	level = sys.argv[1]
	repeat = sys.argv[2]
	fold = sys.argv[3]
	default = False
	if len(sys.argv) > 4:
		default = True
else:
	print "Usage: " + sys.argv[0] + " <repeat> <fold> [default]\n"
	sys.exit()


if default:
	one = open('repeat-'+repeat+'/ner-results/sigarra/fold-'+fold+'/out-'+level+'-default-iob.txt','r').read().splitlines()
else:
	one = open('repeat-'+repeat+'/ner-results/sigarra/fold-'+fold+'/out-'+level+'-iob.txt','r').read().splitlines()

two = open('repeat-'+repeat+'/sigarra/fold-'+fold+'/t_sigarra_test-iob.txt','r').read().splitlines()

i = 0
for i,line in enumerate(one):
	if not line.split()[0] == two[i].split()[0]:
		print "ERROR: " + line.split()[0] + " vs. " + two[i].split()[0] + " | line: " + str(i)
		print "Repeat: " + repeat + " - - fold: " + fold
		break
	i += 1
