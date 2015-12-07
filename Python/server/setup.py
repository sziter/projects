try:
	from setuptools import setup
except ImportError:
	from distutils.core import setup

config = {
	'description': 'My Description',
	'author': 'My Name',
	'url': '',
	'download_url': '',
	'author_email': '',
	'version': '',
	'install_requires': ['nose'],
	'packages': ['NAME'],
	'scripts': [],
	'name': 'projectname'
}

setup(**config)
