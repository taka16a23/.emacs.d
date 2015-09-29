#!/usr/bin/env python
# -*- coding: utf-8 -*-

__all__ = ['S']


class _AttributeHolder(object):
    """
    """
    def __repr__(self):
        return ('[%s]' % ',\n '.join(["'%s'" % x for x in dir(self)
                                     if not x.startswith('_')]))


class _SampleTuple(_AttributeHolder):
    null = []
    lists = ['hello', 'world', 'hoge', 'foo', 'bar', 'yahoo', 'google', 'bing']


class _SampleString(_AttributeHolder):
    null = ''
    h = hello = 'hello'
    w = world = 'world'
    ho = hoge = 'hoge'
    f = foo = 'foo'
    b = bar = 'bar'
    y = yahoo = 'yahoo'
    g = google = 'google'
    bi = bing = 'bing'


class _SampleDic(_AttributeHolder):
    null = {}
    etc = {'hello':'hello',
           'world':'world',
           'hoge':'hoge',
           'foo':'foo',
           'bar':'bar',
           'yahoo':'yahoo',
           'google':'google',
           'bing':'bing'}


class _SampleText(_AttributeHolder):
    null = ''
    line1 = ('Python is a programming language that lets you work '
             'more quickly and integrate your systems more effectively.')


class _SampleWinPath(_AttributeHolder):
    null = ''
    notepad = r'C:\Windows\system32\notepad.exe'
    system32 = r'C:\Windows\system32'


class _SampleUnixPath(_AttributeHolder):
    null = ''
    sh = '/bin/sh'
    root = '/root'


class _SampleURL(_AttributeHolder):
    null = ''
    p = python = 'http//www.python.org'
    g = google = 'http//www.google.com'
    y = yahoo = 'http//www.yahoo.com'


class _Sample(object):
    """
    """

    def __init__(self, ):
        """
        """
        self.l = self.list = self.tuple = _SampleTuple()
        self.s = self.str = _SampleString()
        self.d = self.dic = _SampleDic()
        self.t = self.text = _SampleText()
        self.wp = self.winpath = _SampleWinPath()
        self.up = self.unixpath = _SampleUnixPath()
        self.u = self.url = _SampleURL()


S = _Sample()



# For Emacs
# Local Variables:
# coding: utf-8
# End:
# 50-sample.py ends here
