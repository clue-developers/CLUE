import logging, sys

## Configuring logger for this package
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
formatter = logging.Formatter(
    "%(asctime)s %(levelname)-8s %(message)s", datefmt="%Y-%m-%d %H:%M:%S"
)
fh = logging.FileHandler("clue.log")
ch = logging.StreamHandler(sys.stderr)
fh.setFormatter(formatter)
ch.setFormatter(formatter)
logger.addHandler(fh)
logger.addHandler(ch)
logger.propagate = False
# logger.setLevel(logging.DEBUG) # setting up a level for logging

# importing the main module of CLUE
from .linalg import *
from .rational_function import *
from .clue import *
from .uncertain import *
from .odebase_io import *
from .simulations import *


def clue_version():
    import pkg_resources

    return pkg_resources.get_distribution("clue").version
