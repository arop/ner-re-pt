from lxml import etree
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
def filter_categories_alternatives(tree):
  for alternatives in tree.xpath("//EM[contains(@CATEG,'|')]"):
    alternatives.attrib['CATEG'] = alternatives.attrib['CATEG'].split('|')[0]
  for alternatives in tree.xpath("//EM[contains(@TIPO,'|')]"):
    alternatives.attrib['TIPO'] = alternatives.attrib['TIPO'].split('|')[0]
  for alternatives in tree.xpath("//EM[contains(@SUBTIPO,'|')]"):
    alternatives.attrib['SUBTIPO'] = alternatives.attrib['SUBTIPO'].split('|')[0]

def filter_alt_tags(tree):
  for alt in tree.xpath("//ALT"):
    if len(alt.findall('EM')) == 0:
      alt.text = alt.text.split('|')[0]
    else:
      temp_tail = alt.tail
      alt.tail = None
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
            print "Exception in: " + side
        side_len.append(len(s.findall('EM')))
      side_selected = sides_txt[side_len.index(max(side_len))] 

      try:
        side_elem = etree.fromstring("<ALT>"+side_selected+"</ALT>")
        side_elem.tail = temp_tail
        alt.getparent().replace(alt,side_elem)

      except: #happens with & (only once)
        print etree.tostring(side_elem)

  etree.strip_tags(tree, 'ALT')
