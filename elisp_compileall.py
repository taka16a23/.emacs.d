#!/usr/bin/env python
# -*- coding: utf-8 -*-
import argparse
import os
import sys
import subprocess
"""
find all 'el' source files.
check 'el' source file has compiled 'elc'.
if abbove not append compile candidate.
if 'el' file newer than 'elc' then append compile candidate.
do compile thread.
"""

class ElispPath(object):
    r"""ElispPath

    ElispPath is a object.
    Responsibility:
    """
    def __init__(self, path):
        r"""

        @Arguments:
        - `args`:
        - `kwargs`:
        """
        self._path = os.path.abspath(path)

    def get_path(self, ):
        r"""SUMMARY

        get_path()

        @Return:

        @Error:
        """
        return self._path

    def get_compiled_path(self, ):
        r"""SUMMARY

        get_compiled_path()

        @Return:

        @Error:
        """
        path, _ = os.path.splitext(self._path)
        return path + '.elc'

    def exists_compiled_path(self, ):
        r"""SUMMARY

        exists_compiled_path()

        @Return:

        @Error:
        """
        return os.path.exists(self.get_compiled_path())

    def is_need_compile(self, ):
        r"""SUMMARY

        is_need_compile()

        @Return:

        @Error:
        """
        if not self.exists_compiled_path():
            return True
        smtime = os.path.getmtime(self._path)
        bmtime = os.path.getmtime(self.get_compiled_path())
        return bmtime <= smtime

    def __str__(self):
        return self._path

    def __repr__(self):
        return self._path


def iter_el_files(directory):
    r"""SUMMARY

    iter_el_files(directory)

    @Arguments:
    - `directory`:

    @Return:

    @Error:
    """
    for path, _, files in os.walk(directory):
        for f in files:
            if f.endswith('.el'):
                yield ElispPath(os.path.join(path, f))


def _predef_options():
    parser = argparse.ArgumentParser(description=""" """)

    # (yas/expand-link "argparse_add_argument" t)
    return parser


def _main():
    # parser = _predef_options()
    # opts = parser.parse_args()
    curdir = os.path.dirname(os.path.abspath(__file__))
    targetdir = os.path.join(curdir, 'site-lisp')
    candidates = []
    append = candidates.append
    for f in iter_el_files(targetdir):
        if f.is_need_compile():
            append(f)
    print(candidates)
    loadfile = os.path.join(curdir, 'init.el')
    commands = ['emacs', '-Q', '--batch', '-l', loadfile,
                '--funcall', 'batch-byte-compile']
    files = []
    while candidates:
        files.append(str(candidates.pop()))
        if 100 <= len(files):
            subprocess.Popen(commands + files)
            files = []
    initpath = ElispPath(os.path.join(curdir, 'init.el'))
    if initpath.is_need_compile():
        files.append(str(initpath))
    if files:
        subprocess.Popen(commands + files)
    return 0

if __name__ == '__main__':
    sys.exit(_main())
