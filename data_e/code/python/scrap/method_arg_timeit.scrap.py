#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""JUNK"""
import os
import sys
import re

class Event(object):
    r"""
    """

    def __init__(self, ):
        r"""
        """

        self.name = 'john'
        self.age = 20


class Testmethod(object):
    r"""
    """

    def __init__(self, event):
        r"""

        @Arguments:
        - `event`:
        """
        self._event = event

    def tes(self, ):
        r"""SUMMARY

        tes()

        @Return:
        """
        return self._event.name


class Testmethod2(object):
    r"""
    """

    def tes(self, event):
        r"""SUMMARY

        tes(event)

        @Arguments:
        - `event`:

        @Return:
        """
        return event.name



# >>> tes1 = Testmethod(event)
# >>> tes1.tes()
# 'john'
# >>> tes2 = Testmethod2()
# >>> tes2.tes(event)
# 'john'
# >>> timeit tes1.tes()
# 1000000 loops, best of 3: 803 ns per loop
# >>> timeit tes2.tes(event)
# 1000000 loops, best of 3: 677 ns per loop


# In [30]: dis.dis(tes1.tes)
#  36           0 LOAD_FAST                0 (self)
#               3 LOAD_ATTR                0 (_event)
#               6 LOAD_ATTR                1 (name)
#               9 RETURN_VALUE

# In [31]: dis.dis(tes2.tes)
#  53           0 LOAD_FAST                1 (event)
#               3 LOAD_ATTR                0 (name)
#               6 RETURN_VALUE
