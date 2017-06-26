import sys

if len(sys.argv) > 3:
	repeat = sys.argv[1]
	classifier = sys.argv[2]
	fold = sys.argv[3]
else:
	print "Usage: " + sys.argv[0] + " <repeat> <classifier> <fold>\n"
	sys.exit()

one = open('repeat-'+repeat+'/ner-results/sigarra/fold-'+fold+'/out-sigarra-'+classifier+'.txt','r').read().decode('UTF-8').splitlines()
two = open('repeat-'+repeat+'/sigarra/fold-'+fold+'/out-sigarra-gold.txt','r').read().decode('UTF-8').splitlines()

i = 0
for i,line in enumerate(one):
	if not line.split()[0] == two[i].split()[0]:
		print "ERROR: " + line.split()[0] + " vs. " + two[i].split()[0] + " | line: " + str(i)
		print "Repeat: " + repeat + " - - fold: " + fold
		break
	i += 1
