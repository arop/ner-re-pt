import os

data_path = "../../brat/data/sigarra-corpus-csv"

#FLUP,FAUP,FEUP,FMUP,FCUP,FPCEUP,SPUP,FADEUP,ICBAS,FDUP,FBAUP,FEP,FCNAUP,FFUP,REITORIA,FMDUP,UP
entity_tags = ["Pessoa","Organizacao","Localizacao","Curso","Data","Hora","Evento","UnidadeOrganica"]

total_entities = dict([(e,0) for e in entity_tags])
total_avg_chars = []

# list organic units
for uo_dir in os.listdir(data_path):
	if os.path.isdir(data_path + '/' + uo_dir):
		entity_count = dict([(e,0) for e in entity_tags])
		number_chars = []

		# list ann files
		for file in os.listdir(os.path.join(data_path, uo_dir)):

			if file.endswith(".ann"):
				f = open(os.path.join(data_path, uo_dir, file), 'r')
				entities = []

				# append all entity tags
				for l in f.readlines():
					entities.append(l.split()[1])

				f.close()

				for ent in entity_tags:
					entity_count[ent] = entity_count[ent] + entities.count(ent)
					total_entities[ent] = total_entities[ent] + entities.count(ent)

			elif file.endswith(".txt"):
				f = open(os.path.join(data_path, uo_dir, file), 'r')
				number_chars.append(len(f.read()))
				f.close()

		avg_chars = (sum(number_chars)/len(number_chars))
		total_avg_chars.append(avg_chars)
		print uo_dir, avg_chars, entity_count

print (sum(total_avg_chars)/len(total_avg_chars)), total_entities