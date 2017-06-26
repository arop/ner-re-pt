import sys

if len(sys.argv) > 2:
	repeat = sys.argv[1]
	fold = sys.argv[2]
	default = False
	if len(sys.argv) > 3:
		default = True
else:
	print "Usage: " + sys.argv[0] + " <repeat> <fold> [default]\n"
	sys.exit()

if default:
	one = open('repeat-'+repeat+'/ner-results/sigarra/fold-'+fold+'/out-sigarra-default.txt','r').read().splitlines()
else:
	one = open('repeat-'+repeat+'/ner-results/sigarra/fold-'+fold+'/out-sigarra.txt','r').read().splitlines()
two = open('repeat-'+repeat+'/ner-results/sigarra/fold-'+fold+'/out-sigarra-gold.txt','r').read().splitlines()

i = 0
for i,line in enumerate(one):
	if not line.split()[0] == two[i].split()[0]:
		print "ERROR: " + line.split()[0] + " vs. " + two[i].split()[0] + " | line: " + str(i)
		print "Repeat: " + repeat + " - - fold: " + fold
		break
	i += 1
