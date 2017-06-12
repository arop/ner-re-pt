from lxml import etree

tree = etree.parse('sigarra-news-corpus.xml')

temp_total_with_data = 0

for el in tree.iterfind("//DOC"):
	for em in el.iter("EM"):
		if em.attrib["CATEG"] == "Data":
			temp_total_with_data += 1
			break


print temp_total_with_data