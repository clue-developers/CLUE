## -*- encoding: utf-8 -*-
from setuptools import setup
from codecs import open # To open the README file with proper encoding

# Get information from separate files (README, VERSION)
def readfile(filename):
    with open(filename,  encoding='utf-8') as f:
        return f.read()
    
setup(
    name = "CLUE",
    version = "0.0", # the VERSION file is shared with the documentation  ## readfile("VERSION").strip(),
    description='Constrained LUmping for differential Equations',
    # long_description = readfile("README.txt"), # get the long description from the README
    # For a Markdown README replace the above line by the following two lines:
    long_description = readfile("README.md"),
    long_description_content_type="text/markdown",
    url='https://github.com/pogudingleb/CLUE',
    author = "Gleb Pogudin",
    author_email = "gleb.pogudin@polytechnique.edu",
    license = "GPLv3+", # See LICENSE file
    classifiers=[
      # How mature is this project? Common values are
      #   3 - Alpha
      #   4 - Beta
      #   5 - Production/Stable
      'Development Status :: 4 - Beta',
      'Intended Audience :: Science/Research',
      'Topic :: Software Development :: Build Tools',
      'Topic :: Scientific/Engineering :: Mathematics',
      'License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)',
      'Programming Language :: Python :: 3.8.5',
    ], # classifiers list: https://pypi.python.org/pypi?%3Aaction=list_classifiers
    keywords = "lumping differential system",
    packages = ["clue"],
    setup_requires   = [],
    install_requires = ['sympy >= 1.9', 'pyparsing', 'natsort'],
)
    
