#!/usr/bin/env python
# -*- coding: utf-8 -*-
r"""\
Name: pipchecklatest.py
$Revision$

"""


import sys
import argparse
import subprocess as sbp

# for debug
import cgitb
cgitb.enable(format='text')


__revision__ = '$Revision$'
__version__ = '0.1.0'


packages = '/root/pip_ni_trimed.txt'
outputf = '/tmp/junk/pipchecklatest.txt'

def pipchecklatest():
    r"""SUMMARY

    @Return:
    """
    with open(packages, 'r') as f, open(outputf, 'w') as newf:
        for name in f.readlines():
            name = name.replace('\n', '')
            print(name)
            p = sbp.Popen(['/usr/bin/pip', 'search', name], stdout=sbp.PIPE)
            newlines = [name]
            for line in p.stdout.readlines():
                line = line.replace('\n', '')
                if 'INSTALLED:' in line or 'LATEST:' in line:
                    print(line)
                    newlines.append(line)
            nline = '\n'.join(newlines)
            if not '(latest)' in nline and 'LATEST' in nline:
                newf.write(nline)
                newf.write('\n\n')
            del p


def _predef_options():
    parser = argparse.ArgumentParser(description=""" """)
    parser.add_argument('--version',
                        dest='version',
                        action='version',
                        version=__version__,
                        help='Version Strings.')
    # (yas/expand-link "argparse_add_argument" t)
    return parser

def _main():
    r"""Main function."""
    parser = _predef_options()
    opts = parser.parse_args()
    # parser.print_usage()
    pipchecklatest()
    return 0

if __name__ == '__main__':
    sys.exit(_main())



# For Emacs
# Local Variables:
# coding: utf-8
# End:
# pipchecklatest.py ends here
