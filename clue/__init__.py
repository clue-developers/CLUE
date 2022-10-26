from .clue import *
from .parser import *

def clue_version():
    import pkg_resources; 
    return pkg_resources.get_distribution('clue').version