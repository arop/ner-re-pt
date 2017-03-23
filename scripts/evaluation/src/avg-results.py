import sys

if(len(sys.argv) > 3):
  tool = sys.argv[1]
  level = sys.argv[2]
  repeat = sys.argv[3]
else:
  print "Usage: python " + sys.argv[0] + " <tool> <level> <repeat>\n"
  sys.exit()


def get_avg(l):
	if len(l) == 0:
		return 0.0
	return reduce(lambda x, y: x + y, l) / float(len(l))

def get_accuracy(str):
	chunks = str.split()
	out = []

	out.append(("accuracy",float( chunks[1][:-2] )))
	out.append(("precision",float( chunks[3][:-2] )))
	out.append(("recall",float( chunks[5][:-2] )))
	out.append(("FB1",float( chunks[7] )))
	return out

def get_level_result(str):
	chunks = str.split()
	out = []
	cats = chunks[0][:-1]

	out.append(("category", chunks[0][:-1] ))
	out.append(("precision",float( chunks[2][:-2] )))
	out.append(("recall",float( chunks[4][:-2] )))
	out.append(("FB1",float( chunks[6] )))
	return out, cats

#####################################

results_files = []
for i in range(10):
	f = open('../results/' + tool + '/repeat-' + repeat + '/fold-' + str(i) + '/' + level + '.txt', 'r')
	results_files.append(f.read())
	f.close()


results = []
cats = []
for results_file in results_files:
	lines = results_file.splitlines()[1:]
	result = []
	result.append(get_accuracy(lines[0]))

	for line in lines[1:]:
		l = get_level_result(line)
		result.append(l[0])
		cats.append(l[1])

	results.append(result)

cats = list(set(cats))

##########
## AVGs ##

g_acc = []
g_p = []
g_r = []
g_fb1 = []

cats = dict([(i , [[],[],[]]) for i in cats])

for result in results:
	acc_line = result[0]

	g_acc.append(acc_line[0][1]) # get accuracy value
	g_p.append(acc_line[1][1]) # get p value
	g_r.append(acc_line[2][1]) # get r value
	g_fb1.append(acc_line[3][1]) # get fb1 value

	for cat in range(len(cats)):
		try:
			name = result[cat+1][0][1]
			#cats[name][0] = result[cat+1][0][1] # get category name
			cats[name][0].append(result[cat+1][1][1]) # get p
			cats[name][1].append(result[cat+1][2][1]) # get p
			cats[name][2].append(result[cat+1][3][1]) # get p
		except IndexError:
			#print "One fold (" + str(i) + ") does not have all categories!"
			continue #already dealt with

avg_g_acc = get_avg(g_acc)
avg_g_p = get_avg(g_p)
avg_g_r = get_avg(g_r)
avg_g_fb1 = get_avg(g_fb1)

to_file = ""

to_file += "precision: {:04.2f}".format(avg_g_p) 
to_file += "\trecall: {:04.2f}".format(avg_g_r) 
to_file += "\tFB1: {:04.2f}".format(avg_g_fb1) 
to_file += "\taccuracy: {:04.2f}".format(avg_g_acc) + '\n'

for cat in cats:
	to_file += "precision: {:05.2f}".format(get_avg(cats[cat][0])) 
	to_file += "\trecall: {:05.2f}".format(get_avg(cats[cat][1])) 
	to_file += "\tFB1: {:05.2f}".format(get_avg(cats[cat][2])) 
	to_file += '\t' + cat + '\n'

f = open('../results/' + tool + '/repeat-' + repeat + '/avg/' + level + '-avg.txt', 'w')
f.write(to_file)
f.close()

