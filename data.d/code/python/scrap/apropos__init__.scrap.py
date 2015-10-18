#!/usr/bin/env python
# -*- coding: utf-8 -*-
r"""\
Name: __init__.py

doc search
module name search
class name search
method name search
function name search
variables search
pip search
cache use

name:
file:
type:
definition:
summary:
doc:
source:



search name __builtin__

builtin function
    search: name doc



"""
from time import sleep
import os
import sys as _sys
import re as _re
import inspect as _inspect
from collections import defaultdict as _defaultdict
import types as _types

import pkgutil as _pkgutil



# from .dataholder import AproposDataHolder


__revision__ = "$Revision$"
__version__ = "0.1.0"

__all__ = [ 'AproposDataHolder' ]


# ismodule, isclass, isfunction


# get builtin func or class
# get builtin modules
# get standard library modules
# get additional package modules

# get builtin func or class info
# get builtin modules info
#     if module or class recursive call
#
# get standard library modules info
# get additional package modules info


def getbuiltins():
    r"""SUMMARY

    @Return:
    """
    for name, builtin in _inspect.getmembers(__builtins__):
        if name.startswith('_'):
            continue
        yield name, builtin


def getbuiltinmodules():
    r"""SUMMARY

    @Return:
    """
    for modname in _sys.builtin_module_names:
        if modname == '__main__':
            continue
        yield modname, __import__(modname)


def getmodules():
    r"""SUMMARY

    @Return:
    """
    for _, modname, _ in _pkgutil.iter_modules():
        yield modname, __import__(modname)




def test():
    r"""SUMMARY

    @Return:
    """
    for d in ModWalker():
        if _re.search('path', d['name']):
            yield d['name']


class WalkModInfo(object):
    r"""
    """

    def __init__(self, hashes=[], unique=True):
        r"""
        """
        self._hashes = hashes
        self._unique = unique

    def hashclear(self):
        r"""SUMMARY

        @Return:
        """
        self._hashes = []

    def gethashes(self):
        r"""SUMMARY

        @Return:
        """
        return self._hashes

    def walk(self, obj, parent=''):
        r"""Generator for module info.

        @Arguments:
        - `parent`:

        @Return: collections.defaultdict include
        name, file, type, definition, object, summary, doc
        """
        # for definitions
        if '' == parent and hasattr(obj, '__name__'):
            parent = obj.__name__
        yield _defaultdict(str,
                           name=parent,
                           file=getsafeabsfile(obj),
                           type=type(obj),
                           definition=parent,
                           object=obj,
                           summary=(getdocsummary(obj) or ''),
                           doc=(_inspect.getdoc(obj) or ''))

        # for subobj in obj
        for modname, subobj in _inspect.getmembers(obj):
            if modname.startswith('_'):
                continue

            # check hash for unique
            if self._unique:
                try:
                    hash_ = hash(subobj)
                    if hash_ in self._hashes:
                        continue
                    self._hashes.append(hash_)
                except TypeError:
                    # unhashable type
                    continue

            subparent = '.'.join([parent, modname])
            if _inspect.ismodule(subobj) or _inspect.isclass(subobj):
                # recursively call
                for dic_ in self.walk(subobj, parent=subparent):
                    # if os.path.basedir(subobj.__file__) == :
                    yield dic_
            else:
                yield _defaultdict(str,
                                   name=modname,
                                   file=getsafeabsfile(subobj),
                                   type=type(subobj),
                                   definition=getdef(subobj, subparent),
                                   object=subobj,
                                   summary=(getdocsummary(subobj) or ''),
                                   doc=(_inspect.getdoc(subobj) or ''))



class ModuleInfoWalker(object):
    r"""
    """

    def __init__(self, ):
        r"""
        """
        for _, _, _ in _pkgutil.walk_packages(onerror=lambda name: None):
            pass
        self._iters = self._itermodinfo()

    def __iter__(self):
        r"""SUMMARY

        @Return:
        """
        return self

    def next(self):
        r"""SUMMARY

        @Return:
        """
        return self._iters.next()

    def _itermodinfo(self):
        r"""SUMMARY

        @Return:
        """
        for key, obj in sys.modules.iteritems():
            if obj is None:
                continue
            yield _defaultdict(str,
                               name=key,
                               file=getsafeabsfile(obj),
                               type=type(obj),
                               definition=key,
                               summary=getdocsummary(obj),
                               doc = (_inspect.getdoc(obj) or ''))
            try:
                for d in self._recursivemod(obj, parent=key):
                    yield d
            except NotImplementedError:
                continue

    def _recursivemod(self, obj, parent=''):
        r"""SUMMARY

        @Return:
        """
        if '' == parent and hasattr(obj, '__name__'):
            parent = obj.__name__

        for memname, subobj in _inspect.getmembers(obj):
            if memname.startswith('_') and memname.endswith('__'):
                continue
            if _inspect.isfunction(subobj) or _inspect.ismethod(subobj):
                yield _defaultdict(str,
                                   name=parent+'.'+memname,
                                   file=getsafeabsfile(subobj),
                                   type=type(subobj),
                                   definition=getdef(subobj, parent+'.'+memname),
                                   summary=getdocsummary(subobj),
                                   doc = (_inspect.getdoc(subobj) or ''))

            if _inspect.isclass(subobj):
                yield _defaultdict(str,
                                   name=parent+'.'+memname,
                                   file=getsafeabsfile(subobj),
                                   type=type(subobj),
                                   definition=parent+'.'+memname+'()',
                                   summary=getdocsummary(subobj),
                                   doc = (_inspect.getdoc(subobj) or ''))
                self._recursivemod(subobj, parent=parent+'.'+memname+'()')


