import sys

if len(sys.argv) > 2:
	repeat = sys.argv[1]
	classifier = sys.argv[2]
else:
	print "Usage: " + sys.argv[0] + " <repeat>\n"
	sys.exit()

one = open('repeat-'+repeat+'/ner-results/sigarra/out-sigarra-'+classifier+'.txt','r').read().decode('UTF-8').splitlines()
two = open('repeat-'+repeat+'/sigarra/out-sigarra-gold.txt','r').read().decode('UTF-8').splitlines()

i = 0
for i,line in enumerate(one):
	if not line.split()[0] == two[i].split()[0]:
		print "ERROR: " + line.split()[0] + " vs. " + two[i].split()[0] + " | line: " + str(i)
		break
	i += 1
