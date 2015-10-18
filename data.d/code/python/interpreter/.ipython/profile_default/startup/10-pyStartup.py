#!/usr/bin/env python
#
"""\
Name: pyStartup.py
$Revision$


"""


import os
import sys
import dis
from pprint import pprint

__all__ = ['pdir']


def pdir(arg, stream=None, indent=1, width=80, depth=None):
    """Pretty-print dir() for interpreter.

    Arguments:
    - `arg`: target objects.
    - `stream` The desired output stream.  If omitted (or false), the standard
               output stream available at construction will be used.
    - `indent`: Number of spaces to indent for each level of nesting.
    - `width`:  Attempted maximum number of columns in the output.
    - `depth`: The maximum depth to print out nested structures.
    """
    pprint(dir(arg), stream=stream, indent=indent, width=width, depth=depth)


print 'imported', ['os', 'sys', 're', 'pprint', 'dis']
print __all__


# For Emacs
# Local Variables:
# coding: utf-8
# End:
# 10-pyStartup.py ends here
