import re
import sys

if(len(sys.argv) > 3):
	filein = sys.argv[1]
	fileout = sys.argv[2]
	cats = sys.argv[3]
	if cats not in ['harem','sigarra','harem-gold','sigarra-gold']:
		print "Usage: python " + sys.argv[0] + " <in> <out> <harem|sigarra>\n"
		sys.exit()
else:
	print "Usage: python " + sys.argv[0] + " <in> <out> <harem|sigarra>\n"
	sys.exit()

f = open(filein, 'r')
file = f.read()
f.close()

#############################
###### SET CATEGORIES #######

cat_remove = ['ABSTRACCAO', 'OUTRO','ACONTECIMENTO','TEMPO','OBRA','VALOR','COISA']
sigs_remove = ['Curso','Evento','UnidadeOrganica','Data','Hora']

# HAREM to SIGARRA
if cats == "harem":
	file = re.sub(r'(B|I)-PESSOA',r'\1-Pessoa', file)
	file = re.sub(r'(B|I)-LOCAL',r'\1-Localizacao', file)
	file = re.sub(r'(B|I)-ORGANIZACAO',r'\1-Organizacao', file)
	#remove others
	for ent in cat_remove:
		file = re.sub(r'(B|I)-'+ent,r'O', file)

# SIGARRA to HAREM
elif cats == "sigarra":
	file = re.sub(r'(B|I)-Pessoa',r'\1-PESSOA', file)
	file = re.sub(r'(B|I)-Localizacao',r'\1-LOCAL', file)
	file = re.sub(r'(B|I)-Organizacao',r'\1-ORGANIZACAO', file)
	#remove others
	for ent in sigs_remove:
		file = re.sub(r'(B|I)-'+ent,r'O', file)

elif cats == "sigarra-gold":
	for ent in sigs_remove:
		file = re.sub(r'(B|I)-'+ent,r'O', file)
elif cats == "harem-gold":
	for ent in cat_remove:
		file = re.sub(r'(B|I)-'+ent,r'O', file)

f = open(fileout, 'w')
f.write(file)
f.close()


# cat = ['ABSTRACCAO', 'OUTRO','LOCAL','ACONTECIMENTO','TEMPO','PESSOA','OBRA','ORGANIZACAO','VALOR','COISA']
# sigarra = ['Pessoa','Organizacao','Localizacao','Curso','Data','Hora','Evento','UnidadeOrganica']