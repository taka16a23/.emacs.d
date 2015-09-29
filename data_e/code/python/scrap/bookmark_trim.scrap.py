#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
bookmark_trim.py

triming Google Bookmark in folder for Open All Bookmark
"""

import pdb
import sys, os, re, time
import codecs
from optparse import OptionParser, OptionGroup
from subprocess import Popen


## Debug option "-O"
#
from logging import basicConfig, DEBUG, debug
if not __debug__: basicConfig(stream=sys.stderr, level=DEBUG)


## Variable
#
prog_name = sys.argv[0]
chrome_options = '--enable-sync --purge-memory-button --disable-ipv6 '
if 'linux' in sys.platform:
    chrome_path = "/usr/bin/chromium-browser"
    bookmark_path = '~/.config/chromium/Default/Bookmarks'
    gbookmark = os.path.expanduser(bookmark_path)

elif 'win32' == sys.platform:
    chrome_path = os.path.join('C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe')
    bookmark_path = "Local Settings/Application Data/Google/Chrome/User Data/Default/Bookmarks"
    chrome_options += '--disk-cache-dir="T:\\chrome" --disk-cache-size=1048000000 --media-cache-size=1048000000 '
    gbookmark = os.path.join(os.environ['userprofile'], bookmark_path)

else:
    print 'Not Support %s' % sys.platform
    sys.exit(1)


## Function
#
def ParserSetup():
    usage='Usage: ' + prog_name + ' [options] <search options>'

    if len(sys.argv) < 2:
        print usage
        sys.exit(2)

    parser = OptionParser(usage)
    parser.add_option(
        "-r", "--recursive",
        action="store_true",
        default=False,
        dest="recursive",
        help="Open folder recursively"
        )
    parser.add_option(
        "-a", "--after",
        action="store",
        type="string",
        dest="after_run",
        help="Open domain at last"
        )
    group = OptionGroup(parser, "Search Options")
    group.add_option(
        "-i", "--id",
        action="store",
        type="string",
        dest="id",
        help="[Search Option] Bookmark folder's ID"
        )
    group.add_option(
        "-n", "--name",
        action="store",
        type="string",
        dest="name",
        help="[Search Option] Bookmark folder's NAME"
        )
    parser.add_option_group(group)
    (options, args) = parser.parse_args()

    if options.id and options.name:
        parser.error('Search option can use only one')
    return parser


def Get_Line_Number(phrase, file_name):
    phrase = '"id": "'+phrase+'"'
    with open(file_name) as f:
        for num, line in enumerate(f, 1):
            if phrase in line:
                f.close()
                return num - 1

def Check_File(files):
    if not os.path.isfile(files):
        print 'Missing ' + files
        sys.exit(1)

def Get_Url(files, line_num):
    operand = 0
    url = []
    line_num  = line_num -3
    upattern = "(http|https)://[A-Za-z0-9.?.$,;:&=!*~@_()\-\#%+/]+"

    debug('operand(1)  %i' % operand)

    f = codecs.open(files, 'r', 'ascii')
    lines = f.readlines()
    statement = lines[line_num]

    # if '}' in statement:
    if statement.find('}'):
        operand = -1
        debug('operand(2) %i' % operand)

    if not __debug__: print ''
    debug('GETTING TEXT FROM %s ==========' % gbookmark)
    while operand < 0:
        line_num = line_num -1
        statement = lines[line_num]
        debug('bookmrks:line%i' % line_num + ':' '%s' % statement.rstrip('\n'))

        # if '}' in statement:
        if statement.find('}') != -1:
            operand = operand -1
            debug('***** operand[-] %i *****' % operand)

        # if '{' in statement:
        if statement.find('{') != -1:
            operand = operand +1
            debug('***** operand[+] %i *****' % operand)

        if operand == -1:
            # if 'http:' in statement:
            if statement.find('http:') != -1:
                regurl = re.search(upattern, statement)
                url.append(regurl.group())

    f.close()
    debug('========== END ==========\n')
    return url


# if not __debug__: print ''
def Run(url, options, chrome_path, chrome_options):
    after_run = None
    counter = 0
    for t in url:
        debug('url:' + t)
        if options.after_run:
            # if t.find(options.after_run) != -1:
            if options.after_run in t :
                after_run = t
                options.after_run = None
                debug('after_run:' + after_run)
                continue
        Popen([chrome_path, chrome_options, t])
        if counter == 0:
            time.sleep(2)
            counter += 1
        time.sleep(0.5)

    debug('========== END ==========\n')
    if after_run:
        chrome_options += '--new-window '
        debug(chrome_options)
        Popen([chrome_path, chrome_options, after_run])



if __name__ == "__main__":
    parser = ParserSetup()
    (options, args) = parser.parse_args()

    debug('[Operating System] ' + sys.platform)
    debug('[Chrome Path] ' + chrome_path)
    debug('[chrome_options] ' + chrome_options)
    debug('[Bookmark Path] ' + gbookmark + '\n')

    Check_File(chrome_path)
    Check_File(gbookmark)

    line_num = Get_Line_Number(options.id, gbookmark)
    url = Get_Url(gbookmark, line_num)
    Run(url, options, chrome_path, chrome_options)



    sys.exit(0)
