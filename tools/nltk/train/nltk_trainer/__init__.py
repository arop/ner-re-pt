import os, os.path, re, time
import nltk.data
from nltk.corpus.util import LazyCorpusLoader
from nltk_trainer.tagging.readers import NumberedTaggedSentCorpusReader

try:
	import cPickle as pickle
except ImportError:
	import pickle

try:
	from nltk.compat import iteritems
except ImportError:
	def iteritems(d):
		return d.iteritems()

try:
	basestring = basestring
except NameError:
	basestring = unicode = str

try:
	from nltk.tag.simplify import simplify_wsj_tag
except ImportError:
	simplify_wsj_tag = None

def dump_object(obj, fname, trace=1):
	dirname = os.path.dirname(fname)
	
	if dirname and not os.path.exists(dirname):
		if trace:
			print('creating directory %s' % dirname)
		
		os.makedirs(dirname)
	
	if trace:
		print('dumping %s to %s' % (obj.__class__.__name__, fname))
	
	f = open(fname, 'wb')
	pickle.dump(obj, f)
	f.close()

def load_model(path):
	try:
		return nltk.data.load(path)
	except LookupError:
		return pickle.load(open(os.path.expanduser(path)))

def import_attr(path):
	basepath, name = path.rsplit('.', 1)
	mod = __import__(basepath, globals(), locals(), [name])
	return getattr(mod, name)

