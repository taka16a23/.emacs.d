# Start of settings from configure.bat 
COMPILER=cl
# End of settings from configure.bat
 
#
#  Makefile definition file for building GNU Emacs on the Microsoft W32 API.
#  Copyright (c) 2000-2001 Free Software Foundation, Inc.
#
#  GNU Emacs is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2, or (at your option)
#  any later version.
#
#  GNU Emacs is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with GNU Emacs; see the file COPYING.  If not, write to
#  the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
#  Boston, MA 02111-1307, USA.

# Ensure 'all' is the default target
all:

THE_SHELL = $(COMSPEC)
SHELLTYPE=CMD

MAKETYPE=nmake

CURDIR		= $(MAKEDIR:\=/)
THISDIR		= $(MAKEDIR)

ALL_DEPS	= $**

SUBSYSTEM_WINDOWS=-subsystem:windows
SUBSYSTEM_CONSOLE=-subsystem:console

# INSTALL_DIR is the directory into which emacs will be installed.
#
!ifndef INSTALL_DIR
INSTALL_DIR     = $(CURDIR)/..
!endif

# Ensure EMACSLOADPATH is defined in the environment.
#
!if [set EMACSLOADPATH=foo]
!endif

# Allow detection of builds with MSVC 5 or later, so we can
# speed up compiles (see rule at end).
#
_NMAKE_VER_5=162
_NMAKE_VER_4=0

!IFNDEF _NMAKE_VER
_NMAKE_VER=$(_NMAKE_VER_4)
!ENDIF

# Check that the INCLUDE and LIB environment variables are set.
#
!ifndef INCLUDE
!error The INCLUDE environment variable needs to be set.
!endif
!ifndef LIB
!error The LIB environment variable needs to be set.
!endif

# Determine the architecture we're running on.
# Define ARCH for our purposes;
# Define CPU for use by ntwin32.mak;
# Define CONFIG_H to the appropriate config.h for the system;
#
!ifdef PROCESSOR_ARCHITECTURE
# We're on Windows NT
CPU		= $(PROCESSOR_ARCHITECTURE)
CONFIG_H	= config.nt
OS_TYPE		= windowsnt
! if "$(PROCESSOR_ARCHITECTURE)" == "x86"
ARCH		= i386
CPU		= i386
! else
!  if "$(PROCESSOR_ARCHITECTURE)" == "MIPS"
ARCH		= mips
!  else
!   if "$(PROCESSOR_ARCHITECTURE)" == "ALPHA"
ARCH		= alpha
!   else
!    if "$(PROCESSOR_ARCHITECTURE)" == "PPC"
ARCH		= ppc
!    else
!     error Unknown architecture type "$(PROCESSOR_ARCHITECTURE)"
!    endif
!   endif
!  endif
! endif
!else
# We're on Windows 95
ARCH		= i386
CPU		= i386
CONFIG_H	= config.nt
OS_TYPE		= windows95
!endif

AR		= lib
AR_OUT		= -out:
CC		= cl
CC_OUT		= -Fo
LINK		= link
LINK_OUT	= -out:
RC		= rc
RC_OUT		= -Fo
RC_INCLUDE	= -i

libc		= libc.lib
baselibs	=
O		= obj
A		= lib

BASE_LIBS	= $(libc) $(baselibs) oldnames.lib

ADVAPI32	= advapi32.lib
COMDLG32	= comdlg32.lib
GDI32		= gdi32.lib
MPR		= mpr.lib
SHELL32		= shell32.lib
USER32		= user32.lib
WSOCK32		= wsock32.lib
WINMM     = winmm.lib

!ifdef NOOPT
DEBUG_CFLAGS	= -DEMACSDEBUG
!else
DEBUG_CFLAGS	=
!endif
CFLAGS          = -I. -DWIN32_LEAN_AND_MEAN -D_WIN32_WINNT=0x0400 $(ARCH_CFLAGS) -D$(ARCH) \
		  -D_CRTAPI1=_cdecl $(DEBUG_CFLAGS) $(USER_CFLAGS) $(LOCAL_FLAGS)
EMACS_EXTRA_C_FLAGS =

SYS_LDFLAGS	= -release -incremental:no -version:3.10 -swaprun:cd -swaprun:net setargv.obj

