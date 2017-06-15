import sys

if(len(sys.argv) > 1):
	tool = sys.argv[1]
	classifier = False
	default10fold = False

	if(len(sys.argv) > 2):
		classifier = sys.argv[2]
		if(len(sys.argv) > 3):
			default10fold = True
else:
	print "Usage: python " + sys.argv[0] + " <tool> [classifier]\n"
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

def get_accuracy_10fold(str):
	chunks = str.split()
	out = []

	out.append(("accuracy",float( chunks[9] )))
	out.append(("precision",float( chunks[1] )))
	out.append(("recall",float( chunks[3] )))
	out.append(("FB1",float( chunks[5] )))
	out.append(("M_FB1",float( chunks[7] )))
	return out

def get_level_result_10fold(str):
	chunks = str.split()
	out = []
	cats = chunks[8]

	out.append(("category", chunks[8] ))
	out.append(("precision",float( chunks[1] )))
	out.append(("recall",float( chunks[3] )))
	out.append(("FB1",float( chunks[5] )))
	out.append(("M_FB1",float( chunks[7] )))
	return out, cats

#####################################

results_files = []
for r in range(4):
	if classifier == "default":
		f = open('../results/' + tool + '/repeat-' + str(r) + '/sigarra/sigarra-'+classifier+'.txt', 'r')
	elif classifier == "10fold":
		if default10fold:
			f = open('../results/' + tool + '/repeat-' + str(r) + '/sigarra/avg/sigarra-default-avg.txt', 'r')
		else:	
			f = open('../results/' + tool + '/repeat-' + str(r) + '/sigarra/avg/sigarra-avg.txt', 'r')

	else:
		f = open('../results/' + tool + '/repeat-' + str(r) + '/sigarra/sigarra.txt', 'r')
	results_files.append(f.read())
	f.close()


results = []
cats = []
for results_file in results_files:
	if classifier == "10fold":
		lines = results_file.splitlines()
	else:
		lines = results_file.splitlines()[1:]
	result = []

	if classifier == "10fold":
		result.append(get_accuracy_10fold(lines[0]))
	else:
		result.append(get_accuracy(lines[0]))

	for line in lines[1:]:
		if classifier == "10fold":
			l = get_level_result_10fold(line)
		else:
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
			cats[name][1].append(result[cat+1][2][1]) # get r
			cats[name][2].append(result[cat+1][3][1]) # get fb1
		except IndexError:
			#print "One fold (" + str(i) + ") does not have all categories!"
			continue #already dealt with

avg_g_acc = get_avg(g_acc)
avg_g_p = get_avg(g_p)
avg_g_r = get_avg(g_r)
avg_g_fb1 = get_avg(g_fb1)

if (avg_g_p + avg_g_r) == 0.0:
	avg_g_m_fb1 = 0.0
else:	
	avg_g_m_fb1 = 2 * (avg_g_p * avg_g_r) / (avg_g_p + avg_g_r)


to_file = ""

to_file += "precision: {:04.2f}".format(avg_g_p) 
to_file += "\trecall: {:04.2f}".format(avg_g_r) 
to_file += "\tFB1: {:04.2f}".format(avg_g_fb1) 
to_file += "\tM_FB1: {:04.2f}".format(avg_g_m_fb1)
to_file += "\taccuracy: {:04.2f}".format(avg_g_acc) + '\n'

for cat in cats:
	precision = get_avg(cats[cat][0])
	recall = get_avg(cats[cat][1])
	fb1 = get_avg(cats[cat][2])

	if (precision + recall) == 0.0:
		m_fb1 = 0.0
	else:
		m_fb1 = 2 * (precision * recall) / (precision + recall)

	to_file += "precision: {:05.2f}".format(precision) 
	to_file += "\trecall: {:05.2f}".format(recall) 
	to_file += "\tFB1: {:05.2f}".format(fb1) 
	to_file += "\tMFB1: {:05.2f}".format(m_fb1) 
	to_file += '\t' + cat + '\n'


if classifier == "default":
	f = open('../results/' + tool + '/avg/sigarra/sigarra-avg-'+classifier+'.txt', 'w')
elif classifier == "10fold":
	if default10fold:
		f = open('../results/' + tool + '/avg/sigarra-10fold/sigarra-default-avg.txt', 'w')
	else:
		f = open('../results/' + tool + '/avg/sigarra-10fold/sigarra-avg.txt', 'w')
else:
	f = open('../results/' + tool + '/avg/sigarra/sigarra-avg.txt', 'w')
f.write(to_file)
f.close()

