#!/usr/bin/env python
#
"""In Python 2.x, True is not a keyword, so it can be reassigned.
On the other hand, compiler replaces while 1 loop with a single jump,
 so it is faster by 10%.
"""


import time

def while_True():
    """summary

    """
    before_time = time.time()
    count = 0
    while True:
        count += 1
        if 10000 * 10000 < count:
            break
    after_time = time.time()
    print("%-10s %f" %  ("while True :", after_time - before_time))

def while_1():
    """summary

    """
    before_time = time.time()
    count = 0
    while 1:
        count += 1
        if 10000 * 10000 < count:
            break
    after_time = time.time()
    print("%-10s %f" % ("while 1", after_time - before_time))


def _main():
    while_True()
    while_1()

if __name__ == '__main__':
    _main()
