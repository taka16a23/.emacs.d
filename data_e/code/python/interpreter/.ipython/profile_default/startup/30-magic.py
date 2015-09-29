#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
from IPython.core import splitinput
from IPython.core.inputsplitter import transform_escaped

# magic functions
splitinput.line_split = line_split = re.compile("""
^(\s*)
([,;/%:]|!!?|\?\??)?
\s*(%{0,2}[\w\.\*]*)
(.*?$|$)
""", re.VERBOSE)
transform_escaped.tr[':'] = transform_escaped._tr_magic



# For Emacs
# Local Variables:
# coding: utf-8
# End:
# 30-magic.py ends here