def load_corpus_reader(corpus, reader=None, fileids=None, sent_tokenizer=None, word_tokenizer=None, **kwargs):
	if corpus == 'timit':
		# TODO: switch to universal
		return LazyCorpusLoader('timit', NumberedTaggedSentCorpusReader,
			'.+\.tags', tag_mapping_function=simplify_wsj_tag)
	
	real_corpus = getattr(nltk.corpus, corpus, None)
	
	if not real_corpus:
		if not reader:
			raise ValueError('you must specify a corpus reader')
		
		if not fileids:
			fileids = '.*'
		
		root = os.path.expanduser(corpus)
		
		if not os.path.isdir(root):
			if not corpus.startswith('corpora/'):
				path = 'corpora/%s' % corpus
			else:
				path = corpus
			
			try:
				root = nltk.data.find(path)
			except LookupError:
				raise ValueError('cannot find corpus path for %s' % corpus)
		
		if sent_tokenizer and isinstance(sent_tokenizer, basestring):
			print 'sent\n'
			kwargs['sent_tokenizer'] = nltk.data.load(sent_tokenizer)
		
		if word_tokenizer and isinstance(word_tokenizer, basestring):
			print 'tokenizer\n'
			kwargs['word_tokenizer'] = import_attr(word_tokenizer)()
		
		reader_cls = import_attr(reader)

		#############################
		#TEMP TO USE IN CONLL READER#
		#############################
		cat = ['ABSTRACCAO', 'OUTRO','LOCAL','ACONTECIMENTO','TEMPO','PESSOA','OBRA','ORGANIZACAO','VALOR','COISA']
		#############################
		types = ['ABSTRACCAO_IDEIA','LOCAL_HUMANO','ACONTECIMENTO_EVENTO','ACONTECIMENTO_EFEMERIDE','TEMPO_TEMPO_CALEND','PESSOA_POVO','PESSOA_INDIVIDUAL','OBRA_REPRODUZIDA','ABSTRACCAO_DISCIPLINA','PESSOA_GRUPOMEMBRO','ORGANIZACAO_INSTITUICAO','PESSOA_CARGO','OBRA_PLANO','ORGANIZACAO_ADMINISTRACAO','TEMPO_GENERICO','ABSTRACCAO_NOME','TEMPO_FREQUENCIA','LOCAL_FISICO','VALOR_QUANTIDADE','COISA_SUBSTANCIA','LOCAL_VIRTUAL','COISA_OBJECTO','PESSOA_GRUPOIND','ORGANIZACAO_EMPRESA','PESSOA_MEMBRO','COISA_CLASSE','ACONTECIMENTO_ORGANIZADO','TEMPO_DURACAO','VALOR_MOEDA','VALOR_CLASSIFICACAO','OBRA_ARTE','PESSOA_GRUPOCARGO','COISA_MEMBROCLASSE','ABSTRACCAO_ESTADO','ABSTRACCAO_','ORGANIZACAO_','OUTRO_','ACONTECIMENTO_','LOCAL_OUTRO','COISA_OUTRO']
		#############################
		subtypes = ['LOCAL_HUMANO_DIVISAO','TEMPO_TEMPO_CALEND_DATA','LOCAL_HUMANO_PAIS','OBRA_REPRODUZIDA_LIVRO','PESSOA_POVO_','LOCAL_HUMANO_REGIAO','TEMPO_TEMPO_CALEND_INTERVALO','LOCAL_FISICO_AGUACURSO','LOCAL_FISICO_AGUAMASSA','TEMPO_TEMPO_CALEND_HORA','LOCAL_FISICO_PLANETA','LOCAL_HUMANO_RUA','LOCAL_HUMANO_CONSTRUCAO','LOCAL_FISICO_OUTRO','LOCAL_VIRTUAL_SITIO','OBRA_REPRODUZIDA_PROGRAMA','ORGANIZACAO_INSTITUICAO_','LOCAL_HUMANO_OUTRO','OBRA_REPRODUZIDA_MUSICA','OBRA_REPRODUZIDA_OUTRO','ORGANIZACAO_INSTITUICAO_SUB','ORGANIZACAO_ADMINISTRACAO_','LOCAL_FISICO_REGIAO','ABSTRACCAO_IDEIA_','OBRA_ARTE_CONSTRUCAO','OBRA_ARTE_OUTRO','LOCAL_FISICO_RELEVO','ORGANIZACAO_ADMINISTRACAO_SUB','LOCAL_VIRTUAL_COMSOCIAL','ACONTECIMENTO_EFEMERIDE_','ACONTECIMENTO_EVENTO_','COISA_OBJECTO_','LOCAL_FISICO_ILHA','OBRA_PLANO_','OBRA_REPRODUZIDA_FILME','ORGANIZACAO_EMPRESA_','LOCAL_VIRTUAL_OBRA','ORGANIZACAO_EMPRESA_SUB','ACONTECIMENTO_ORGANIZADO_','OBRA_REPRODUZIDA_','LOCAL_VIRTUAL_OUTRO','OBRA_ARTE_','ABSTRACCAO_NOME_','TEMPO_DURACAO_','OBRA_REPRODUZIDA_TEATRO','OBRA_ARTE_PINTURA','OBRA_ARTE_EDIFICIO']
		#############################
		filtered = ['LOCAL','ACONTECIMENTO','TEMPO','PESSOA','ORGANIZACAO','VALOR']
		#############################
		sigarra = ['Pessoa','Organizacao','Localizacao','Curso','Data','Hora','Evento','UnidadeOrganica']
		########### HERE ############
		kwargs['chunk_types'] = filtered

		real_corpus = reader_cls(root, fileids, **kwargs)
	
	return real_corpus

# the major punct this doesn't handle are '"- but that's probably fine
spacepunct_re = re.compile(r'\s([%s])' % re.escape('!.,;:%?)}]'))
punctspace_re = re.compile(r'([%s])\s' % re.escape('{([#$'))

def join_words(words):
	'''
	>>> join_words(['Hello', ',', 'my', 'name', 'is', '.'])
	'Hello, my name is.'
	>>> join_words(['A', 'test', '(', 'for', 'parens', ')', '!'])
	'A test (for parens)!'
	'''
	return punctspace_re.sub(r'\1', spacepunct_re.sub(r'\1', ' '.join(words)))

if __name__ == '__main__':
	import doctest
	doctest.testmod()