# see comments in allocate_heap in w32heap.c before changing any of the
# -stack, -heap, or -base settings.
TEMACS_EXTRA_LINK = -stack:0x00800000 -heap:0x00100000 -base:0x01000000 -debug:full -debugtype:both -pdb:$(BLD)\temacs.pdb -machine:$(ARCH) $(SUBSYSTEM_CONSOLE) -entry:_start -map:$(BLD)\temacs.map $(EXTRA_LINK)

!ifdef NOOPT
OBJDIR          = obj
!else
OBJDIR          = obj-spd
!endif
$(OBJDIR):;	-mkdir $(OBJDIR)
BLD             = $(OBJDIR)/$(ARCH)
$(BLD):         $(OBJDIR)
		-mkdir "$(BLD)"

COMPILER_TEMP_FILES = *.pdb

CP		= cp -f
CP_DIR		= cp -rf
IFNOTSAMEDIR	= if not exist ..\same-dir.tst
ENDIF		=
FOREACH		= for %%f in (
FORVAR		= %%f
FORDO		= ) do
ENDFOR		=
ARGQUOTE	= "
DQUOTE		= \"
DEL		= rm
DEL_TREE	= rm -r

!ifdef NODEBUG
DEBUG_FLAG =
DEBUG_LINK =
!else
DEBUG_FLAG = -Zi
DEBUG_LINK = -debug:full -debugtype:both
!endif

!if "$(ARCH)" == "i386"
!ifdef NOOPT
ARCH_CFLAGS     = -nologo -D_X86_=1 -c -Zel -W2 -H63 -Od -G3d -Zp8 $(DEBUG_FLAG)
!else
ARCH_CFLAGS     = -nologo -D_X86_=1 -c -Zel -W2 -H63 -Oxsb2 -Oy- -G6dF -Zp8 $(DEBUG_FLAG)
!endif
ARCH_LDFLAGS	= $(SYS_LDFLAGS)

!else
!if "$(ARCH)" == "mips"
ARCH_CFLAGS     = -D_MIPS_=1 -c -W2 -Zi -Od -Gt0
ARCH_LDFLAGS	= $(SYS_LDFLAGS)

!else
!if "$(ARCH)" == "alpha"
!if "$(BUILD_TYPE)" == "spd"
ARCH_CFLAGS     = -D_ALPHA_=1 -c -Ze -Zi -W2 -Od -D__stdcall= -D__cdecl=
!else
ARCH_CFLAGS     = -D_ALPHA_=1 -c -Ze -Zi -W2 -O1 -D__stdcall= -D__cdecl=
!endif
ARCH_LDFLAGS	= $(SYS_LDFLAGS)

!else
!if "$(ARCH)" == "ppc"
# These flags are a guess...if they don't work, please send me mail.
ARCH_CFLAGS	= -D_PPC_=1 -c -Ze -Zi -W2 -Od
ARCH_LDFLAGS	= $(SYS_LDFLAGS)

!else
!ERROR Unknown architecture type "$(ARCH)".
!endif
!endif
!endif
!endif

LINK_FLAGS	= $(ARCH_LDFLAGS) $(DEBUG_LINK) $(USER_LDFLAGS)

# From MSVC 5.0 onwards, it seem base relocation information is not included,
# at least in release builds.  We need to ensure the reloc info is included
# in order to use the MSVC profiler.
!IF ("$(_NMAKE_VER)" == "$(_NMAKE_VER_4)")
EXTRA_LINK      =
!ELSE
EXTRA_LINK      = -profile
!ENDIF

#
# If the compiler supports compiling multiple .c files to .o files at
# one time, use this feature.
#
!IF ("$(_NMAKE_VER)" == "$(_NMAKE_VER_4)")
.c{$(BLD)}.obj:
		$(CC) $(CFLAGS) -Fo$(BLD)\ $<
!ELSE
.c{$(BLD)}.obj::
		$(CC) $(CFLAGS) -Fo$(BLD)\ $<
!ENDIF

# arch-tag: fefa49b0-c23c-46c7-9094-cab2a405058e
# Makefile for the GNU Emacs Lisp Reference Manual.

# Copyright (C) 2003
#  Free Software Foundation, Inc.

# This file is part of GNU Emacs.

# GNU Emacs is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.

# GNU Emacs is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with GNU Emacs; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
# Boston, MA 02111-1307, USA.

# Standard configure variables.
srcdir = .

infodir = $(srcdir)/../info

