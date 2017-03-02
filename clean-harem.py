try:
  from lxml import etree
  print("running with lxml.etree")
except ImportError:
  try:
    # Python 2.5
    import xml.etree.cElementTree as etree
    print("running with cElementTree on Python 2.5+")
  except ImportError:
    try:
      # Python 2.5
      import xml.etree.ElementTree as etree
      print("running with ElementTree on Python 2.5+")
    except ImportError:
      try:
        # normal cElementTree install
        import cElementTree as etree
        print("running with cElementTree")
      except ImportError:
        try:
          # normal ElementTree install
          import elementtree.ElementTree as etree
          print("running with ElementTree")
        except ImportError:
          print("Failed to import ElementTree from any known place")

######################################

harem_filename = "datasets/dataset-harem-2.xml"
tree = etree.parse(harem_filename)
etree.tostring(tree)

##################################
#REMOVE UNNECESSARY CATEGORIES ###
##################################
#strip tags with attr=attrvalue, by renaming its tag
def strip_tags_attr(tree,tag,attr,attrvalue):
  deltag ="strip_me"
  for el in tree.iterfind("//"+str(tag)+"[@"+str(attr)+"='"+str(attrvalue)+"']"):
      el.tag = deltag
  etree.strip_tags(tree, deltag)

#strip tags with attr=%attrvalue%, by renaming its tag
def strip_tags_attr_contains(tree,tag,attr,attrvalue):
  deltag ="strip_me"
  for el in tree.xpath("//"+str(tag)+"[contains(@"+str(attr)+",'"+str(attrvalue)+"')]"):
      el.tag = deltag
  etree.strip_tags(tree, deltag)


categorias = ['OBRA','COISA','ABSTRACCAO','OUTRO']
tipos = ['CARGO','GRUPOCARGO','GRUPOMEMBRO','MEMBRO','GRUPOIND','POVO', 'EFEMERIDE','VIRTUAL']
subtipos = ['REGIAO','OUTRO','AGUAMASSA','AGUACURSO','RELEVO','PLANETA','ADMINISTRACAO']

for cat in categorias:
  strip_tags_attr_contains(tree,'EM','CATEG',cat)

for t in tipos:
  strip_tags_attr_contains(tree,'EM','TIPO',t)

for st in subtipos:
  strip_tags_attr_contains(tree,'EM','SUBTIPO',st)


######################################################
#remove attributes
# http://stackoverflow.com/questions/2720396/how-to-remove-attribute-of-a-etree-element
def remove_attrib(tree,attr):
  for el in tree.iter():
    el.attrib.pop(attr, None)

attr_name = ['TIPO','SUBTIPO','COREL','TIPOREL','ID','COMENT']
for at in attr_name:
  remove_attrib(tree,at)

# remove elements OMITIDO, check livro HAREM pag 109, secao 5.6.1.3
etree.strip_elements(tree,'OMITIDO')


###############################
## DEAL WITH ALT TAG ##########

#select first part of alt tag when there are no EM in it
#select part where there is a tag if there are no tags in the other part
#select part where there are the least amount of EM tags, when there is EM tags in each side
# NOTE: there are ALT with more than 2 sides

#http://stackoverflow.com/questions/4624062/get-all-text-inside-a-tag-in-lxml
def stringify_children(node):
    from lxml.etree import tostring
    from itertools import chain
    parts = ([node.text] +
            list(chain(*([tostring(c, with_tail=False), c.tail] for c in node.getchildren()))) +
            [node.tail])
    # filter removes possible Nones in texts and tails
    return ''.join(filter(None, parts))


#select first alternative when multiple categories occur
for alternatives in tree.xpath("//EM[contains(@CATEG,'|')]"):
  alternatives.attrib['CATEG'] = alternatives.attrib['CATEG'].split('|')[0]

for alt in tree.xpath("//ALT"):
  if len(alt.findall('EM')) == 0:
    alt.text = alt.text.split('|')[0]
  else:
    sides_txt = stringify_children(alt).split('|')

    side_len = []
    for side in sides_txt:
      	try:
        	side = "<ALT>"+side+"</ALT>"
        	s = etree.fromstring(side)
      	except: #happens with & (only once)
      		if "&" in side:
      			side = side.replace('&',"&amp;")
      			s = etree.fromstring(side)
      		else:
      			print side
    	side_len.append(len(s.findall('EM')))

    side_selected = sides_txt[side_len.index(max(side_len))] 

    try:
      side_elem = etree.fromstring("<ALT>"+side_selected+"</ALT>")
      alt.getparent().replace(alt,side_elem)
    except: #happens with & (only once)
      print side_elem

etree.strip_tags(tree, 'ALT')

# output to file
f = open('harem-clean.xml','w')
f.write(etree.tostring(tree, encoding="ISO-8859-1"))
f.close()
