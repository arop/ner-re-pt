from lxml import etree
###################################
## REMOVE UNNECESSARY CATEGORIES ##
###################################
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

def filter_dataset(tree):
  categorias = ['OBRA','COISA','ABSTRACCAO','OUTRO']
  tipos = ['CARGO','GRUPOCARGO','GRUPOMEMBRO','MEMBRO','GRUPOIND','POVO', 'EFEMERIDE','VIRTUAL']
  subtipos = ['REGIAO','OUTRO','AGUAMASSA','AGUACURSO','RELEVO','PLANETA','ADMINISTRACAO']

  for cat in categorias:
    strip_tags_attr_contains(tree,'EM','CATEG',cat)

  for t in tipos:
    strip_tags_attr_contains(tree,'EM','TIPO',t)

  for st in subtipos:
    strip_tags_attr_contains(tree,'EM','SUBTIPO',st)

#######################################
########## SELECT TYPES ONLY ##########
#######################################
# change categories to types, when there is none, strip entity
def filter_types(tree):
  for el in tree.iterfind("//EM"):
    if('TIPO' in el.attrib):
      el.attrib['CATEG'] = el.attrib['CATEG'] + '_' + el.attrib['TIPO']
    else:
      el.tag = "to_strip"
  etree.strip_tags(tree,'to_strip')

#######################################
######## SELECT SUBTYPES ONLY #########
#######################################
# change categories to subtypes, when there is none, strip entity
def filter_subtypes(tree):
  for el in tree.iterfind("//EM"):
    if('SUBTIPO' in el.attrib):
      el.attrib['CATEG'] = el.attrib['CATEG'] + '_' + el.attrib['TIPO'] + '_' + el.attrib['SUBTIPO']
    else:
      el.tag = "to_strip"
  etree.strip_tags(tree,'to_strip')

#######################################
######## STRIP INSIDE OMITIDO #########
#######################################
def strip_inside_omitido(tree):
  for el in tree.iterfind("//OMITIDO"):
    etree.strip_tags(el,'EM')