r'''
    Module with the functions necessary to get models from the website ODEBase.

    The website (ODEBase)[https://www.odebase.org/] contains a list of models coming from 
    Biology and can be filtered in many different ways (being Rational, Polynomial, Mass Actions,
    etc.). Most of these models fits into the CLUE setting perfectly, since they all can be 
    represented by a dynamical system with polynomial or rational functions dynamics.

    The informtion to reconstruct these systems is in the website and can be obtained with
    a sequence of HTTP requests. This module provide an easy interface for importing models
    directly from the website.

    For further information on ODEBase, please check the following reference:
    Christoph Lüders, Thomas Sturm, Ovidiu Radulescu. ODEbase: A Repository of ODE Systems for 
    Systems Biology, Bioinformatics Advances 2(1):vbac027, 2022. 
    Open access at :doi:`10.1093/bioadv/vbac027`

    REMARK:

    The use of this module requires Internet connection.

    EXAMPLES::

        >>> from clue.odebase_io import ode_scrapper
        >>> ode_scrapper(rational=True, index=1)
        ODEBase 1326 (BIOMD0000000003) [FODESystem -- 19 -- Mul]
        >>> ode_scrapper(polynomial=True, index=0)
        ODEBase 1325 (BIOMD0000000002) [FODESystem -- 50 -- SparsePolynomial]
        >>> len(ode_scrapper(rational=False, polynomial=True))
        0
        >>> len(ode_scrapper(num_species=(None,5), num_parameters=(None,5), polynomial=True)) # long test (>1 min)
        13
        >>> ode_scrapper(id=1546).equations
        [k3*(k4 - x1**3/3 + x1 + x2), -(-k1 + k2*x2 + x1)/k3, 0, 0, 0, 0, 0]
        >>> ode_scrapper(id=1631).equations
        [(k1*k3 - k2*x1)/k3, (-k1*k3 + k2*x1)/k3, 0, 0, 0, 0]
'''
import io, logging, re, requests
from bs4 import BeautifulSoup
from clue import FODESystem, QQ, SparsePolynomial
from sympy.parsing.sympy_parser import auto_number, auto_symbol, factorial_notation, lambda_notation, parse_expr, repeated_decimals

logger = logging.getLogger(__name__)

def get_dictionary_of_variables(base_url: str, what: str, ref: str|int) -> dict[str,str]:
    if what in ('variables','species', 'var'):
        what = "species_map"
    elif what in ('parameters', 'parameter', 'par'):
        what = "parameter_map"
    else:
        raise ValueError("The argument 'what' must indicate either 'variables' or 'parameters'")
    
    response = requests.get(f"{base_url}/detail/{what}/{ref}/text")
    soup = BeautifulSoup(io.BytesIO(response.content), 'html.parser')
    output = dict()
    for line in soup.get_text().split("\n"):
        if "=" in line:
            in_var, out_var = line.split("=")
            output[in_var.strip()] = out_var.strip()
    
    return output

def get_odes(base_url: str, ref: str|int) -> dict[str,str]:
    response = requests.get(f"{base_url}/detail/odes/{ref}/sage")
    soup = BeautifulSoup(io.BytesIO(response.content), 'html.parser')
    
    import re
    
    variables = get_dictionary_of_variables(base_url, "var", ref)
    equations = {v : "0" for v in variables}
    
    for line in soup.get_text().split("\n"):
        line = line.removeprefix("[").removesuffix("]").strip()
        result = re.search(r"Eq\(Derivative\(([a-zA-Z0-9]+), t\), (.+)\)[,]?", line)
        var, value = result.groups()
        
        if not var in equations:
            raise ValueError(f"Found a variable ({var}) that was not in the species list")
        else:
            equations[var] = value
            
    return equations

def get_parameter_values(base_url: str, ref: str|int) -> dict[str, str]:
    response = requests.get(f"{base_url}/detail/parameters/{ref}/sage")
    soup = BeautifulSoup(io.BytesIO(response.content), 'html.parser')
    output = dict()
    for line in soup.get_text().split("\n"):
        if "=" in line:
            in_var, out_var = line.split("=")
            output[in_var.strip()] = out_var.strip()
    
    return output

