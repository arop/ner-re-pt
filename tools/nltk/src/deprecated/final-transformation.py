f = open('outputs/ready_docs.txt','r').read()

file_out = ""
for line in f.splitlines():
	tabs = line.split()
	if tabs[0] == '--DOCSTART--':
		file_out += '--DOCSTART--\n'
	elif tabs[0] == '--SENTENCE--':
		temp = list(file_out)
		temp[-1] = ')' #end last sentence
		file_out = "".join(temp)
		file_out += '\n(S\n' #begin new sentence
	elif not tabs[2] == 'O': #entity
		file_out += '(' + tabs[2] + ' ' + tabs[0] + '/' + tabs[1] + ')\n'
	else: #not entity
		file_out += tabs[0] + '/' + tabs[1] + '\n'

out = open('outputs/final_docs.txt','w')
out.write(file_out)
out.close()
