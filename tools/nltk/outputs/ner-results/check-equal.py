import sys

if len(sys.argv) > 1:
	level = sys.argv[1]
	fold = sys.argv[2]
else:
	print "Usage: " + sys.argv[0] + " <level> <fold>\n"
	sys.exit()

two = open('fold-'+fold+'/out-'+level+'-gold.txt','r').read().decode('ISO-8859-1').splitlines()

for a in ['DT','ME','NB']:
	one = open('fold-'+fold+'/out-'+level+'-'+a+'.txt','r').read().decode('UTF-8').splitlines()

	i = 0
	for i,line in enumerate(one):
		if not line.split()[0] == two[i].split()[0]:
			print "ERROR: " + line.split()[0] + " vs. " + two[i].split()[0] + " | line: " + str(i)
			print "Fold: " + fold + " | Level: " + level
			break
		i += 1
