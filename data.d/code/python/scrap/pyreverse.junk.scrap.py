#!/usr/bin/env python
# -*- coding: utf-8 -*-
import os as _os
import os
import sys
import re
import distutils
import shutil
# Class Prepare
# target



### PREPARE
## check Arguments
args = _options_maker()
# set target as normal path and absolute path
target = os.path.abspath(os.path.normcase(args.file))
# target does not exists raise Error
path_checker(target)

## set dst_dir
# if target is file, set sub directory as file name
if os.path.isfile(target):
    dst_dir = os.path.splitext(target)[0]
# if target is directory, set as it.
elif os.path.isdir(target):
    dst_dir = target

# name = os.path.basename(dst_dir)
## if target is file, and does not exists directory as file name
if os.path.isfile(target) and not os.path.exists(dst_dir):
    # make directory as file name.
    os.mkdir(dst_dir)


### PYREVERSE
def pyreverse(target, dir, detail=True):
    """SUMMARY

    @Arguments:
    - `target`:
    - `dst`:
    - `detail`:

    @Return:
    """
    ## detarmine pyreverse bin
    # if system is windows, set pyreverse.bat
    if 'nt' == _os.name:
        bin = 'pyreverse.bat'
    # if system is unix, set pyreverse
    elif 'posix' == _os.name:
        bin = 'pyreverse'

    ## check exists pyreverse_bin
    if distutils.spawn.find_executable(bin) is None:
        # if not exists raise error
        raise IOError('File does not exists: %s' % bin)

    ## set UML directory path
    dst_dir = os.path.join(dir, 'UML')
    # if not exists UML sub directory, then create it.
    if not os.path.exists(dst_dir):
        os.mkdir(dst_dir)

    name = os.path.dirname(dir)
    ## Do command
    # if detail, exec command detail command
    if detail:
        os.system('{0} -SAmy -o png -p {1} {2}'.format(bin, name, target))
    # if not detail, exec command simple command
    else:
        os.system('{0} -o png -p {1} {2}'.format(bin, name, target))

    ## check output
    # set src as abspath
    src_name = 'classes_{0}.png'.format(name)
    src = os.path.abspath(src_name)
    # if not exists src, raise error
    path_checker(src)

    ## finalyze
    dst = os.path.join(dst_dir, src_name)
    # if exists dst file, remove it.
    if os.path.exists(dst):
        os.remove(dst)
    if os.path.exists(src):
        # move src to dst
        shutil.move(src, dst)
    elif not os.path.exists(src):
        raise IOError('File does not exists: %s' % src)


### epydoc
def epydoc(target, dir):
    """SUMMARY

    @Arguments:
    - `target`:

    @Return:
    """
    if not os.path.isabs(target):
        raise ValueError('Set absolute path: %s' % target)

    ## check exists epydoc
    bin = 'epydoc'
    # if not exists raise Error
    if distutils.spawn.find_executable(bin):
        raise IOError('File does not exists: %s' % bin)

    ## set output path
    # set output path as 'epydoc_html'
    dst = os.path.join(dir, 'epydoc_html')

    ## exec command
    os.system('{0} --graph all --html --output {1} {2}'.format(bin, dst, target))

    ## check output
    # if not exists output files raise Error
    if not os.path.exists(dst):
        raise IOError('File does not exists: %s' % dst)



class Hello(object):
    """
    """

    def __init__(self):
        """
        """

        print('hello')


class World(Hello):
    """
    """
    pass
    # def __init__(self):
    #     """
    #     """

    #     print('world')


        # without extension and directory
    name = os.path.basename(os.path.splitext(target)[0])

    if os.path.isfile(target):
        top_dir = os.path.join(os.path.dirname(target), name)
    elif os.path.isdir:
        top_dir = target
    uml_dir = os.path.join(top_dir, 'UML')
    if not os.path.exists(uml_dir):
        os.makedirs(uml_dir)

    # pyreverse
    mypyreverse(name, target, uml_dir)
    mypyreverse('Simple_' + name, target, uml_dir, detail=False)

    # epydoc
    epy_cmd = 'epydoc --graph all --html --name {0} --output {1} {2}'.format(
        name, os.path.join(top_dir, 'html'), target)
    os.system(epy_cmd)


    # doxygen
    orig_dir = os.getcwd()
    try:
        doxygen(target)
    finally:
        os.chdir(orig_dir)


# def mypyreverse(name, target, dst, detail=True):
#     """SUMMARY

#     @Return:
#     """
#     if 'nt' == os.name:
#         exe = 'pyreverse.bat'
#     elif 'posix' == os.name:
#         exe = 'pyreverse'

#     if detail:
#         cmd = '{0} -SAmy -o png -p {1} {2}'.format(exe, name, target)
#     else:
#         cmd = '{0} -o png -p {1} {2}'.format(exe, name, target)

#     # do command
#     os.system(cmd)

#     # post spawned
#     src_name = 'classes_{0}.png'.format(name)
#     src = os.path.abspath(src_name)
#     dst = os.path.join(dst, src_name)

#     # overwrite
#     if os.path.exists(dst):
#         os.remove(dst)
#     if os.path.exists(src):
#         shutil.move(src, dst)