# Redefine `TEX' if `tex' does not invoke plain TeX.  For example:
# TEX=platex
TEX=tex
INSTALL_INFO = install-info
MAKEINFO = makeinfo

# The environment variable and its value to add $(srcdir) to the path
# searched for TeX input files.
texinputdir = $(srcdir)\..\nt\envadd.bat "TEXINPUTS=$(srcdir);$(TEXINPUTS)" /C

# The name of the manual:
VERSION=2.9
manual = elisp-manual-21-$(VERSION)

# Uncomment this line for permuted index.
# permuted_index = 1 

# List of all the texinfo files in the manual:

srcs = \
  $(srcdir)/abbrevs.texi \
  $(srcdir)/advice.texi \
  $(srcdir)/anti.texi \
  $(srcdir)/back.texi \
  $(srcdir)/backups.texi \
  $(srcdir)/buffers.texi \
  $(srcdir)/calendar.texi \
  $(srcdir)/commands.texi \
  $(srcdir)/compile.texi \
  $(srcdir)/control.texi \
  $(srcdir)/customize.texi \
  $(srcdir)/debugging.texi \
  $(srcdir)/display.texi \
  $(srcdir)/edebug.texi \
  $(srcdir)/elisp.texi \
  $(srcdir)/errors.texi \
  $(srcdir)/eval.texi \
  $(srcdir)/files.texi \
  $(srcdir)/frames.texi \
  $(srcdir)/functions.texi \
  $(srcdir)/hash.texi \
  $(srcdir)/help.texi \
  $(srcdir)/hooks.texi \
  $(srcdir)/internals.texi \
  $(srcdir)/intro.texi \
  $(srcdir)/keymaps.texi \
  $(srcdir)/lists.texi \
  $(srcdir)/loading.texi \
  $(srcdir)/locals.texi \
  $(srcdir)/macros.texi \
  $(srcdir)/maps.texi \
  $(srcdir)/markers.texi \
  $(srcdir)/minibuf.texi \
  $(srcdir)/modes.texi \
  $(srcdir)/nonascii.texi \
  $(srcdir)/numbers.texi \
  $(srcdir)/objects.texi \
  $(srcdir)/os.texi \
  $(srcdir)/positions.texi \
  $(srcdir)/processes.texi \
  $(srcdir)/searching.texi \
  $(srcdir)/sequences.texi \
  $(srcdir)/streams.texi \
  $(srcdir)/strings.texi \
  $(srcdir)/symbols.texi \
  $(srcdir)/syntax.texi \
  $(srcdir)/text.texi \
  $(srcdir)/tips.texi \
  $(srcdir)/variables.texi \
  $(srcdir)/windows.texi \
  $(srcdir)/index.unperm \
  $(srcdir)/index.perm \
  $(srcdir)/gpl.texi \
  $(srcdir)/doclicense.texi


.PHONY: clean

# The info file is named `elisp'.
info: $(infodir)/elisp
	$(INSTALL_INFO) --info-dir=$(infodir) $(infodir)/elisp

$(infodir)/elisp: $(srcs) index.texi
	$(MAKEINFO) -I. -I$(srcdir) $(srcdir)/elisp.texi -o $(infodir)/elisp

elisp.dvi: $(srcs) index.texi
#	Avoid losing old contents of aux file entirely.
	-ren elisp.aux elisp.oaux
#	First shot to define xrefs.
	$(texinputdir) $(TEX) $(srcdir)/elisp.texi
	if not a$(permuted_index) == a  sh $(srcdir)/permute-index
	if not a$(permuted_index) == a  ren permuted.fns elisp.fns
	if not a$(permuted_index) == a  texindex elisp.tp
	if a$(permuted_index) == a  texindex elisp.??
	$(texinputdir) $(TEX) $(srcdir)/elisp.texi

index.texi:
	if a$(permuted_index) == a  cp $(srcdir)/index.unperm index.texi
	if not a$(permuted_index) == a  cp $(srcdir)/index.perm index.texi

clean:
	rm -f *.toc *.aux *.log *.cp *.cps *.fn *.fns *.tp *.tps \
              *.vr *.vrs *.pg *.pgs *.ky *.kys
	rm -f make.out core 
	rm -f index.texi
	rm -f $(infodir)/elisp*

distclean: clean

maintainer-clean: clean
	rm -f elisp elisp-* elisp.dvi elisp.oaux

# arch-tag: da68f1c2-536d-4d41-9150-7b01434eda3f
