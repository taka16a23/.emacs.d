#!/usr/bin/env python
#
"""\
Name: hello.py
$Revision$


"""

import time

before_time = time.time()
from socket import AF_INET, socket
after_time = time.time()
print(after_time - before_time)

# import XXX より from XXX import YYY の方が若干速い。


# For Emacs
# Local Variables:
# coding: utf-8
# End:
# hello.py ends here
