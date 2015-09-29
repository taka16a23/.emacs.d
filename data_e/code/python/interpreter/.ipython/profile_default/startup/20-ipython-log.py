#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""\
Name: 20-ipython-log.py
$Revision$

"""


import os as _os
from portable import P_OFFICE

if 'nt' == _os.name:
    root = P_OFFICE

elif 'posix' == _os.name:
    root = _os.path.expanduser('~')

logfile = _os.path.join(root,
                        '.emacs.d/data_e/code/pyhon/interpreter/ipython-log.py')

from IPython.core.magics.logging import LoggingMagics
LoggingMagics().logstart(parameter_s='-o {0} append'.format(logfile))



# For Emacs
# Local Variables:
# coding: utf-8
# End:
# 20-ipython-log.py ends here
