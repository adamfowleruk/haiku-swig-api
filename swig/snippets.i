
%pythoncode %{
from enum import Enum
def redo(prefix):
    tmpD = {k:v for k,v in globals().items() if k.startswith(prefix + '_')}
    for k,v in tmpD.items():
        del globals()[k]
    tmpD = {k[len(prefix)+1:]:v for k,v in tmpD.items()}
    # globals()[prefix] = type(prefix,(),tmpD) # pre-Enum support
    print "Setting prefix " + prefix
    if prefix != "":
        globals()[prefix] = Enum(prefix,tmpD)
redo('window_type')
del redo  # cleaning up the namespace
del Enum
%}

