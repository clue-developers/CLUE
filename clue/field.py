class RR:
    def __init__(self):
        self.zero = 0.0
        self.one = 1.0

    def convert(self, x):
        return float(x)

    def is_Exact(self):
        return True

    def __contains__(self, a):
        return self.convert(a) == a