elements = ['name', 'file', 'type', 'definition', 'object', 'summary', 'doc']

def matcher(key, pager=pager,
            inname=True, infile=False, indef=False, insummary=True, indoc=False):
    r"""SUMMARY

    @Arguments:
    - `key`:

    @Return:
    """
    for d in ModuleInfoWalker():
        if ((inname and _re.search(key, str(d['name']))) or
            (infile and _re.search(key, str(d['file']))) or
            (indef and _re.search(key, str(d['definition']))) or
            (insummary and _re.search(key, str(d['summary']))) or
            (indoc and _re.search(key, str(d['doc'])))):

            pager(key, d, inname=inname, infile=infile, indef=indef,
                  insummary=insummary, indoc=indoc)


def pager(key, dic, **flags):
    r"""SUMMARY

    @Arguments:
    - `key`:
    - `dic`:

    @Return:
    """
    fmt = '{0:<10} : {1}'
    print('\n{0:*<50}'.format(''))
    print(fmt.format('name', str(dic['name'])))
    print(fmt.format('file', str(dic['file'])))
    print(fmt.format('definition', str(dic['definition'])))
    print(fmt.format('summary', str(dic['summary'])))
    if flags.get('indoc', False):
        print(fmt.format('doc', str(dic['doc'])))



# def getbuiltinmodinfos():
#     r"""SUMMARY

#     @Return:
#     """
#     for modname, obj in getbuiltinmodules():
#         for d in self.walkmodinfo(obj=obj, parent=modname):
#             yield

# class BuiltinModInfo(object):
#     r"""
#     """

#     def __init__(self, ):
#         r"""
#         """

#         pass


class ModWalker(WalkModInfo):
    r"""
    """

    def __init__(self, hashes=[], unique=True):
        r"""
        """
        super(ModWalker, self).__init__(hashes=hashes, unique=unique)
        self._iterator = self._walker()

    def _walker(self):
        r"""SUMMARY

        @Return:
        """
        # builtins
        for bname, obj in getbuiltins():
            for d in self.walk(obj=obj, parent=bname):
                yield d
        print('builtins finish')
        sleep(3)

        # builtin modules
        for modname, obj in getbuiltinmodules():
            for d in self.walk(obj=obj, parent=modname):
                yield d
        print('builtin modules finish')
        sleep(3)

        # modules
        for modname, obj in getmodules():
            for d in self.walk(obj=obj, parent=modname):
                yield d

    def __iter__(self):
        r"""SUMMARY

        @Return:
        """
        return self

    def next(self):
        r"""SUMMARY

        @Return:
        """
        return self._iterator.next()


def getdef(obj, name):
    r"""SUMMARY

    @Arguments:
    - `obj`:
    - `name`:

    @Return:
    """
    if not callable(obj):
        return name
    try:
        return str(_inspect.getargspec(obj)).replace('ArgSpec', name)
    except TypeError:
        return name + '()'


def getdocsummary(obj):
    r"""SUMMARY

    @Arguments:
    - `obj`:

    @Return:
    """
    # Do not use splitlines instead split('\n'), it will raise IndexError.
    return (_inspect.getdoc(obj) or '').split('\n')[0]

def getsafeabsfile(obj):
    r"""SUMMARY

    @Arguments:
    - `obj`:

    @Return:
    """
    try:
        return _inspect.getabsfile(obj)
    except TypeError:
        return ''

### junk ###
def parse_builtin_functions(key, inname=True, insummary=True, infulldoc=False):
    r"""SUMMARY

    @Arguments:
    - `key`:
    - `name`:
    - `summary`:
    - `doc`:

    @Return:
    """
    for bname, builtin in getbuiltins():
        # prevent not callable and started with '_'
        if not callable(builtin) or bname.startswith('_'):
            continue
        # prevent not match name, summary or doc
        if not ((inname and _re.search(key, bname)) or
                (insummary and _re.search(key, getdocsummary(builtin))) or
                (infulldoc and _re.search(key, _getdoc(builtin)))):
            continue
        yield _defaultdict(str, name=bname, type=type(builtin),
                           summary=getdocsummary(builtin),
                           doc=_inspect.getdoc(builtin))


def parse_builtin_modules(key, inname=True, insummry=True, infulldoc=False):
    r"""SUMMARY

    @Arguments:
    - `key`:
    - `name`:
    - `summry`:
    - `detail`:
    - `source`:

    @Return:
    """
    for modname in _sys.builtin_module_names:
        if modname == '__main__':
            continue
        obj = __import__(modname)
        # name match or summary match, docstring match
        if ((inname and _re.search(key, modname)) or
            (insummry and _re.search(key, getdocsummary(obj))) or
            (infulldoc and _re.search(key, _getdoc(obj)))):
            yield _defaultdict(str, name=modname, type=type(obj),
                               file='', definition='',
                               summary=getdocsummary(obj),
                               doc=_inspect.getdoc(obj))


def iterbuiltinsinfo(sammary=True, doc=True):
    r"""SUMMARY

    @Return:
    """
    for bname, builtin in getbuiltins():
        if sammary:
            smmry = getdocsummary(builtin)
        else:
            smmry = ''
        if doc:
            dc = _inspect.getdoc(builtin)
        else:
            doc = ''
        yield _defaultdict(str, name=bname, type=type(builtin),
                           summary=smmry, doc=dc)









# For Emacs
# Local Variables:
# coding: utf-8
# End:
# __init__.py ends here