def multireplace(string, replacements, ignore_case=False):
    """
    Given a string and a replacement map, it returns the replaced string.
    :param str string: string to execute replacements on
    :param dict replacements: replacement dictionary {value to find: value to replace}
    :param bool ignore_case: whether the match should be case insensitive
    :rtype: str
    """
    if not replacements:
        # Edge case that'd produce a funny regex and cause a KeyError
        return string
    
    # If case insensitive, we need to normalize the old string so that later a replacement
    # can be found. For instance with {"HEY": "lol"} we should match and find a replacement for "hey",
    # "HEY", "hEy", etc.
    if ignore_case:
        def normalize_old(s):
            return s.lower()

        re_mode = re.IGNORECASE

    else:
        def normalize_old(s):
            return s

        re_mode = 0

    replacements = {normalize_old(key): val for key, val in replacements.items()}
    
    # Place longer ones first to keep shorter substrings from matching where the longer ones should take place
    # For instance given the replacements {'ab': 'AB', 'abc': 'ABC'} against the string 'hey abc', it should produce
    # 'hey ABC' and not 'hey ABc'
    rep_sorted = sorted(replacements, key=len, reverse=True)
    rep_escaped = map(re.escape, rep_sorted)
    
    # Create a big OR regex that matches any of the substrings to replace
    pattern = re.compile("|".join(rep_escaped), re_mode)
    
    # For each match, look up the new string in the replacements, being the key the normalized old string
    return pattern.sub(lambda match: replacements[normalize_old(match.group(0))], string)

def custom_symbol(tokens, local_dict, _):
    return auto_symbol(tokens, local_dict, dict())

transformations = [lambda_notation, custom_symbol, repeated_decimals, auto_number, factorial_notation]

def get_clue(base_url: str, ref: str|int, name: str = None,
             transform_names: bool = True, polynomial: str = False, field = QQ
) -> FODESystem:
    variables = get_dictionary_of_variables(base_url, "var", ref)
    equations = get_odes(base_url, ref)
    parameters = get_dictionary_of_variables(base_url, "par", ref)
    parameter_values = get_parameter_values(base_url, ref)
    
    ## We transform the values into the given field
    parameter_values = {k : field(v) for (k,v) in parameter_values.items()}
    
    ## We merge the equations with equations for the parameters
    equations = equations | {par : "0" for par in parameters}
    
    ## We transform the names if necessary
    if transform_names:
        true_names = variables | parameters
        equations = {true_names[var] : multireplace(equ, true_names) for (var, equ) in equations.items()}
        parameter_values = {true_names[par] : value for (par, value) in parameter_values.items()}
    
    var_names = list(); equs = list()
    for (k,v) in equations.items():
        var_names.append(k); equs.append(v)
    return FODESystem(
        equations = [
            SparsePolynomial.from_string(equ, var_names,field) if polynomial else parse_expr(equ, transformations=transformations) 
            for equ in equs
            ], 
        variables = var_names,
        ic = parameter_values,
        name = f"ODEBase {ref}{f' ({name})' if name!=None else ''}"
    )

