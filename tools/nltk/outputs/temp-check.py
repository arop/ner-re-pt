tagged = open('tagged','r').read().decode('ISO-8859-1')
#tokenized = open('tokenized.txt','r').read().decode('ISO-8859-1').splitlines()

temp = ""
for line in tagged.splitlines():
	line = line.split('\t')[0]
	temp += line + "\n"

f = open('temp-tagged.txt','w')
f.write(temp.encode('ISO-8859-1'))
f.close()