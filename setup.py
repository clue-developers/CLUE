## -*- encoding: utf-8 -*-
from setuptools import setup
from codecs import open # To open the README file with proper encoding

# Get information from separate files (README, VERSION)
def readfile(filename):
    with open(filename,  encoding='utf-8') as f:
        return f.read()
    
def requirements():
    with open("./requirements.txt", "r", encoding='utf-8') as f:
        return f.readlines()
    
setup(
    name = "CLUE",
    version = "1.7.2", # the VERSION file is shared with the documentation  ## readfile("VERSION").strip(),
    description='Constrained LUmping for differential Equations',
    # long_description = readfile("README.txt"), # get the long description from the README
    # For a Markdown README replace the above line by the following two lines:
    long_description = readfile("README.md"),
    long_description_content_type="text/markdown",
    url='https://github.com/clue-developers/CLUE',
    author = "CLUE Developers (Gleb Pogudin and Antonio Jiménez-Pastor)",
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
      'Programming Language :: Python :: 3.10',
    ], # classifiers list: https://pypi.python.org/pypi?%3Aaction=list_classifiers
    keywords = "lumping differential system",
    packages =  ["clue"],
    setup_requires   = [],
    install_requires = requirements(),
    extras_require = {"lint": ["pylint", "black"], "test": ["pytest"], "dev": ["pylint", "black", "pytest"]},
)
    
