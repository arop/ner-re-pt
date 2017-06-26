import sys

if len(sys.argv) > 1:
	repeat = sys.argv[1]
	default = False
	if len(sys.argv) > 2:
		default = True
else:
	print "Usage: " + sys.argv[0] + " <repeat>\n"
	sys.exit()

if default:
	one = open('repeat-'+repeat+'/sigarra/sigarra-default.txt','r').read().splitlines()
	two = open('repeat-'+repeat+'/sigarra/out-sigarra-default-gold.txt','r').read().splitlines()
else:
	one = open('repeat-'+repeat+'/sigarra/sigarra.txt','r').read().splitlines()
	two = open('repeat-'+repeat+'/sigarra/out-sigarra-gold.txt','r').read().splitlines()

i = 0
for i,line in enumerate(one):
	if not line.split()[0] == two[i].split()[0]:
		print "ERROR: " + line.split()[0] + " vs. " + two[i].split()[0] + " | line: " + str(i)
		break
	i += 1
