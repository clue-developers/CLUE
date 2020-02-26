from sympy.parsing.sympy_parser import parse_expr

def read_polys(filename, ring, subs_params=dict()):
    """
    Reads a list of polynomials from ring from a file called filename
    """
    polys = []
    with open(filename) as f:
        for line in f:
            for param, val in subs_params.items():
                line = line.replace(param, val)
            monoms = line.split("+")
            p = ring(0)
            for m in monoms:
                p += ring(parse_expr(m))
            polys.append(p)

    return polys