def ode_scrapper(*, 
                 polynomial: bool=None, rational:bool=None, 
                 num_species: int|tuple[int,int]=None, 
                 num_parameters: int|tuple[int,int]=None, 
                 num_constraints: int|tuple[int,int]=None,
                 deficiency: int|tuple[int,int]=None,
                 id: int = None,
                 name: str = None,
                 index: int = None,
                 translation: bool = False) -> FODESystem | list[FODESystem]:
    r'''
        Method to create the :class:`FODESystem` from an entry in the ODEBase Database.

        All arguments are named, meaning we need to provide them as keywords. They provide an 
        interface for filtering in the database. We return a list whenever there is more than one 
        system that satisfy all the criteria.

        The arguments can be as follows:

        * ``polynomial``: boolean value indicating whether the system is polynomial or not.
        * ``rational``: boolean value indicating whether the system is rational or not. Be aware that 
          any polynomial system is also rational, hence setting ``rational`` to ``False`` will also
          exclude all polynomial models.
        * ``num_species``: either a number or a pair of numbers indicating the range of the 
          number of species allowed in the system. The format ``(None, d)`` will return all models
          with number of species up to `d`, while ``(d, None)`` return the models with at least `d`
          species. A single value indicates an exact number of species derired.
        * ``num_parameters``: same as ``num_species`` but with the number of parameters of the system.
        * ``num_constrains``: same as ``num_species`` but with the number of constrains of the system.
        * ``deficiency``: same as ``num_species`` but with the number of deficiencies of the system.
        * ``id``: obtains the model with given ID if it has passed the other filters
        * ``index``: if obtained several models after filtering, it returns the given in that index.
        * ``translation``: models in ODEBase are usually defined with predefined names that are then 
          map to the real values of their corresponding meaning. This flag indicates if the obtained
          model must translate the names to the true names or not.
    '''
    # URL of the website to analyze
    base_url = "https://www.odebase.org"
    rational_url = f"is_rational={rational}" if rational != None else ""
    polynomial_url = f"is_polynomial={polynomial}" if polynomial != None else ""
    if isinstance(num_species, int):
        num_species = f"{num_species}"
    elif isinstance(num_species, tuple):
        num_species = f"{f'{num_species[0]}' if num_species[0] != None else ''}-{f'{num_species[1]}' if num_species[1] != None else ''}"
    if isinstance(num_parameters, int):
        num_parameters = f"{num_parameters}"
    elif isinstance(num_parameters, tuple):
        num_parameters = f"{f'{num_parameters[0]}' if num_parameters[0] != None else ''}-{f'{num_parameters[1]}' if num_parameters[1] != None else ''}"
    if isinstance(num_constraints, int):
        num_constraints = f"{num_constraints}"
    elif isinstance(num_constraints, tuple):
        num_constraints = f"{f'{num_constraints[0]}' if num_constraints[0] != None else ''}-{f'{num_constraints[1]}' if num_constraints[1] != None else ''}"
    if isinstance(deficiency, int):
        deficiency = f"{deficiency}"
    elif isinstance(deficiency, tuple):
        deficiency = f"{f'{deficiency[0]}' if deficiency[0] != None else ''}-{f'{deficiency[1]}' if deficiency[1] != None else ''}"
    num_species_url = f"num_species_range={num_species}" if num_species != None else ""
    num_parameters_url = f"num_parameters_range={num_parameters}" if num_parameters != None else ""
    num_constraints_url = f"num_constraints_range={num_constraints}" if num_constraints != None else ""
    deficiency_url = f"deficiency_range={deficiency}" if deficiency != None else ""
    url = f"{base_url}/table/?{'&'.join(el for el in [rational_url, polynomial_url, num_species_url, num_parameters_url, num_constraints_url, deficiency_url] if el != '')}"
    
    # Send an HTTP GET request to the website
    logger.debug("[scrap] Getting the list of Rational models...")
    response = requests.get(url)

    # Parse the HTML code using BeautifulSoup
    soup = BeautifulSoup(io.BytesIO(response.content), 'html.parser')

    # Extract the relevant information from the HTML code
    references = list()
    for row in soup.select('tbody tr'):
        all_tds = row.find_all("td")
        model_ref = all_tds[1].find("a")
        mod_name = model_ref.get_text()
        ref = int(model_ref.get("href").split("/")[-1]) # just the number
        is_polynomial = all_tds[8].get_text() == "Yes"
        references.append((mod_name, ref, is_polynomial))

    if index != None: # we only keep the indexed reference
        references = [references[index]]
    if id != None: # we only keep the given id
        references = [(mod_name, ref, is_poly) for (mod_name,ref,is_poly) in references if ref == id]
    if name != None: # we only keep the given name
        references = [(mod_name, ref, is_poly) for (mod_name,ref, is_poly) in references if mod_name == name]
    
        
    logger.debug(f"[scrap] Obtained {len(references)} models")
    logger.debug(f"[scrap] Processing each model...")
    output = list()
    for i,(name, ref, is_poly) in enumerate(references):
        logger.debug(f"[scrap] Processing model {name} ({i+1}/{len(references)})...")
        try:
            output.append(get_clue(base_url, ref, name=name, transform_names=translation, polynomial=is_poly))
        except (TypeError,ValueError): # We first try to simplify the reading
            try:
                output.append(get_clue(base_url, ref, name=name, transform_names=translation, polynomial=False))
            except (TypeError,ValueError):
                try:
                    output.append(get_clue(base_url, ref, name=name, transform_names=False, polynomial=is_poly))
                except (TypeError, ValueError):
                    try:
                        output.append(get_clue(base_url, ref, name=name, transform_names=False, polynomial=False))
                    except (TypeError, ValueError):
                        logger.error(f"[scrap] Found error while parsing model {name}.")
                        raise        
    logger.debug(f"[scrap] Finished execution")
    return output if len(output)!=1 else output[0]

__all__ = ["ode_scrapper"]