import sys

if len(sys.argv) > 1:
	repeat = sys.argv[1]
else:
	print "Usage: " + sys.argv[0] + " <repeat>\n"
	sys.exit()

one = open('repeat-'+repeat+'/sigarra/sigarra.txt','r').read().splitlines()
two = open('repeat-'+repeat+'/sigarra/out-sigarra-gold.txt','r').read().splitlines()

i = 0
for i,line in enumerate(one):
	if not line.split()[0] == two[i].split()[0]:
		print "ERROR: " + line.split()[0] + " vs. " + two[i].split()[0] + " | line: " + str(i)
		break
	i += 1
