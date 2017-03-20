import sys

if(len(sys.argv) > 1):
  tool = sys.argv[1]
  level = sys.argv[2]
else:
  print "Usage: python " + sys.argv[0] + " <tool> <level>\n"
  sys.exit()


def get_avg(l):
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

	out.append(("category", chunks[0][:-1] ))
	out.append(("precision",float( chunks[2][:-2] )))
	out.append(("recall",float( chunks[4][:-2] )))
	out.append(("FB1",float( chunks[6] )))
	return out

#####################################

results_files = []
for i in range(10):
	f = open('../results/' + tool + '/fold-' + str(i) + '/' + level + '.txt', 'r')
	results_files.append(f.read())
	f.close()


results = []
for results_file in results_files:
	lines = results_file.splitlines()[1:]
	result = []
	result.append(get_accuracy(lines[0]))

	for line in lines[1:]:
		result.append(get_level_result(line))

	results.append(result)

##########
## AVGs ##

g_acc = []
g_p = []
g_r = []
g_fb1 = []

n_cats = len(results[0][1:])
cats = [["",[],[],[]] for i in range(n_cats)]

for result in results:
	acc_line = result[0]

	g_acc.append(acc_line[0][1]) # get accuracy value
	g_p.append(acc_line[1][1]) # get p value
	g_r.append(acc_line[2][1]) # get r value
	g_fb1.append(acc_line[3][1]) # get fb1 value

	for cat in range(n_cats):
		try:
			cats[cat][0] = result[cat+1][0][1] # get category name
			cats[cat][1].append(result[cat+1][1][1]) # get p
			cats[cat][2].append(result[cat+1][2][1]) # get p
			cats[cat][3].append(result[cat+1][3][1]) # get p
		except IndexError:
			print "One fold does not have all categories!"


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
	to_file += "precision: {:05.2f}".format(get_avg(cat[1])) 
	to_file += "\trecall: {:05.2f}".format(get_avg(cat[2])) 
	to_file += "\tFB1: {:05.2f}".format(get_avg(cat[3])) 
	to_file += '\t' + cat[0] + '\n'

f = open('../results/' + tool + '/avg/' + level + '-avg.txt', 'w')
f.write(to_file)
f.close()

