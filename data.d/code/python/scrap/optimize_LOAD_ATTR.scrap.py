#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""JUNK"""
import os
import sys
import re

def tes():
    join = os.path.join
    return join('/tmp', 'tes')

def tes2():
    return os.path.join(os.path.join('/tmp', 'tes'), 'world')

# In [210]: /dis.dis tes2
# 2           0 LOAD_GLOBAL              0 (os)
# 3 LOAD_ATTR                1 (path)
# 6 LOAD_ATTR                2 (join)
# 9 LOAD_GLOBAL              0 (os)
# 12 LOAD_ATTR                1 (path)
# 15 LOAD_ATTR                2 (join)
# 18 LOAD_CONST               1 ('/tmp')
# 21 LOAD_CONST               2 ('tes')
# 24 CALL_FUNCTION            2
# 27 LOAD_CONST               3 ('world')
# 30 CALL_FUNCTION            2
# 33 RETURN_VALUE


def tes3():
    join = os.path.join
    return join(join('/tmp', 'tes'), 'world')

# In [211]: /dis.dis tes3
# 2           0 LOAD_GLOBAL              0 (os)
# 3 LOAD_ATTR                1 (path)
# 6 LOAD_ATTR                2 (join)
# 9 STORE_FAST               0 (join)

# 3          12 LOAD_FAST                0 (join)
# 15 LOAD_FAST                0 (join)
# 18 LOAD_CONST               1 ('/tmp')
# 21 LOAD_CONST               2 ('tes')
# 24 CALL_FUNCTION            2
# 27 LOAD_CONST               3 ('world')
# 30 CALL_FUNCTION            2
# 33 RETURN_VALUE



def test01():
    r"""SUMMARY

    test01()

    @Return:
    """
    return os.path.join(
        os.path.join(
            os.path.join('/tmp', 'tes',),
            'world'),
        'yahoo')

# In [213]: /dis.dis test01
#  12           0 LOAD_GLOBAL              0 (os)
#               3 LOAD_ATTR                1 (path)
#               6 LOAD_ATTR                2 (join)

#  13           9 LOAD_GLOBAL              0 (os)
#              12 LOAD_ATTR                1 (path)
#              15 LOAD_ATTR                2 (join)

#  14          18 LOAD_GLOBAL              0 (os)
#              21 LOAD_ATTR                1 (path)
#              24 LOAD_ATTR                2 (join)
#              27 LOAD_CONST               1 ('/tmp')
#              30 LOAD_CONST               2 ('tes')
#              33 CALL_FUNCTION            2

#  15          36 LOAD_CONST               3 ('world')
#              39 CALL_FUNCTION            2

#  16          42 LOAD_CONST               4 ('yahoo')
#              45 CALL_FUNCTION            2
#              48 RETURN_VALUE




def test02():
    r"""SUMMARY

    test02()

    @Return:
    """
    join = os.path.join
    return join(join(join('/tmp', 'tes'), 'world'), 'yahoo')


# In [214]: /dis.dis test02
#  26           0 LOAD_GLOBAL              0 (os)
#               3 LOAD_ATTR                1 (path)
#               6 LOAD_ATTR                2 (join)
#               9 STORE_FAST               0 (join)

#  27          12 LOAD_FAST                0 (join)
#              15 LOAD_FAST                0 (join)
#              18 LOAD_FAST                0 (join)
#              21 LOAD_CONST               1 ('/tmp')
#              24 LOAD_CONST               2 ('tes')
#              27 CALL_FUNCTION            2
#              30 LOAD_CONST               3 ('world')
#              33 CALL_FUNCTION            2
#              36 LOAD_CONST               4 ('yahoo')
#              39 CALL_FUNCTION            2
#              42 RETURN_VALUE
