from lxml import etree

out_path = "../outputs/"
only_cat_path = out_path + "harem-only-categories.xml"
only_types_path = out_path + "harem-only-types.xml"
only_subtypes_path = out_path + "harem-only-subtypes.xml"
filtered_path = out_path + "harem-filtered.xml"

paths = [only_cat_path,only_types_path,only_subtypes_path,filtered_path]

all_categs = []
for p in paths:
	tree = etree.parse(p)
	categs = []
	for el in tree.xpath('//EM'):
		if el.get('CATEG') not in categs:
			categs.append(el.get('CATEG'))
	all_categs.append(categs)

i = 0
for cat in all_categs:
	file = "---\n:input:\n"
	for c in cat:
		if c is not None:
			file += "  " + str(c) + ": :" + str(c) + "\n"
	file += ":output:\n"
	file += "  :default: O\n"
	for c in cat:
		if c is not None:
			file += "  :" + str(c) + ": :" + str(c) + "\n"

	i += 1
	if i == 1:
		name = "cats.yml"
	elif i == 2:
		name = "types.yml"
	elif i == 3:
		name = "subtypes.yml"
	elif i == 4:
		name = "filtered.yml"
	else: 
		name = "error"
	# output to file
	f = open("ymls/"+name,'w')
	f.write(file)
	f.close()
