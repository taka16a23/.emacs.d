#!/usr/bin/env python
# -*- coding: utf-8 -*-
import argparse
import os
import sys

def _predef_options():
    parser = argparse.ArgumentParser(description=""" """)

    # (yas/expand-link "argparse_add_argument" t)
    return parser


def _main():
    parser = _predef_options()
    opts = parser.parse_args()
    # parser.print_usage()
    loadfile = os.path.expanduser(
        '~/.emacs.d/elisp/start.d/subroutines_start.el')
    cmdbase = 'emacs -Q --batch -l {0} --funcall batch-byte-compile '.format(
        loadfile)
    for dir_, _, _ in os.walk('/root/.emacs.d/elisp'):
        if '.svn' in dir_:
            continue
        args = os.path.join(dir_, '*.el',)
        os.system(cmdbase + args)
    return 0

if __name__ == '__main__':
    sys.exit(_main())
