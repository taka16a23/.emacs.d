#! /cygdrive/e/PERL/BIN/perl
'di ';
'ig 00 ';
#+##############################################################################
#
# texi2html: Program to transform Texinfo documents to HTML
#
#    Copyright (C) 1999, 2000  Free Software Foundation, Inc.
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# 
#-##############################################################################

# This requires perl version 5 or higher
require 5.0;

#++##############################################################################
#
# NOTE FOR DEBUGGING THIS SCRIPT:
# You can run 'perl texi2html.pl' directly, provided you have
# the environment variable T2H_HOME set to the directory containing
# the texi2html.init file
#
#--##############################################################################

# CVS version:
# $Id: texi2html.pl,v 1.9 2003/09/27 17:15:15 akihisa Exp $

# �����������Ѵ��饤�֥����ɤ߹���
if (-f "jcode.pl") {
  require "jcode.pl";
} else {
  &errexit("jcode.pl������ޤ���\n");
}

# Homepage:
$T2H_HOMEPAGE = <<EOT;
http://www.mathematik.uni-kl.de/~obachman/Texi2html
EOT

# Authors:  
$T2H_AUTHORS = <<EOT;
Written by: Lionel Cons <Lionel.Cons\@cern.ch> (original author)
            Karl Berry  <karl\@freefriends.org>
            Olaf Bachmann <obachman\@mathematik.uni-kl.de>
            and many others.
Maintained by: Olaf Bachmann <obachman\@mathematik.uni-kl.de>
Send bugs and suggestions to <texi2html\@mathematik.uni-kl.de>
EOT

# Version: set in configure.in
$THISVERSION = '1.64';
$THISPROG = "texi2html $THISVERSION";	# program name and version
  
# The man page for this program is included at the end of this file and can be
# viewed using the command 'nroff -man texi2html'.

# Identity:

$T2H_TODAY = &pretty_date;		# like "20 September 1993"
# the eval prevents this from breaking on system which do not have
# a proper getpwuid implemented
eval { ($T2H_USER = (getpwuid ($<))[6]) =~ s/,.*//;}; # Who am i

#+++############################################################################
#                                                                              #
# Initialization                                                               #
# Pasted content of File $(srcdir)/texi2html.init: Default initializations     # 
#                                                                              #
#---############################################################################

# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, if $ENV{T2H_HOME}/texi2html.init
# exists.

# 
# -*-perl-*-
######################################################################
# File: texi2html.init
#
# Sets default values for command-line arguments and for various customizable
# procedures
#
# A copy of this file is pasted into the beginning of texi2html by
# 'make texi2html'
#
# Copy this file and make changes to it, if you like.
# Afterwards, either, load it with command-line option -init_file <your_init_file>
#
# $Id: texi2html.pl,v 1.9 2003/09/27 17:15:15 akihisa Exp $

######################################################################
# stuff which can also be set by command-line options
#
#
# Note: values set here, overwrite values set by the command-line
# options before -init_file and might still be overwritten by
# command-line arguments following the -init_file option
#

# T2H_OPTIONS is a hash whose keys are the (long) names of valid
# command-line options and whose values are a hash with the following keys:
# type    ==> one of !|=i|:i|=s|:s (see GetOpt::Long for more info)
# linkage ==> ref to scalar, array, or subroutine (see GetOpt::Long for more info)
# verbose ==> short description of option (displayed by -h)
# noHelp  ==> if 1 -> for "not so important options": only print description on -h 1
#                2 -> for obsolete options: only print description on -h 2

$T2H_DEBUG = 0;
$T2H_OPTIONS -> {debug} =
{
 type => '=i',
 linkage => \$main::T2H_DEBUG,
 verbose => 'output HTML with debuging information',
};

$T2H_DOCTYPE = '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">'; 
$T2H_OPTIONS -> {doctype} = 
{
 type => '=s',
 linkage => \$main::T2H_DOCTYPE,
 verbose => 'document type which is output in header of HTML files',
 noHelp => 1
};

$T2H_CHECK = 0;
$T2H_OPTIONS -> {check} =
{
 type => '!',
 linkage => \$main::T2H_CHECK,
 verbose => 'if set, only check files and output all things that may be Texinfo commands',
 noHelp => 1
};

# -expand
# if set to "tex" (or, "info") expand @iftex and @tex (or, @ifinfo) sections
# else, neither expand @iftex, @tex, nor @ifinfo sections
$T2H_EXPAND = "info";
$T2H_OPTIONS -> {expand} = 
{
 type => '=s',
 linkage => \$T2H_EXPAND,
 verbose => 'Expand info|tex|none section of texinfo source',
};

# -glossary
# If set, uses section named `Footnotes' for glossary.
$T2H_USE_GLOSSARY = 0;
$T2H_OPTIONS -> {glossary} =
{
 type => '!',
 linkage => \$T2H_USE_GLOSSARY,
 verbose => "if set, uses section named `Footnotes' for glossary",
 noHelp  => 1,
};


# -invisible
# $T2H_INVISIBLE_MARK is the text used to create invisible destination
# anchors for index links (you can for instance use the invisible.xbm
# file shipped with this program). This is a workaround for a known
# bug of many WWW browsers, including netscape.
# For me, it works fine without it -- on the contrary: if there, it
# inserts space between headers and start of text (obachman 3/99)
$T2H_INVISIBLE_MARK = '';
# $T2H_INVISIBLE_MARK = '&#160;';
$T2H_OPTIONS -> {invisible} =
{
 type => '=s',
 linkage => \$T2H_INVISIBLE_MARK,
 verbose => 'use text in invisble anchot',
 noHelp  => 1,
};

# -iso
# if set, ISO8859 characters are used for special symbols (like copyright, etc)
$T2H_USE_ISO = 0;
$T2H_OPTIONS -> {iso} =
{
 type => 'iso',
 linkage => \$T2H_USE_ISO,
 verbose => 'if set, ISO8859 characters are used for special symbols (like copyright, etc)',
 noHelp => 1,
};

# -I
# list directories where @include files are searched for (besides the
# directory of the doc file) additional '-I' args add to this list
@T2H_INCLUDE_DIRS = (".");
$T2H_OPTIONS -> {I} =
{
 type => '=s',
 linkage => \@T2H_INCLUDE_DIRS,
 verbose => 'append $s to the @include search path',
};

# -top_file
# uses file of this name for top-level file
# extension is manipulated appropriately, if necessary.
# If empty, <basename of document>.html is used.
# Typically, you would set this to "index.html".
$T2H_TOP_FILE = '';
$T2H_OPTIONS -> {top_file} =
{
 type => '=s',
 linkage => \$T2H_TOP_FILE,
 verbose => 'use $s as top file, instead of <docname>.html',
};


# -toc_file
# uses file of this name for table of contents.  File
# extension is manipulated appropriately, if necessary.
# If empty, <basename of document>_toc.html is used.
$T2H_TOC_FILE = '';
$T2H_OPTIONS -> {toc_file} =
{
 type => '=s',
 linkage => \$T2H_TOC_FILE,
 verbose => 'use $s as ToC file, instead of <docname>_toc.html',
};

# -frames
# if set, output two additional files which use HTML 4.0 "frames".
$T2H_FRAMES = 0;
$T2H_OPTIONS -> {frames} =
{
 type => '!',
 linkage => \$T2H_FRAMES,
 verbose => 'output files which use HTML 4.0 frames (experimental)',
 noHelp => 1,
};


# -menu | -nomenu
# if set, show the Texinfo menus
$T2H_SHOW_MENU = 1;
$T2H_OPTIONS -> {menu} =
{
 type => '!',
 linkage => \$T2H_SHOW_MENU,
 verbose => 'ouput Texinfo menus',
};

# -number | -nonumber
# if set, number sections and show section names and numbers in references 
# and menus
$T2H_NUMBER_SECTIONS = 1;
$T2H_OPTIONS -> {number} =
{
 type => '!',
 linkage => \$T2H_NUMBER_SECTIONS,
 verbose => 'use numbered sections'
};

# if set, and T2H_NUMBER_SECTIONS is set, then use node names in menu
# entries, instead of section names
$T2H_NODE_NAME_IN_MENU = 0;

# if set and menu entry equals menu descr, then do not print menu descr.
# Likewise, if node name equals entry name, do not print entry name.
$T2H_AVOID_MENU_REDUNDANCY = 1;

# -split section|chapter|none 
# if set to 'section' (resp. 'chapter') create one html file per (sub)section
# (resp. chapter) and separate pages for Top, ToC, Overview, Index,
# Glossary, About.
# Otherwise, create a monolithic html file that contains the whole document.
#$T2H_SPLIT = 'section';
$T2H_SPLIT = '';
$T2H_OPTIONS -> {split} =
{
 type => '=s',
 linkage => \$T2H_SPLIT,
 verbose => 'split document on section|chapter else no splitting',
};

# -section_navigation|-no-section_navigation
# if set, then navigation panels are printed at the beginning of each section
# and, possibly at the end (depending on whether or not there were more than 
# $T2H_WORDS_IN_PAGE  words on page
# This is most useful if you do not want to have section navigation 
# on -split chapter
$T2H_SECTION_NAVIGATION = 1;
$T2H_OPTIONS -> {sec_nav} =
{
 type => '!',
 linkage => \$T2H_SECTION_NAVIGATION,
 verbose => 'output navigation panels for each section',
};

# -subdir
# If set, then put result files into specified directory.
# If not set, then result files are put into current directory.
#$T2H_SUBDIR = 'html';
$T2H_SUBDIR = '';
$T2H_OPTIONS -> {subdir} =
{
 type => '=s',
 linkage => \$T2H_SUBDIR,
 verbose => 'put HTML files in directory $s, instead of $cwd',
};

# -short_extn
# If this is set, then all HTML file will have extension ".htm" instead of
# ".html".  This is helpful when shipping the document to DOS-based systems.
$T2H_SHORTEXTN = 0;
$T2H_OPTIONS -> {short_ext} =
{
 type => '!',
 linkage => \$T2H_SHORTEXTN,
 verbose => 'use "htm" extension for output HTML files',
};


# -prefix
# Set the output file prefix, prepended to all .html, .gif and .pl files.
# By default, this is the basename of the document
$T2H_PREFIX = '';
$T2H_OPTIONS -> {prefix} =
{
 type => '=s',
 linkage => \$T2H_PREFIX,
 verbose => 'use as prefix for output files, instead of <docname>',
};

# -o filename
# If set, generate monolithic document output html into $filename
$T2H_OUT = '';
$T2H_OPTIONS -> {out_file} =
{
 type => '=s',
 linkage => sub {$main::T2H_OUT = @_[1]; $T2H_SPLIT = '';},
 verbose => 'if set, all HTML output goes into file $s',
};

# -short_ref
#if set cross-references are given without section numbers
$T2H_SHORT_REF = '';
$T2H_OPTIONS -> {short_ref} =
{
 type => '!',
 linkage => \$T2H_SHORT_REF,
 verbose => 'if set, references are without section numbers',
};

# -idx_sum
# if value is set, then for each @prinindex $what
# $docu_name_$what.idx is created which contains lines of the form
# $key\t$ref sorted alphabetically (case matters)
$T2H_IDX_SUMMARY = 0;
$T2H_OPTIONS -> {idx_sum} =
{
 type => '!',
 linkage => \$T2H_IDX_SUMMARY,
 verbose => 'if set, also output index summary',
 noHelp  => 1,
};

# -def_table
# Use a table construction for @def .... stuff instead
# New Option: 27.07.2000 Karl Heinz Marbaise
$T2H_DEF_TABLE = 0;
$T2H_OPTIONS -> {def_table} =
{
 type => '!',
 linkage => \$T2H_DEF_TABLE,
 verbose => 'if set, \@def.. are converted using tables.',
 noHelp  => 1,
};

# -verbose
# if set, chatter about what we are doing
$T2H_VERBOSE = '';
$T2H_OPTIONS -> {Verbose} =
{
 type => '!',
 linkage => \$T2H_VERBOSE,
 verbose => 'print progress info to stdout',
};

# -lang
# For page titles use $T2H_WORDS->{$T2H_LANG}->{...} as title.
# To add a new language, supply list of titles (see $T2H_WORDS below).
# and use ISO 639 language codes (see e.g. perl module Locale-Codes-1.02 
# for  definitions)
# Default's to 'en' if not set or no @documentlanguage is specified
$T2H_LANG = '';
$T2H_OPTIONS -> {lang} =
{
 type => '=s',
 linkage => sub {SetDocumentLanguage($_[1])},
 verbose => 'use $s as document language (ISO 639 encoding)',
};

# -l2h
# if set, uses latex2html for generation of math content 
$T2H_L2H = '';
$T2H_OPTIONS -> {l2h} =
{
 type => '!',
 linkage => \$T2H_L2H,
 verbose => 'if set, uses latex2html for @math and @tex',
};

######################
# The following options are only relevant if $T2H_L2H is set
#
# -l2h_l2h
# name/location of latex2html program
$T2H_L2H_L2H = "latex2html";
$T2H_OPTIONS -> {l2h_l2h} =
{
 type => '=s',
 linkage => \$T2H_L2H_L2H,
 verbose => 'program to use for latex2html translation',
 noHelp => 1,
};

# -l2h_skip
# If set, skips actual call to latex2html: tries to reuse previously generated 
# content, instead.
$T2H_L2H_SKIP = '';
$T2H_OPTIONS -> {l2h_skip} =
{
 type => '!',
 linkage => \$T2H_L2H_SKIP,
 verbose => 'if set, tries to reuse previously latex2html output',
 noHelp => 1,
};

# -l2h_tmp
# If set, l2h uses the specified directory for temporary files.  The
# path leading to this directory may not contain a dot (i.e., a ".");
# otherwise, l2h will fail.
$T2H_L2H_TMP = '';
$T2H_OPTIONS -> {l2h_tmp} =
{
 type => '=s',
 linkage => \$T2H_L2H_TMP,
 verbose => 'if set, uses $s as temporary latex2html directory',
 noHelp => 1,
};

# if set, cleans intermediate files (they all have the prefix $doc_l2h_) 
# of l2h 
$T2H_L2H_CLEAN = 1;
$T2H_OPTIONS -> {l2h_clean} =
{
 type => '!',
 linkage => \$T2H_L2H_CLEAN,
 verbose => 'if set, do not keep intermediate latex2html files for later reuse',
 noHelp => 1,
};

$T2H_OPTIONS -> {D} =
{
 type => '=s',
 linkage => sub {$main::value{@_[1]} = 1;},
 verbose => 'equivalent to Texinfo "@set $s 1"',
 noHelp => 1,
};

$T2H_OPTIONS -> {init_file} =
{
 type => '=s',
 linkage => \&LoadInitFile,
 verbose => 'load init file $s'
};


##############################################################################
#
# The following can only be set in the init file
#
##############################################################################

# if set, center @image by default
# otherwise, do not center by default
$T2H_CENTER_IMAGE = 1;

# used as identation for block enclosing command @example, etc
# If not empty, must be enclosed in <td></td>
$T2H_EXAMPLE_INDENT_CELL = '<td>&nbsp;</td>';
# same as above, only for @small
$T2H_SMALL_EXAMPLE_INDENT_CELL = '<td>&nbsp;</td>';
# font size for @small
$T2H_SMALL_FONT_SIZE = '-1';

# if non-empty, and no @..heading appeared in Top node, then
# use this as header for top node/section, otherwise use value of 
# @settitle or @shorttitle (in that order)
$T2H_TOP_HEADING = '';

# if set, use this chapter for 'Index' button, else
# use first chapter whose name matches 'index' (case insensitive)
$T2H_INDEX_CHAPTER = 'Index';

# if set and $T2H_SPLIT is set, then split index pages at the next letter
# after they have more than that many entries
$T2H_SPLIT_INDEX = 100000;

# if set (e.g., to index.html) replace hrefs to this file 
# (i.e., to index.html) by ./
$T2H_HREF_DIR_INSTEAD_FILE = '';

########################################################################
# Language dependencies: 
# To add a new language extend T2H_WORDS hash and create $T2H_<...>_WORDS hash
# To redefine one word, simply do:
# $T2H_WORDS->{<language>}->{<word>} = 'whatever' in your personal init file.
#
$T2H_WORDS_EN =
{
 # titles  of pages
 'ToC_Title' => 'Emacs Lisp ��ե���󥹥ޥ˥奢��',
 'Overview_Title' => '�ܼ�',
 'Index_Title' => '����',
 'About_Title' => '����ʸ��ˤĤ���',
 'Footnotes_Title' => '����',
 'See' => 'See',
 'see' => 'see',
 'section' => '��',
#  'ToC_Title' => 'Meadow memo',
#  'Overview_Title' => 'Short Table of Contents',
#  'Index_Title' => 'Index',
#  'About_Title' => 'About this document',
#  'Footnotes_Title' => 'Footnotes',
#  'See' => 'See',
#  'see' => 'see',
#  'section' => 'section',
 
# If necessary, we could extend this as follows: 
#  # text for buttons
#  'Top_Button' => 'Top',
#  'ToC_Button' => 'Contents',
#  'Overview_Button' => 'Overview',
#  'Index_button' => 'Index',
#  'Back_Button' => 'Back',
#  'FastBack_Button' => 'FastBack',
#  'Prev_Button' => 'Prev',
#  'Up_Button' => 'Up',
#  'Next_Button' => 'Next',
#  'Forward_Button' =>'Forward',
#  'FastWorward_Button' => 'FastForward',
#  'First_Button' => 'First',
#  'Last_Button' => 'Last',
#  'About_Button' => 'About'
};

$T2H_WORD_DE =
{
 'ToC_Title' => 'Inhaltsverzeichniss',
 'Overview_Title' => 'Kurzes Inhaltsverzeichniss',
 'Index_Title' => 'Index',
 'About_Title' => '&Uuml;ber dieses Dokument',
 'Footnotes_Title' => 'Fu&szlig;noten',
 'See' => 'Siehe',
 'see' => 'siehe',
 'section' => 'Abschnitt',
};

$T2H_WORD_NL =
{
 'ToC_Title' => 'Inhoudsopgave',
 'Overview_Title' => 'Korte inhoudsopgave',
 'Index_Title' => 'Index', #Not sure ;-)
 'About_Title' => 'No translation available!', #No translation available!
 'Footnotes_Title' => 'No translation available!', #No translation available!
 'See' => 'Zie',
 'see' => 'zie',
 'section' => 'sectie',
};

$T2H_WORD_ES =
{
 'ToC_Title' => '&iacute;ndice General',
 'Overview_Title' => 'Resumen del Contenido',
 'Index_Title' => 'Index', #Not sure ;-)
 'About_Title' => 'No translation available!', #No translation available!
 'Footnotes_Title' => 'Fu&szlig;noten',
 'See' => 'V&eacute;ase',
 'see' => 'v&eacute;ase',
 'section' => 'secci&oacute;n',
};

$T2H_WORD_NO =
{
 'ToC_Title' => 'Innholdsfortegnelse',
 'Overview_Title' => 'Kort innholdsfortegnelse',
 'Index_Title' => 'Indeks', #Not sure ;-)
 'About_Title' => 'No translation available!', #No translation available!
 'Footnotes_Title' => 'No translation available!',
 'See' => 'Se',
 'see' => 'se',
 'section' => 'avsnitt',
};

$T2H_WORD_PT =
{
 'ToC_Title' => 'Sum&aacute;rio',
 'Overview_Title' => 'Breve Sum&aacute;rio',
 'Index_Title' => '&Iacute;ndice', #Not sure ;-)
 'About_Title' => 'No translation available!', #No translation available!
 'Footnotes_Title' => 'No translation available!',
 'See' => 'Veja',
 'see' => 'veja',
 'section' => 'Se&ccedil;&atilde;o',
};

$T2H_WORDS =
{
 'en' => $T2H_WORDS_EN,
 'de' => $T2H_WORDS_DE,
 'nl' => $T2H_WORDS_NL,
 'es' => $T2H_WORDS_ES,
 'no' => $T2H_WORDS_NO,
 'pt' => $T2H_WORDS_PT
};

@MONTH_NAMES_EN =
(
 'January', 'February', 'March', 'April', 'May',
 'June', 'July', 'August', 'September', 'October',
 'November', 'December'
);

@MONTH_NAMES_DE =
(
 'Januar', 'Februar', 'M&auml;rz', 'April', 'Mai',
 'Juni', 'Juli', 'August', 'September', 'Oktober',
 'November', 'Dezember'
);

@MONTH_NAMES_NL =
(
 'Januari', 'Februari', 'Maart', 'April', 'Mei',
 'Juni', 'Juli', 'Augustus', 'September', 'Oktober',
 'November', 'December'
);

@MONTH_NAMES_ES =
(
 'enero', 'febrero', 'marzo', 'abril', 'mayo',
 'junio', 'julio', 'agosto', 'septiembre', 'octubre',
 'noviembre', 'diciembre'
);

@MONTH_NAMES_NO =
(

 'januar', 'februar', 'mars', 'april', 'mai',
 'juni', 'juli', 'august', 'september', 'oktober',
 'november', 'desember'
);

@MONTH_NAMES_PT =
(
 'Janeiro', 'Fevereiro', 'Mar&ccedil;o', 'Abril', 'Maio',
 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro',
 'Novembro', 'Dezembro'
);


$MONTH_NAMES =
{
    'en' => \@MONTH_NAMES_EN,
    'de' => \@MONTH_NAMES_DE,
    'es' => \@MONTH_NAMES_ES,
    'nl' => \@MONTH_NAMES_NL,
    'no' => \@MONTH_NAMES_NO,
    'pt' => \@MONTH_NAMES_PT
};
########################################################################
# Control of Page layout:
# You can make changes of the Page layout at two levels:
# 1.) For small changes, it is often enough to change the value of
#     some global string/hash/array variables
# 2.) For larger changes, reimplement one of the T2H_DEFAULT_<fnc>* routines,
#     give them another name, and assign them to the respective
#     $T2H_<fnc> variable.

# As a general interface, the hashes T2H_HREF, T2H_NAME, T2H_NODE hold 
# href, html-name, node-name of
# This     -- current section (resp. html page)
# Top      -- top page ($T2H_TOP_FILE)
# Contents -- Table of contents
# Overview -- Short table of contents
# Index    -- Index page
# About    -- page which explain "navigation buttons"
# First    -- first node 
# Last     -- last node
#
# Whether or not the following hash values are set, depends on the context 
# (all values are w.r.t. 'This' section)
# Next        -- next node of texinfo
# Prev        -- previous node of texinfo
# Up          -- up node of texinfo
# Forward     -- next node in reading order
# Back        -- previous node in reading order
# FastForward -- if leave node, up and next, else next node
# FastBackward-- if leave node, up and prev, else prev node
#
# Furthermore, the following global variabels are set:
# $T2H_THISDOC{title}     -- title as set by @setttile
# $T2H_THISDOC{fulltitle} -- full title as set by @title...
# $T2H_THISDOC{subtitle}  -- subtitle as set by @subtitle
# $T2H_THISDOC{author}    -- author as set by @author
# 
# and pointer to arrays of lines which need to be printed by t2h_print_lines 
# $T2H_OVERVIEW      -- lines of short table of contents
# $T2H_TOC           -- lines of table of contents
# $T2H_TOP           -- lines of Top texinfo node 
# $T2H_THIS_SECTION  -- lines of 'This' section

#
# There are the following subs which control the layout:
#
$T2H_print_section            = \&T2H_DEFAULT_print_section;
$T2H_print_Top_header         = \&T2H_DEFAULT_print_Top_header;       
$T2H_print_Top_footer	      = \&T2H_DEFAULT_print_Top_footer;       
$T2H_print_Top		      = \&T2H_DEFAULT_print_Top;              
$T2H_print_Toc		      = \&T2H_DEFAULT_print_Toc;              
$T2H_print_Overview	      = \&T2H_DEFAULT_print_Overview;         
$T2H_print_Footnotes	      = \&T2H_DEFAULT_print_Footnotes;        
$T2H_print_About	      = \&T2H_DEFAULT_print_About;            
$T2H_print_misc_header	      = \&T2H_DEFAULT_print_misc_header;      
$T2H_print_misc_footer	      = \&T2H_DEFAULT_print_misc_footer;      
$T2H_print_misc		      = \&T2H_DEFAULT_print_misc;
$T2H_print_chapter_header     = \&T2H_DEFAULT_print_chapter_header;      
$T2H_print_chapter_footer     = \&T2H_DEFAULT_print_chapter_footer;      
$T2H_print_page_head	      = \&T2H_DEFAULT_print_page_head;        
$T2H_print_page_foot	      = \&T2H_DEFAULT_print_page_foot;        
$T2H_print_head_navigation    = \&T2H_DEFAULT_print_head_navigation;  
$T2H_print_foot_navigation    = \&T2H_DEFAULT_print_foot_navigation;  
$T2H_button_icon_img	      = \&T2H_DEFAULT_button_icon_img;        
$T2H_print_navigation	      = \&T2H_DEFAULT_print_navigation;       
$T2H_about_body		      = \&T2H_DEFAULT_about_body;            
$T2H_print_frame              = \&T2H_DEFAULT_print_frame;
$T2H_print_toc_frame          = \&T2H_DEFAULT_print_toc_frame;

########################################################################
# Layout for html for every sections
#
sub T2H_DEFAULT_print_section
{
  my $fh = shift;
  local $T2H_BUTTONS = \@T2H_SECTION_BUTTONS;
  &$T2H_print_head_navigation($fh) if $T2H_SECTION_NAVIGATION;
  my $nw = t2h_print_lines($fh);
  if ($T2H_SPLIT eq 'section' && $T2H_SECTION_NAVIGATION)
  {
    &$T2H_print_foot_navigation($fh, $nw);
  }
  else
  {
    print $fh '<HR SIZE="6">' . "\n";
  }
}

###################################################################
# Layout of top-page I recommend that you use @ifnothtml, @ifhtml,
# @html within the Top texinfo node to specify content of top-level
# page. 
#
# If you enclose everything in @ifnothtml, then title, subtitle,
# author and overview is printed
# T2H_HREF of Next, Prev, Up, Forward, Back are not defined
# if $T2H_SPLIT then Top page is in its own html file
sub T2H_DEFAULT_print_Top_header
{
  &$T2H_print_page_head(@_) if $T2H_SPLIT;
  t2h_print_label(@_); # this needs to be called, otherwise no label set
  &$T2H_print_head_navigation(@_);
}
sub T2H_DEFAULT_print_Top_footer
{
  &$T2H_print_foot_navigation(@_);
  &$T2H_print_page_foot(@_) if $T2H_SPLIT; 
}
sub T2H_DEFAULT_print_Top
{
  my $fh = shift;

  # for redefining navigation buttons use:
  # local $T2H_BUTTONS = [...];
  # as it is, 'Top', 'Contents', 'Index', 'About' are printed
  local $T2H_BUTTONS = \@T2H_MISC_BUTTONS;
  &$T2H_print_Top_header($fh);
  if ($T2H_THIS_SECTION)
  {
    # if top-level node has content, then print it with extra header
    print $fh "<H1>$T2H_NAME{Top}</H1><FORM METHOD=\"GET\" ACTION=\"http://www.bookshelf.jp/cgi-bin/wwwsrch.cgi\"><div class=\"info\">����<INPUT TYPE=text NAME=WORD SIZE=30><INPUT TYPE=hidden NAME=dir VALUE=$texi_name_sarchcgi><INPUT TYPE=hidden NAME=index VALUE=dirsearch CHECKED><INPUT TYPE=hidden NAME=target VALUE=all CHECKED><INPUT TYPE=hidden NAME=ANDOR VALUE=and CHECKED><INPUT TYPE=radio NAME=lisp VALUE=off CHECKED>��ʸ<INPUT TYPE=radio NAME=lisp VALUE=on>Elisp<INPUT TYPE=submit VALUE=\"����\"></div></FORM>"
      unless ($T2H_HAS_TOP_HEADING);
    t2h_print_lines($fh, $T2H_THIS_SECTION)
  }
  else
  {
    # top-level node is fully enclosed in @ifnothtml
    # print fulltitle, subtitle, author, Overview
    print $fh 
      "<CENTER>\n<H1>" .
      join("</H1>\n<H1>", split(/\n/,  $T2H_THISDOC{fulltitle})) .
      "</H1>\n";
    print $fh "<H2>$T2H_THISDOC{subtitle}</H2>\n" if $T2H_THISDOC{subtitle};
    print $fh "$T2H_THISDOC{author}\n" if $T2H_THISDOC{author};
    print $fh <<EOT;
</CENTER>
<HR>
<P>
<H2> Overview: </H2>
<BLOCKQUOTE>  
EOT
    t2h_print_lines($fh, $T2H_OVERVIEW);
    print $fh "</BLOCKQUOTE>\n";
  }
  &$T2H_print_Top_footer($fh);
}

###################################################################
# Layout of Toc, Overview, and Footnotes pages
# By default, we use "normal" layout 
# T2H_HREF of Next, Prev, Up, Forward, Back, etc are not defined
# use: local $T2H_BUTTONS = [...] to redefine navigation buttons
sub T2H_DEFAULT_print_Toc
{
  return &$T2H_print_misc(@_);
}
sub T2H_DEFAULT_print_Overview
{
  return &$T2H_print_misc(@_);
}
sub T2H_DEFAULT_print_Footnotes
{
  return &$T2H_print_misc(@_);
}
sub T2H_DEFAULT_print_About
{
  return &$T2H_print_misc(@_);
}

sub T2H_DEFAULT_print_misc_header
{
  &$T2H_print_page_head(@_) if $T2H_SPLIT;
  # this needs to be called, otherwise, no labels are set
  t2h_print_label(@_); 
  &$T2H_print_head_navigation(@_);
}
sub T2H_DEFAULT_print_misc_footer
{
  &$T2H_print_foot_navigation(@_);
  &$T2H_print_page_foot(@_) if $T2H_SPLIT; 
}
sub T2H_DEFAULT_print_misc
{
  my $fh = shift;
  local $T2H_BUTTONS = \@T2H_MISC_BUTTONS;
  &$T2H_print_misc_header($fh);
  print $fh "<H1>$T2H_NAME{This}</H1>\n";
  t2h_print_lines($fh);
  &$T2H_print_misc_footer($fh);
}

###################################################################
# chapter_header and chapter_footer are only called if
# T2H_SPLIT eq 'chapter'
# chapter_header: after print_page_header, before print_section
# chapter_footer: after print_section of last section, before print_page_footer
# 
# If you want to get rid of navigation stuff after each section,
# redefine print_section such that it does not call print_navigation,
# and put print_navigation into print_chapter_header
@T2H_CHAPTER_BUTTONS =
  (
   'FastBack', 'FastForward', ' ', 
   ' ', ' ', ' ', ' ',
##   'Top', 'Contents', 'Index', 'About', 
   'Top', 'Contents', 'Index', 
  );

sub T2H_DEFAULT_print_chapter_header
{
  # nothing to do there, by default
  if (! $T2H_SECTION_NAVIGATION)
  {
    my $fh = shift;
    local $T2H_BUTTONS = \@T2H_CHAPTER_BUTTONS;
    &$T2H_print_navigation($fh);
    print $fh "\n<HR SIZE=2>\n";
  }
  
}

sub T2H_DEFAULT_print_chapter_footer
{
  local $T2H_BUTTONS = \@T2H_CHAPTER_BUTTONS;
  &$T2H_print_navigation(@_);
}
###################################################################
$T2H_TODAY = &pretty_date;		# like "20 September 1993"

sub pretty_date {
    local($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst);

    ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
    $year += ($year < 70) ? 2000 : 1900;
    # obachman: Let's do it as the Americans do
    return($MONTH_NAMES->{$T2H_LANG}[$mon] . ", " . $mday . " " . $year);
}


###################################################################
# Layout of standard header and footer
#

# Set the default body text, inserted between <BODY ... > 
###$T2H_BODYTEXT = 'LANG="EN" BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#800080" ALINK="#FF0000"';
##$T2H_BODYTEXT = 'LANG="' . $T2H_LANG . '" BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#800080" ALINK="#FF0000"';
$T2H_BODYTEXT = 'LANG="ja" BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#800080" ALINK="#FF0000"';
# text inserted after <BODY ...>
$T2H_AFTER_BODY_OPEN = '';
#text inserted before </BODY>
$T2H_PRE_BODY_CLOSE = '';
# this is used in footer
$T2H_ADDRESS = "by <I>$T2H_USER</I> " if $T2H_USER;
$T2H_ADDRESS .= "on <I>$T2H_TODAY</I>";
# this is added inside <HEAD></HEAD> after <TITLE> and some META NAME stuff
# can be used for <style> <script>, <meta> tags
# <link rel="StyleSheet" href="meadow.css" type="text/css" id="css1">
$T2H_EXTRA_HEAD = '
<META http-equiv="Content-Style-Type" content="text/css">
<!-- ������ �����ܸ�EUC��Ƚ���к��Ѥ餷��; -->
<link rel="StyleSheet" href="../../../../soft/css/midnight.css" type="text/css" id="css1">
<script type="text/javascript" src="style1.js"></script>
<link rel="stylesheet" type="text/css" href="../../../../soft/css/meadowmemo.css">
';
#  <META HTTP-EQUIV="Content-Type" CONTENT="text/html;CHARSET=iso-2022-jp">

# init routines is before first output is generated
sub T2H_InitGlobals
{
  # Set the default body text, inserted between <BODY ... > 
  ## $T2H_BODYTEXT = 'LANG="' . $T2H_LANG . '" BGCOLOR="#FFFFFF" TEXT="#000000" LINK="#0000FF" VLINK="#800080" ALINK="#FF0000"';
  # text inserted after <BODY ...>
  $T2H_AFTER_BODY_OPEN = '';
  #text inserted before </BODY>
  $T2H_PRE_BODY_CLOSE = '';
  # this is used in footer
  $T2H_ADDRESS = "by <I>$T2H_USER</I> " if $T2H_USER;
  $T2H_ADDRESS .= "on <I>$T2H_TODAY</I>";
  # this is added inside <HEAD></HEAD> after <TITLE> and some META NAME stuff
  # can be used for <style> <script>, <meta> tags
  $T2H_EXTRA_HEAD = '';
}

sub T2H_DEFAULT_print_page_head
{
  my $fh = shift; 
  my $longtitle = "$T2H_THISDOC{title}: $T2H_NAME{mytitle}";
  # Add <link> tags to help document navigation.
  my $link = sprintf( <<'__link_tags__', $T2H_HREF{Contents}, $T2H_HREF{Index}, $T2H_HREF{FastForward} || $T2H_HREF{Forward} || $T2H_HREF{First}, $T2H_HREF{FastBack} || $T2H_HREF{Back} || $T2H_HREF{Last} || $T2H_HREF{Top} );

<LINK REL="contents" HREF="%s">
<LINK REL="index" HREF="%s">
<LINK REL="next" HREF="%s">
<LINK REL="prev" HREF="%s">
__link_tags__
  print $fh <<EOT;
$T2H_DOCTYPE
<HTML lang="ja">
<!-- Created on $T2H_TODAY by $THISPROG -->
<!-- 
$T2H_AUTHORS 
-->
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html;CHARSET=euc-jp">
<META NAME="keywords" CONTENT="meadow,mule,emacs,lisp,elisp,gnus,setting,����,unix,cygwin">
<META http-equiv="Content-Script-Type" content="text/javascript">
<META NAME="description" CONTENT="Meadow�������Ҳ𤹤�ڡ����Ǥ�">
<TITLE>$longtitle</TITLE>

<META NAME="description" CONTENT="$longtitle">
<META NAME="keywords" CONTENT="$longtitle">
<META NAME="resource-type" CONTENT="document">
<META NAME="distribution" CONTENT="global">
<META NAME="Generator" CONTENT="$THISPROG">
$link$T2H_EXTRA_HEAD
</HEAD>
<BODY $T2H_BODYTEXT>
<!--Infoseek Analyzer start-->
<script LANGUAGE="javascript">PgNo=6;</script>
<script src="http://js1.infoseek.co.jp/bin/57/00170.js"></script>
<noscript><a href="http://ax1.www.infoseek.co.jp/bin/go?0017057f" target="_blank">
<img src="http://ax1.www.infoseek.co.jp/bin/logo?0017057f" border=0></a></noscript>
<!--Infoseek Analyzer end-->
<a name=\"top\"> </a>
$T2H_AFTER_BODY_OPEN
EOT
}
##<BODY $T2H_BODYTEXT>

sub T2H_DEFAULT_print_page_foot
{
  my $fh = shift;
  print $fh <<EOT;
<a name="bottom"> </a>
<script type="text/javascript" src="style2.js"></script>
<div class=\"footer\">
    <br>
    ���Υڡ�����Meadow (Emacs) �ξҲ�ڡ����Ǥ� <br>
����Web�ڡ����γ�ʸ��ϼ�ͳ�˥�󥯡�ʣ���������ۡ����Ѥ��Ƥ��������ƹ����ޤ���
<br>��������ʣ���������ۡ����Ѥξ��� Meadow Memo ��URL�򵭺ܤ��Ƥ����Ʋ�������<br>
<a href=\"http://www.bookshelf.jp/cgi-bin/goto.cgi?file=meadow&node=about%20link\">Medow memo�ؤΥ�󥯤ˤĤ���</a>��<br>

�ְ㤤����˾���������<a href=\"mailto:akihisa\@mail.ne.jp\">akihisa\@mail.ne.jp</a> �������Ǥɤ���<br>

<br>

<FORM METHOD="post" ACTION="http://www.bookshelf.jp/cgi-bin/wwwmail.cgi" >
��̾����<INPUT TYPE="text" NAME="name" SIZE="30" MAXLENGTH="40" VALUE="�ʤʤ�����"><br>
�᡼�륢�ɥ쥹��<INPUT TYPE="text" NAME="EMAIL" SIZE="25" MAXLENGTH="60" VALUE="secret\@mail.adr"><br>
<input type="hidden" name="HPAGE" value="">
�Ĥä��ߡ�<br><TEXTAREA NAME="MESSAGE" ROWS="5" COLS="50">
</TEXTAREA><br><br>
<INPUT TYPE="submit" VALUE="����">
<INPUT TYPE="reset" VALUE="���ꥢ">
</FORM>

<br><A HREF="http://www.bookshelf.jp/cgi-bin/xct.cgi">�ڡ����̥�����</a>
<br> Since 2002/12/13 <br>
</div>

</BODY>

</HTML>
EOT
}

###################################################################
# Layout of navigation panel

# if this is set, then a vertical navigation panel is used
$T2H_VERTICAL_HEAD_NAVIGATION = 0;
sub T2H_DEFAULT_print_head_navigation
{
  my $fh = shift;
  if ($T2H_VERTICAL_HEAD_NAVIGATION)
  {
    print $fh <<EOT;
<TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR VALIGN="TOP">
<TD ALIGN="LEFT">
EOT
  }
  &$T2H_print_navigation($fh, $T2H_VERTICAL_HEAD_NAVIGATION);
  if ($T2H_VERTICAL_HEAD_NAVIGATION)
  {
    print $fh <<EOT;
</TD>
<TD ALIGN="LEFT">
EOT
  }
  elsif ($T2H_SPLIT eq 'section')
  {
    print $fh "<HR SIZE=1>\n";
  }
}

# Specifies the minimum page length required before a navigation panel
# is placed at the bottom of a page (the default is that of latex2html)
# T2H_THIS_WORDS_IN_PAGE holds number of words of current page
$T2H_WORDS_IN_PAGE = 300;
sub T2H_DEFAULT_print_foot_navigation
{
  my $fh = shift;
  my $nwords = shift;
  if ($T2H_VERTICAL_HEAD_NAVIGATION)
  {
    print $fh <<EOT;
</TD>
</TR>
</TABLE>
EOT
  }
  print $fh "<HR SIZE=1>\n";
  &$T2H_print_navigation($fh) if ($nwords >= $T2H_WORDS_IN_PAGE)
}

######################################################################
# navigation panel
#
# specify in this array which "buttons" should appear in which order
# in the navigation panel for sections; use ' ' for empty buttons (space)
@T2H_SECTION_BUTTONS =
  (
   'Back', 'Forward', ' ', 'FastBack', 'Up', 'FastForward',  
   ' ', ' ', ' ', ' ',
   ## about��ä�
##   'Top', 'Contents', 'Index', 'About', 
   'Top', 'Contents', 'Index', 
  );

# buttons for misc stuff
##@T2H_MISC_BUTTONS = ('Top', 'Contents', 'Index', 'About');
@T2H_MISC_BUTTONS = ('Top', 'Contents', 'Index');

# insert here name of icon images for buttons 
# Icons are used, if $T2H_ICONS and resp. value are set
%T2H_ACTIVE_ICONS =
  (
   'Top',      '',
   'Contents', '',
   'Overview', '',
   'Index',    '',
   'Back',     '',
   'FastBack', '',
   'Prev',     '',
   'Up',       '',
   'Next',     '',
   'Forward',  '',
   'FastForward', '',
   'About' ,    '',
   'First',    '',
   'Last',     '',
   ' ',        ''
  );

# insert here name of icon images for these, if button is inactive
%T2H_PASSIVE_ICONS =
  (
   'Top',      '',
   'Contents', '',
   'Overview', '',
   'Index',    '',
   'Back',     '',
   'FastBack', '',
   'Prev',     '',
   'Up',       '',
   'Next',     '',
   'Forward',  '',
   'FastForward', '',
   'About',     '',
   'First',    '',
   'Last',     '',
  );

# how to create IMG tag
sub T2H_DEFAULT_button_icon_img
{
  my $button = shift;
  my $icon = shift;
  my $name = shift;
  return qq{<IMG SRC="$icon" BORDER="0" ALT="$button: $name" ALIGN="MIDDLE">};
}

# Names of text as alternative for icons
%T2H_NAVIGATION_TEXT =
  (
   'Top',      'ɽ��',
   'Contents', '�ܼ�',
   'Overview', '����',
   'Index',    '����',
   ' ',        ' &nbsp; ',
   'Back',     ' &lt; ',
   'FastBack', ' &lt;&lt; ',
   'Prev',     '����',
   'Up',       ' Up ',
   'Next',     '����',
   'Forward',  ' &gt; ',
   'FastForward',  ' &gt;&gt; ',
   'About',     ' ? ',
   'First',    ' |&lt; ',
   'Last',     ' &gt;| '
#    'Top',      'Top',
#    'Contents', 'Contents',
#    'Overview', 'Overview',
#    'Index',    'Index',
#    ' ',        ' &nbsp; ',
#    'Back',     ' &lt; ',
#    'FastBack', ' &lt;&lt; ',
#    'Prev',     'Prev',
#    'Up',       ' Up ',
#    'Next',     'Next',
#    'Forward',  ' &gt; ',
#    'FastForward',  ' &gt;&gt; ',
#    'About',     ' ? ',
#    'First',    ' |&lt; ',
#    'Last',     ' &gt;| '
  );

sub T2H_DEFAULT_print_navigation
{
  my $fh = shift;
  my $vertical = shift;
  my $spacing = 1;
  print $fh "<TABLE CELLPADDING=$spacing CELLSPACING=$spacing BORDER=0>\n";

  print $fh "<TR>" unless $vertical;
  for $button (@$T2H_BUTTONS)
  {
    print $fh qq{<TR VALIGN="TOP" ALIGN="LEFT">\n} if $vertical;
    print $fh qq{<TD VALIGN="MIDDLE" ALIGN="LEFT">};

    if (ref($button) eq 'CODE')
    {
      &$button($fh, $vertical);
    }
    elsif ($button eq ' ')
    { # handle space button
      print $fh 
	$T2H_ICONS && $T2H_ACTIVE_ICONS{' '} ? 
	 &$T2H_button_icon_img($button, $T2H_ACTIVE_ICONS{' '}) :
	 $T2H_NAVIGATION_TEXT{' '};
      next;
    }
    elsif ($T2H_HREF{$button})
    { # button is active
      print $fh   
	 $T2H_ICONS && $T2H_ACTIVE_ICONS{$button} ? # use icon ? 
	   t2h_anchor('', $T2H_HREF{$button},  # yes
		    &$T2H_button_icon_img($button,
					$T2H_ACTIVE_ICONS{$button},
					$T2H_NAME{$button})) 
	 : # use text
	 "[" . 
	 t2h_anchor('', $T2H_HREF{$button}, $T2H_NAVIGATION_TEXT{$button}) .
	 "]";  
    }
    else
    { # button is passive 
      print $fh 
	$T2H_ICONS && $T2H_PASSIVE_ICONS{$button} ?
	 &$T2H_button_icon_img($button,
			       $T2H_PASSIVE_ICONS{$button},
			       $T2H_NAME{$button}) :
	 
	 "[" . $T2H_NAVIGATION_TEXT{$button} . "]";
    }
    print $fh "</TD>\n";
    print $fh "</TR>\n" if $vertical;
  }
  print $fh "<TD> [<a href=\"http://www.bookshelf.jp/cgi-bin/goto.cgi?file=meadow&node=search\">����</a>] [<a href=\"#top\">��ü</a> / <a href=\"#bottom\">��ü</a>]</TD>";
  print $fh "</TR>" unless $vertical;
  print $fh "</TABLE>\n";
}

######################################################################
# Frames: this is from "Richard Y. Kim" <ryk@coho.net>
# Should be improved to be more conforming to other _print* functions

sub T2H_DEFAULT_print_frame
{
  my $fh = shift;
  print $fh <<EOT;
<HTML>
<HEAD><TITLE>$T2H_THISDOC{title}</TITLE></HEAD>
<FRAMESET cols="140,*"> 
  <FRAME name=toc  src="$docu_toc_frame_file">
  <FRAME name=main src="$docu_doc">
</FRAMESET> 
</HTML>
EOT
}

sub T2H_DEFAULT_print_toc_frame
{
  my $fh = shift;
  &$T2H_print_page_head($fh);
  print $fh <<EOT;
<H2>Content</H2>
EOT
  print $fh map {s/HREF=/target=\"main\" HREF=/; $_;} @stoc_lines;
  print $fh "</BODY></HTML>\n";
}

######################################################################
# About page
#

# T2H_PRE_ABOUT might be a function
$T2H_PRE_ABOUT = <<EOT;
This document was generated $T2H_ADDRESS
using <A HREF="$T2H_HOMEPAGE"><I>texi2html</I></A>
<P>
EOT
$T2H_AFTER_ABOUT = '';

sub T2H_DEFAULT_about_body
{
  my $about;
  if (ref($T2H_PRE_ABOUT) eq 'CODE')
  {
    $about = &$T2H_PRE_ABOUT();
  }
  else
  {
    $about = $T2H_PRE_ABOUT;
  }
  $about .= <<EOT;
The buttons in the navigation panels have the following meaning:
<P>
<table border = "1">
<TR>
<TH> Button </TH>
<TH> Name </TH>
<TH> Go to </TH>
<TH> From 1.2.3 go to</TH>
</TR>
EOT
  
  for $button (@T2H_SECTION_BUTTONS)
  {
    next if $button eq ' ' || ref($button) eq 'CODE';
    $about .= <<EOT;
<TR>
<TD ALIGN="CENTER">
EOT
    $about .= 	
      ($T2H_ICONS && $T2H_ACTIVE_ICONS{$button} ?
       &$T2H_button_icon_img($button, $T2H_ACTIVE_ICONS{$button}) :
       " [" . $T2H_NAVIGATION_TEXT{$button} . "] ");
    $about .= <<EOT;
</TD>
<TD ALIGN="CENTER">
$button
</TD>
<TD>
$T2H_BUTTONS_GOTO{$button}
</TD>
<TD>
$T2H_BUTTONS_EXAMPLE{$button}
</TD>
</TR>
EOT
  }

  $about .= <<EOT;
</TABLE>
<P>
where the <STRONG> Example </STRONG> assumes that the current position 
is at <STRONG> Subsubsection One-Two-Three </STRONG> of a document of 
the following structure:
<UL>
<LI> 1. Section One  </LI>
<UL>
<LI>1.1 Subsection One-One</LI>
<UL>
<LI> ... </LI>
</UL>
<LI>1.2 Subsection One-Two</LI>
<UL>
<LI>1.2.1 Subsubsection One-Two-One
</LI><LI>1.2.2 Subsubsection One-Two-Two
</LI><LI>1.2.3 Subsubsection One-Two-Three &nbsp; &nbsp; <STRONG>
&lt;== Current Position </STRONG>
</LI><LI>1.2.4 Subsubsection One-Two-Four
</LI></UL>
<LI>1.3 Subsection One-Three</LI>
<UL>
<LI> ... </LI>
</UL>
<LI>1.4 Subsection One-Four</LI>
</UL>
</UL>
$T2H_AFTER_ABOUT
EOT
  return $about;  
}

  
%T2H_BUTTONS_GOTO =
  (
   'Top',      'cover (top) of document',
   'Contents', 'table of contents',
   'Overview', 'short table of contents',
   'Index',    'concept index',
   'Back',     'previous section in reading order',
   'FastBack', 'previous or up-and-previous section ',
   'Prev',     'previous section same level',
   'Up',       'up section',
   'Next',     'next section same level',
   'Forward',  'next section in reading order',
   'FastForward', 'next or up-and-next section',
   'About' ,    'this page',
   'First',    'first section in reading order',
   'Last',     'last section in reading order',
  );

%T2H_BUTTONS_EXAMPLE = 
(
   'Top',      ' &nbsp; ',
   'Contents', ' &nbsp; ',
   'Overview', ' &nbsp; ',
   'Index',    ' &nbsp; ',
   'Back',     '1.2.2',
   'FastBack', '1.1',
   'Prev',     '1.2.2',
   'Up',       '1.2',
   'Next',     '1.2.4',
   'Forward',  '1.2.4',
   'FastForward', '1.3',
   'About',     ' &nbsp; ',
   'First',    '1.',
   'Last',     '1.2.4',
);


######################################################################
# from here on, its l2h init stuff 
#

## initialization for latex2html as for Singular manual generation
## obachman 3/99

#
# Options controlling Titles, File-Names, Tracing and Sectioning
#
$TITLE = '';

$SHORTEXTN = 0;

$LONG_TITLES = 0;

$DESTDIR = ''; # should be overwritten by cmd-line argument

$NO_SUBDIR = 0;# should be overwritten by cmd-line argument

$PREFIX = '';  # should be overwritten by cmd-line argument

$AUTO_PREFIX = 0; # this is needed, so that prefix settings are used

$AUTO_LINK = 0; 

$SPLIT = 0;

$MAX_LINK_DEPTH = 0;

$TMP = ''; # should be overwritten by cmd-line argument

$DEBUG = 0;

$VERBOSE = 1;

#
# Options controlling Extensions and Special Features 
#
$HTML_VERSION = "3.2";

$TEXDEFS = 1; # we absolutely need that

$EXTERNAL_FILE = '';

$SCALABLE_FONTS = 1;

$NO_SIMPLE_MATH = 1;

$LOCAL_ICONS = 1;

$SHORT_INDEX = 0;

$NO_FOOTNODE = 1;

$ADDRESS = '';

$INFO = '';

#
# Switches controlling Image Generation 
#
$ASCII_MODE = 0;

$NOLATEX = 0;

$EXTERNAL_IMAGES = 0;

$PS_IMAGES = 0;

$NO_IMAGES = 0;

$IMAGES_ONLY = 0;

$REUSE = 2;

$ANTI_ALIAS = 1;

$ANTI_ALIAS_TEXT = 1;

#
#Switches controlling Navigation Panels
#
$NO_NAVIGATION = 1;
$ADDRESS = '';
$INFO = 0;              # 0 = do not make a "About this document..." section 

#
#Switches for Linking to other documents 
#
# currently -- we don't care

$MAX_SPLIT_DEPTH = 0;	# Stop making separate files at this depth

$MAX_LINK_DEPTH = 0;    # Stop showing child nodes at this depth   

$NOLATEX = 0;           # 1 = do not pass unknown environments to Latex

$EXTERNAL_IMAGES = 0;   # 1 = leave the images outside the document 

$ASCII_MODE = 0;        # 1 = do not use any icons or internal images

# 1 =  use links to external postscript images rather than inlined bitmap
# images.
$PS_IMAGES = 0;
$SHOW_SECTION_NUMBERS = 0;

### Other global variables ###############################################
$CHILDLINE = "";

# This is the line width measured in pixels and it is used to right justify
# equations and equation arrays; 
$LINE_WIDTH = 500;		

# Used in conjunction with AUTO_NAVIGATION
$WORDS_IN_PAGE = 300;	

# Affects ONLY the way accents are processed 
$default_language = 'english';

# The value of this variable determines how many words to use in each 
# title that is added to the navigation panel (see below)
# 
$WORDS_IN_NAVIGATION_PANEL_TITLES = 0;

# This number will determine the size of the equations, special characters,
# and anything which will be converted into an inlined image
# *except* "image generating environments" such as "figure", "table" 
# or "minipage".
# Effective values are those greater than 0.
# Sensible values are between 0.1 - 4.
$MATH_SCALE_FACTOR = 1.5;

# This number will determine the size of 
# image generating environments such as "figure", "table" or "minipage".
# Effective values are those greater than 0.
# Sensible values are between 0.1 - 4.
$FIGURE_SCALE_FACTOR = 1.6;


#  If both of the following two variables are set then the "Up" button
#  of the navigation panel in the first node/page of a converted document
#  will point to $EXTERNAL_UP_LINK. $EXTERNAL_UP_TITLE should be set
#  to some text which describes this external link.
$EXTERNAL_UP_LINK = "";
$EXTERNAL_UP_TITLE = "";

# If this is set then the resulting HTML will look marginally better if viewed 
# with Netscape.
$NETSCAPE_HTML = 1;

# Valid paper sizes are "letter", "legal", "a4","a3","a2" and "a0"
# Paper sizes has no effect other than in the time it takes to create inlined
# images and in whether large images can be created at all ie
#  - larger paper sizes *MAY* help with large image problems 
#  - smaller paper sizes are quicker to handle
$PAPERSIZE = "a4";

# Replace "english" with another language in order to tell LaTeX2HTML that you 
# want some generated section titles (eg "Table of Contents" or "References")
# to appear in a different language. Currently only "english" and "french"
# is supported but it is very easy to add your own. See the example in the
# file "latex2html.config" 
$TITLES_LANGUAGE = "english";

1;	# This must be the last non-comment line

# End File texi2html.init
######################################################################


require "$ENV{T2H_HOME}/texi2html.init" 
  if ($0 =~ /\.pl$/ &&
      -e "$ENV{T2H_HOME}/texi2html.init" && -r "$ENV{T2H_HOME}/texi2html.init");

#+++############################################################################
#                                                                              #
# Initialization                                                               #
# Pasted content of File $(srcdir)/MySimple.pm: Command-line processing        #
#                                                                              #
#---############################################################################

# leave this within comments, and keep the require statement
# This way, you can directly run texi2html.pl, if $ENV{T2H_HOME}/texi2html.init
# exists.

# 
package Getopt::MySimple;

# Name:
#	Getopt::MySimple.
#
# Documentation:
#	POD-style (incomplete) documentation is in file MySimple.pod
#
# Tabs:
#	4 spaces || die.
#
# Author:
#	Ron Savage	rpsavage@ozemail.com.au.
#	1.00	19-Aug-97	Initial version.
#	1.10	13-Oct-97	Add arrays of switches (eg '=s@').
#	1.20	 3-Dec-97	Add 'Help' on a per-switch basis.
#	1.30	11-Dec-97	Change 'Help' to 'verbose'. Make all hash keys lowercase.
#	1.40	10-Nov-98	Change width of help report. Restructure tests.
#               1-Jul-00        Modifications for Texi2html

# --------------------------------------------------------------------------
# Locally modified by obachman (Display type instead of env, order by cmp)
# $Id: texi2html.pl,v 1.9 2003/09/27 17:15:15 akihisa Exp $

# use strict;
# no strict 'refs';

use vars qw(@EXPORT @EXPORT_OK @ISA);
use vars qw($fieldWidth $opt $VERSION);

use Exporter();
use Getopt::Long;

@ISA		= qw(Exporter);
@EXPORT		= qw();
@EXPORT_OK	= qw($opt);	# An alias for $self -> {'opt'}.

# --------------------------------------------------------------------------

$fieldWidth	= 20;
$VERSION	= '1.41';

# --------------------------------------------------------------------------

sub byOrder
{
	my($self) = @_;
	
	return uc($a) cmp (uc($b));
}

# --------------------------------------------------------------------------

sub dumpOptions
{
	my($self) = @_;

	print 'Option', ' ' x ($fieldWidth - length('Option') ), "Value\n";

	for (sort byOrder keys(%{$self -> {'opt'} }) )
	{
	  print "-$_", ' ' x ($fieldWidth - (1 + length) ), "${$self->{'opt'} }{$_}\n";
	}

	print "\n";

}	# End of dumpOptions.

# --------------------------------------------------------------------------
# Return:
#	0 -> Error.
#	1 -> Ok.

sub getOptions
{
	push(@_, 0) if ($#_ == 2);	# Default for $ignoreCase is 0.
	push(@_, 1) if ($#_ == 3);	# Default for $helpThenExit is 1.

	my($self, $default, $helpText, $versionText, 
	   $helpThenExit, $versionThenExit, $ignoreCase) = @_;
	
	$helpThenExit = 1 unless (defined($helpThenExit));
	$versionThenExit = 1 unless (defined($versionThenExit));
	$ignoreCase = 0 unless (defined($ignoreCase));

	$self -> {'default'}		= $default;
	$self -> {'helpText'}		= $helpText;
	$self -> {'versionText'}        = $versionText;
	$Getopt::Long::ignorecase	= $ignoreCase;

	unless (defined($self -> {'default'}{'help'}))
	{
	  $self -> {'default'}{'help'} = 
	  { 
	   type => ':i', 
	   default => '',
	   linkage => sub {$self->helpOptions($_[1]); exit (0) if $helpThenExit;},
	   verbose => "print help and exit"
	  };
	}

	unless (defined($self -> {'default'}{'version'}))
	{
	  $self -> {'default'}{'version'} = 
	  { 
	   type => '', 
	   default => '',
	   linkage => sub {print $self->{'versionText'};  exit (0) if versionTheExit;},
	   verbose => "print version and exit"
	  };
	}

	for (keys(%{$self -> {'default'} }) )
	{
	  my $type = ${$self -> {'default'} }{$_}{'type'};
	  push(@{$self -> {'type'} }, "$_$type");
	  $self->{'opt'}->{$_} =  ${$self -> {'default'} }{$_}{'linkage'}
            if ${$self -> {'default'} }{$_}{'linkage'};
	}

	my($result) = &GetOptions($self -> {'opt'}, @{$self -> {'type'} });

        return $result unless $result;

	for (keys(%{$self -> {'default'} }) )
	{
 	   if (! defined(${$self -> {'opt'} }{$_})) #{
            {
 	     ${$self -> {'opt'} }{$_} = ${$self -> {'default'} }{$_}{'default'};
            }
	}

	$result;
}	# End of getOptions.

# --------------------------------------------------------------------------

sub helpOptions
{
	my($self) = shift;
	my($noHelp) = shift;
	$noHelp = 0 unless $noHelp;
	my($optwidth, $typewidth, $defaultwidth, $maxlinewidth, $valind, $valwidth) 
	  = (10, 5, 9, 78, 4, 11);

	print "$self->{'helpText'}" if ($self -> {'helpText'});

	print ' Option', ' ' x ($optwidth - length('Option') -1 ),
		'Type', ' ' x ($typewidth - length('Type') + 1),
		'Default', ' ' x ($defaultwidth - length('Default') ),
	        "Description\n";

	for (sort byOrder keys(%{$self -> {'default'} }) )
	{
	  my($line, $help, $option, $val);
	  $option = $_;
	  next if ${$self->{'default'} }{$_}{'noHelp'} && ${$self->{'default'} }{$_}{'noHelp'} > $noHelp;
          #$line = " -$_" . ' ' x ($optwidth - (2 + length) ) .
          #      	"${$self->{'default'} }{$_}{'type'} ".
          #      	' ' x ($typewidth - (1+length(${$self -> {'default'} }{$_}{'type'}) ));
		$line = " -$_" . "${$self->{'default'} }{$_}{'type'}".
			' ' x ($typewidth - (1+length(${$self -> {'default'} }{$_}{'type'}) ));

                 $val = ${$self->{'default'} }{$_}{'linkage'};
                if ($val)
                {
                  if (ref($val) eq 'SCALAR')
		  {
		    $val = $$val; 
		  }
		  else
		  {
		    $val = '';
		  }
                }
		else
		{
		  $val = ${$self->{'default'} }{$_}{'default'};
		}
	        $line .= "$val  ";
		$line .= ' ' x ($optwidth + $typewidth + $defaultwidth + 1 - length($line));
		
		if (defined(${$self -> {'default'} }{$_}{'verbose'}) &&
		  ${$self -> {'default'} }{$_}{'verbose'} ne '')
	      {
		$help = "${$self->{'default'} }{$_}{'verbose'}";
	      }
	      else
	      {
		$help = ' ';
	      }
	      if ((length("$line") + length($help)) < $maxlinewidth)
	      {
		print $line , $help, "\n";
	      }
	      else
	      {
		print $line, "\n", ' ' x $valind, $help, "\n";
	      }
	      for $val (sort byOrder keys(%{${$self->{'default'}}{$option}{'values'}}))
	      {
	        print ' ' x ($valind + 2);
                print $val, '  ', ' ' x ($valwidth - length($val) - 2);
	        print ${$self->{'default'}}{$option}{'values'}{$val}, "\n";
	      }
	}

	print <<EOT;
Note: 'Options' may be abbreviated. 'Type' specifications mean:
 <none>| !    no argument: variable is set to 1 on -foo (or, to 0 on -nofoo)
    =s | :s   mandatory (or, optional)  string argument
    =i | :i   mandatory (or, optional)  integer argument
EOT
}	# End of helpOptions.

#-------------------------------------------------------------------

sub new
{
	my($class)				= @_;
	my($self)				= {};
	$self -> {'default'}	= {};
	$self -> {'helpText'}	= '';
	$self -> {'opt'}		= {};
	$opt					= $self -> {'opt'};	 # An alias for $self -> {'opt'}.
	$self -> {'type'}		= ();

	return bless $self, $class;

}	# End of new.

# --------------------------------------------------------------------------

1;

# End MySimple.pm

require "$ENV{T2H_HOME}/MySimple.pm" 
  if ($0 =~ /\.pl$/ &&
      -e "$ENV{T2H_HOME}/texi2html.init" && -r "$ENV{T2H_HOME}/texi2html.init");

package main;

#+++############################################################################
#                                                                              #
# Constants                                                                    #
#                                                                              #
#---############################################################################

$DEBUG_TOC   =  1;
$DEBUG_INDEX =  2;
$DEBUG_BIB   =  4;
$DEBUG_GLOSS =  8;
$DEBUG_DEF   = 16;
$DEBUG_HTML  = 32;
$DEBUG_USER  = 64;
$DEBUG_L2H   = 128;


$BIBRE = '\[[\w\/-]+\]';		# RE for a bibliography reference
$FILERE = '[\/\w.+-]+';			# RE for a file name
$VARRE = '[^\s\{\}]+';			# RE for a variable name
$NODERE = '[^,:]+';		        # RE for a node name
$NODESRE = '[^:]+';		        # RE for a list of node names

$ERROR = "***";			        # prefix for errors 
$WARN  = "**";                          # prefix for warnings
  
                                        # program home page
$PROTECTTAG = "_ThisIsProtected_";	# tag to recognize protected sections

$CHAPTEREND = "<!-- End chapter -->\n"; # to know where a chpater ends
$SECTIONEND = "<!-- End section -->\n"; # to know where section ends
$TOPEND     = "<!-- End top     -->\n"; # to know where top ends

  

#
# pre-defined indices
#
$index_properties =
{
 'c' => { name => 'cp'},
 'f' => { name => 'fn', code => 1},
 'v' => { name => 'vr', code => 1},
 'k' => { name => 'ky', code => 1},
 'p' => { name => 'pg', code => 1},
 't' => { name => 'tp', code => 1}
};


%predefined_index = (
		    'cp', 'c',
		    'fn', 'f',
		    'vr', 'v',
		    'ky', 'k',
		    'pg', 'p',
		    'tp', 't',
	            );

#
# valid indices
#
%valid_index = (
		    'c', 1,
		    'f', 1,
		    'v', 1,
		    'k', 1,
		    'p', 1,
		    't', 1,
		);

#
# texinfo section names to level
#
%sec2level = (
	      'top', 0,
	      'chapter', 1,
	      'unnumbered', 1,
	      'majorheading', 1,
	      'chapheading', 1,
	      'appendix', 1,
	      'section', 2,
	      'unnumberedsec', 2,
	      'heading', 2,
	      'appendixsec', 2,
	      'appendixsection', 2,
	      'subsection', 3,
	      'unnumberedsubsec', 3,
	      'subheading', 3,
	      'appendixsubsec', 3,
	      'subsubsection', 4,
	      'unnumberedsubsubsec', 4,
	      'subsubheading', 4,
	      'appendixsubsubsec', 4,
	      );

#
# accent map, TeX command to ISO name
#
%accent_map = (
	       '"',  'uml',
	       '~',  'tilde',
	       '^',  'circ',
	       '`',  'grave',
	       '\'', 'acute',
	       );

#
# texinfo "simple things" (@foo) to HTML ones
#
%simple_map = (
	       # cf. makeinfo.c
	       "*", "<BR>",		# HTML+
	       " ", " ",
	       "\t", " ",
  	       "-", "&#173;",	# soft hyphen
	       "\n", "\n",
	       "|", "",
	       'tab', '<\/TD><TD>',
	       # spacing commands
	       ":", "",
	       "!", "!",
	       "?", "?",
	       ".", ".",
	       "-", "",
	       );

#
# texinfo "things" (@foo{}) to HTML ones
#
%things_map = (
	       'TeX', 'TeX',
	       'br', '<P>',		# paragraph break
	       'bullet', '*',
	       'copyright', '(C)',
	       'dots', '<small>...<\/small>',
	       'enddots', '<small>....<\/small>',
	       'equiv', '==',
	       'error', 'error-->',
	       'expansion', '==>',
	       'minus', '-',
	       'point', '-!-',
	       'print', '-|',
	       'result', '=>',
	       'today', $T2H_TODAY,
	       'aa', '&aring;',
	       'AA', '&Aring;',
	       'ae', '&aelig;',
	       'oe', '&#156;',
	       'AE', '&AElig;',
	       'OE', '&#140;',
	       'o',  '&oslash;',
	       'O',  '&Oslash;',
	       'ss', '&szlig;',
	       'l', '\/l',
	       'L', '\/L',
	       'exclamdown', '&iexcl;',
	       'questiondown', '&iquest;',
	       'pounds', '&pound;'
	       );

#
# texinfo styles (@foo{bar}) to HTML ones
#
%style_map = (
	      'acronym', '&do_acronym',
	      'asis', '',
	      'b', 'B',
##	      'cite', 'CITE',
	      'cite', '&do_CITE',
	      'code', 'CODE',
	      'command', 'CODE',
	      'ctrl', '&do_ctrl',	# special case
	      'dfn', 'EM',		# DFN tag is illegal in the standard
	      'dmn', '',		# useless
	      'email', '&do_email',     # insert a clickable email address
	      'emph', 'EM',
	      'env', 'CODE',
	      'file', '"TT',		# will put quotes, cf. &apply_style
	      'i', 'I',
	      'kbd', 'KBD',
	      'key', 'KBD',
	      'math', '&do_math',
	      'option', '"SAMP',        # will put quotes, cf. &apply_style
	      'r', '',			# unsupported
	      'samp', '"SAMP',		# will put quotes, cf. &apply_style
	      'sc', '&do_sc',		# special case
	      'strong', 'STRONG',
	      't', 'TT',
	      'titlefont', '',		# useless
	      'div', '&do_div',       # insert a clickable URL
	      'span', '&do_span',       # insert a clickable URL
	      'face2html', '&do_face2html',       # insert a clickable URL
	      'face2html2', '&do_face2html2',       # insert a clickable URL
	      'uref', '&do_uref',       # insert a clickable URL
	      'count', '&do_count',       # insert a clickable URL
	      'addnif', '&do_addnifty',       # insert a clickable URL

	      'url', '&do_url',         # insert a clickable URL
	      'img', '&do_img',         # insert a clickable URL
	      'inserttoc', '&do_inserttoc',         # insert a clickable URL	      
	      'right', '&do_right',       # insert a clickable URL
	      'var', 'VAR',
	      'w', '',			# unsupported
	      'H', '&do_accent',
	      'dotaccent', '&do_accent',
	      'ringaccent','&do_accent',
	      'tieaccent', '&do_accent',
	      'u','&do_accent',
	      'ubaraccent','&do_accent',
	      'udotaccent','&do_accent',
	      'v', '&do_accent',
	      ',', '&do_accent',
	      'dotless', '&do_accent',
              
	      'comm', '&do_comm',
	      'dif', '&do_dif'
	      );

#
# texinfo format (@foo/@end foo) to HTML ones
#
%format_map = (
	       'quotation', 'BLOCKQUOTE',
	       # lists
	       'itemize', 'UL',
	       'enumerate', 'OL',
	       # poorly supported
	       'flushleft', 'PRE',
	       'flushright', 'PRE',
	       );

#
# an eval of these $complex_format_map->{what}->[0] yields beginning
# an eval of these $complex_format_map->{what}->[1] yieleds end
$complex_format_map =
{
 example => 
 [
  q{"<TABLE><tr>$T2H_EXAMPLE_INDENT_CELL<td class=example><pre>"},
  q{'</pre></td></tr></table>'}
 ],
 emacs => 
 [
  q{"<div class=meadow><pre>"},
  q{'</pre></div>'}
 ],
 topinfo => 
 [
  q{"<div class=topinfo>"},
  q{'</div>'}
 ],
 smallexample => 
 [
  q{"<TABLE><tr>$T2H_SMALL_EXAMPLE_INDENT_CELL<td class=smallexample><FONT SIZE=$T2H_SMALL_FONT_SIZE><pre>"},
  q{'</FONT></pre></td></tr></table>'}
 ],
 display =>
 [
  q{"<TABLE><tr>$T2H_EXAMPLE_INDENT_CELL<td class=display><pre " . 'style="font-family: serif">'},
  q{'</pre></td></tr></table>'}
 ],
 smalldisplay =>
 [
  q{"<TABLE><tr>$T2H_SMALL_EXAMPLE_INDENT_CELL<td class=smalldisplay><FONT SIZE=$T2H_SMALL_FONT_SIZE><pre " . 'style="font-family: serif">'},
  q{'</pre></FONT></td></tr></table>'}
 ]
};

$complex_format_map->{lisp} = $complex_format_map->{example};
$complex_format_map->{emacs} = $complex_format_map->{emacs};
$complex_format_map->{smalllisp} = $complex_format_map->{smallexample};
$complex_format_map->{format} = $complex_format_map->{display};
$complex_format_map->{smallformat} = $complex_format_map->{smalldisplay};

#
# texinfo definition shortcuts to real ones
#
%def_map = (
	    # basic commands
	    'deffn', 0,
	    'defvr', 0,
	    'deftypefn', 0,
	    'deftypevr', 0,
	    'defcv', 0,
	    'defop', 0,
	    'deftp', 0,
	    # basic x commands
	    'deffnx', 0,
	    'defvrx', 0,
	    'deftypefnx', 0,
	    'deftypevrx', 0,
	    'defcvx', 0,
	    'defopx', 0,
	    'deftpx', 0,
	    # shortcuts
	    'defun', 'deffn Function',
	    'defmac', 'deffn Macro',
	    'defspec', 'deffn {Special Form}',
	    'defvar', 'defvr Variable',
	    'defopt', 'defvr {User Option}',
	    'deftypefun', 'deftypefn Function',
	    'deftypevar', 'deftypevr Variable',
	    'defivar', 'defcv {Instance Variable}',
	    'deftypeivar', 'defcv {Instance Variable}', # NEW: FIXME
	    'defmethod', 'defop Method',
	    'deftypemethod', 'defop Method', # NEW:FIXME
	    # x shortcuts
	    'defunx', 'deffnx Function',
	    'defmacx', 'deffnx Macro',
	    'defspecx', 'deffnx {Special Form}',
	    'defvarx', 'defvrx Variable',
	    'defoptx', 'defvrx {User Option}',
	    'deftypefunx', 'deftypefnx Function',
	    'deftypevarx', 'deftypevrx Variable',
	    'defivarx', 'defcvx {Instance Variable}',
	    'defmethodx', 'defopx Method',
	    );

#
# things to skip
#
%to_skip = (
	    # comments
	    'c', 1,
	    'comment', 1,
            'ifnotinfo', 1,
            'ifnottex', 1,
	    'ifhtml', 1,
	    'end ifhtml', 1,
            'end ifnotinfo', 1,
            'end ifnottex', 1,
	    # useless
	    'detailmenu', 1,
            'direntry', 1,
	    'contents', 1,
	    'shortcontents', 1,
	    'summarycontents', 1,
	    'footnotestyle', 1,
	    'end ifclear', 1,
	    'end ifset', 1,
	    'titlepage', 1,
	    'end titlepage', 1,
	    # unsupported commands (formatting)
	    'afourpaper', 1,
	    'cropmarks', 1,
	    'finalout', 1,
	    'headings', 1,
            'sp', 1,
	    'need', 1,
	    'page', 1,
	    'setchapternewpage', 1,
	    'everyheading', 1,
	    'everyfooting', 1,
	    'evenheading', 1,
	    'evenfooting', 1,
	    'oddheading', 1,
	    'oddfooting', 1,
	    'smallbook', 1,
	    'vskip', 1,
	    'filbreak', 1,
	    'paragraphindent', 1,
	    # unsupported formats
	    'cartouche', 1,
	    'end cartouche', 1,
	    'group', 1,
	    'end group', 1,
	    );

#+++############################################################################
#                                                                              #
# Argument parsing, initialisation                                             #
#                                                                              #
#---############################################################################

#
# flush stdout and stderr after every write
#
select(STDERR);
$| = 1;
select(STDOUT);
$| = 1;


%value = ();				# hold texinfo variables, see also -D
$use_bibliography = 1;
$use_acc = 1;

#
# called on -init-file
sub LoadInitFile
{
  my $init_file = shift;
  # second argument is value of options
  $init_file = shift;
  if (-f $init_file)
  {
    print "# reading initialization file from $init_file\n" 
      if ($T2H_VERBOSE);
    require($init_file);
  }
  else
  {
    print "$ERROR Error: can't read init file $int_file\n";
    $init_file = '';
  }
}

#
# called on -lang
sub SetDocumentLanguage
{
  my $lang = shift;
  if (! exists($T2H_WORDS->{$lang}))
  {
    warn "$ERROR: Language specs for '$lang' do not exists. Reverting to '" . 
      ($T2H_LANG ? T2H_LANG : "en") . "'\n";
  }
  else
  {
    print "# using '$lang' as document language\n" if ($T2H_VERBOSE);
    $T2H_LANG = $lang;
  }
}

##
## obsolete cmd line options
##
$T2H_OBSOLETE_OPTIONS -> {'no-section_navigation'} =
{
 type => '!',
 linkage => sub {$main::T2H_SECTION_NAVIGATION = 0;},
 verbose => 'obsolete, use -nosec_nav',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {use_acc} =
{
 type => '!',
 linkage => \$use_acc,
 verbose => 'obsolete',
 noHelp => 2
};
$T2H_OBSOLETE_OPTIONS -> {expandinfo} =
{
 type => '!',
 linkage => sub {$main::T2H_EXPAND = 'info';},
 verbose => 'obsolete, use "-expand info" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {expandtex} =
{
 type => '!',
 linkage => sub {$main::T2H_EXPAND = 'tex';},
 verbose => 'obsolete, use "-expand tex" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {monolithic} =
{
 type => '!',
 linkage => sub {$main::T2H_SPLIT = '';},
 verbose => 'obsolete, use "-split no" instead',
 noHelp => 2
};
$T2H_OBSOLETE_OPTIONS -> {split_node} =
{
 type => '!',
 linkage => sub{$main::T2H_SPLIT = 'section';},
 verbose => 'obsolete, use "-split section" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {split_chapter} =
{
 type => '!',
 linkage => sub{$main::T2H_SPLIT = 'chapter';},
 verbose => 'obsolete, use "-split chapter" instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {no_verbose} =
{
 type => '!',
 linkage => sub {$main::T2H_VERBOSE = 0;},
 verbose => 'obsolete, use -noverbose instead',
 noHelp => 2,
};
$T2H_OBSOLETE_OPTIONS -> {output_file} =
{
 type => '=s',
 linkage => sub {$main::T2H_OUT = @_[1]; $T2H_SPLIT = '';},
 verbose => 'obsolete, use -out_file instead',
 noHelp => 2
};

$T2H_OBSOLETE_OPTIONS -> {section_navigation} =
{
 type => '!',
 linkage => \$T2H_SECTION_NAVIGATION,
 verbose => 'obsolete, use -sec_nav instead',
 noHelp => 2,
};

$T2H_OBSOLETE_OPTIONS -> {verbose} =
{
 type => '!',
 linkage => \$T2H_VERBOSE,
 verbose => 'obsolete, use -Verbose instead',
 noHelp => 2
};

# read initialzation from $sysconfdir/texi2htmlrc or $HOME/.texi2htmlrc
my $home = $ENV{HOME};
defined($home) or $home = '';
foreach $i ('/usr/local/etc/texi2htmlrc', "$home/.texi2htmlrc") {
    if (-f $i) {
	print "# reading initialization file from $i\n" 
	    if ($T2H_VERBOSE);
	require($i);
    }
}


#+++############################################################################
#                                                                              #
# parse command-line options
#                                                                              #
#---############################################################################
$T2H_USAGE_TEXT = <<EOT;
Usage: texi2html  [OPTIONS] TEXINFO-FILE
Translates Texinfo source documentation to HTML.
EOT
$T2H_FAILURE_TEXT = <<EOT;
Try 'texi2html -help' for usage instructions.
EOT
$options = new Getopt::MySimple;

# some older version of GetOpt::Long don't have 
# Getopt::Long::Configure("pass_through")
eval {Getopt::Long::Configure("pass_through");};
$Configure_failed = $@ && <<EOT;
**WARNING: Parsing of obsolete command-line options could have failed. 
           Consider to use only documented command-line options (run
           'texi2html -help 2' for a complete list) or upgrade to perl 
           version 5.005 or higher.
EOT

if (! $options->getOptions($T2H_OPTIONS, $T2H_USAGE_TEXT, "$THISVERSION\n"))
{
  print $Configure_failed if $Configure_failed;
  die $T2H_FAILURE_TEXT;
}

if (@ARGV > 1)
{
  eval {Getopt::Long::Configure("no_pass_through");};
  if (! $options->getOptions($T2H_OBSOLETE_OPTIONS, $T2H_USAGE_TEXT, "$THISVERSION\n"))
  {
    print $Configure_failed if $Configure_failed;
    die $T2H_FAILURE_TEXT;
  }
}

if ($T2H_CHECK) {
    die "Need file to check\n$T2H_FAILURE_TEXT" unless @ARGV > 0;
    &check;
    exit;
}

#+++############################################################################
#                                                                              #
# evaluation of cmd line options
#                                                                              #
#---############################################################################

if ($T2H_EXPAND eq 'info') 
{
  $to_skip{'ifinfo'} = 1;
  $to_skip{'end ifinfo'} = 1;
} 
elsif ($T2H_EXPAND eq 'tex')
{
  $to_skip{'iftex'} = 1;
  $to_skip{'end iftex'} = 1;
  
}

$T2H_INVISIBLE_MARK = '<IMG SRC="invisible.xbm">' if $T2H_INVISIBLE_MARK eq 'xbm';

#
# file name buisness
#
die "Need exactly one file to translate\n$T2H_FAILURE_TEXT" unless @ARGV == 1;
$docu = shift(@ARGV);
if ($docu =~ /.*\//) {
    chop($docu_dir = $&);
    $docu_name = $';
} else {
    $docu_dir = '.';
    $docu_name = $docu;
}
unshift(@T2H_INCLUDE_DIRS, $docu_dir);
$docu_name =~ s/\.te?x(i|info)?$//;	# basename of the document
$docu_name = $T2H_PREFIX if ($T2H_PREFIX);

# subdir
if ($T2H_SUBDIR && ! $T2H_OUT)
{
  $T2H_SUBDIR =~ s|/*$||;
  unless (-d "$T2H_SUBDIR" && -w "$T2H_SUBDIR")
  {
    if ( mkdir($T2H_SUBDIR, oct(755)))
    {
      print "# created directory $T2H_SUBDIR\n" if ($T2H_VERBOSE);
    }
    else
    {
      warn "$ERROR can't create directory $T2H_SUBDIR. Put results into current directory\n";
      $T2H_SUBDIR = '';
    }
  }
}

if ($T2H_SUBDIR && ! $T2H_OUT)
{
  $docu_rdir = "$T2H_SUBDIR/";
  print "# putting result files into directory $docu_rdir\n" if ($T2H_VERBOSE);
}
else
{
  if ($T2H_OUT && $T2H_OUT =~ m|(.*)/|)
  {
    $docu_rdir = "$1/";
    print "# putting result files into directory $docu_rdir\n" if ($T2H_VERBOSE);
  }
  else
  {
    print "# putting result files into current directory \n" if ($T2H_VERBOSE);
    $docu_rdir = '';
  }
}

# extension
if ($T2H_SHORTEXTN)
{
  $docu_ext = "htm";
}
else
{
  $docu_ext = "html";
}
if ($T2H_TOP_FILE =~ /\..*$/)
{
  $T2H_TOP_FILE = $`.".$docu_ext";
}

# result files
if (! $T2H_OUT && ($T2H_SPLIT =~ /section/i || $T2H_SPLIT =~ /node/i))
{
  $T2H_SPLIT = 'section';
}
elsif (! $T2H_OUT && $T2H_SPLIT =~ /chapter/i)
{
  $T2H_SPLIT = 'chapter'
}
else
{
  undef $T2H_SPLIT;
}

$docu_doc = "$docu_name.$docu_ext";		# document's contents
$docu_doc_file = "$docu_rdir$docu_doc";
if ($T2H_SPLIT) 
{
  $docu_toc  = $T2H_TOC_FILE || "${docu_name}_toc.$docu_ext"; # document's table of contents
  $docu_stoc = "${docu_name}_ovr.$docu_ext"; # document's short toc
  $docu_foot = "${docu_name}_fot.$docu_ext"; # document's footnotes
  $docu_about = "${docu_name}_abt.$docu_ext"; # about this document
  $docu_top  = $T2H_TOP_FILE || $docu_doc;
}
else
{
  if ($T2H_OUT)
  {
    $docu_doc = $T2H_OUT;
    $docu_doc =~ s|.*/||;
  }
  $docu_toc = $docu_foot = $docu_stoc = $docu_about = $docu_top = $docu_doc;
}

$docu_toc_file  = "$docu_rdir$docu_toc";
$docu_stoc_file = "$docu_rdir$docu_stoc";
$docu_foot_file = "$docu_rdir$docu_foot";
$docu_about_file = "$docu_rdir$docu_about";
$docu_top_file  = "$docu_rdir$docu_top";

$docu_frame_file =     "$docu_rdir${docu_name}_frame.$docu_ext";
$docu_toc_frame_file = "$docu_rdir${docu_name}_toc_frame.$docu_ext";

#
# variables
#
$value{'html'} = 1;			# predefine html (the output format)
$value{'texi2html'} = $THISVERSION;	# predefine texi2html (the translator)
# _foo: internal to track @foo
foreach ('_author', '_title', '_subtitle',
	 '_settitle', '_setfilename', '_shorttitle') {
    $value{$_} = '';		        # prevent -w warnings
}
%node2sec = ();				# node to section name
%sec2node = ();				# section to node name
%sec2number = ();                       # section to number
%number2sec = ();                       # number to section 
%idx2node = ();                         # index keys to node
%node2href = ();			# node to HREF
%node2next = ();			# node to next
%node2prev = ();			# node to prev
%node2up   = ();			# node to up
%bib2href = ();				# bibliography reference to HREF
%gloss2href = ();			# glossary term to HREF
@sections = ();				# list of sections
%tag2pro = ();				# protected sections
  
#
# initial indexes
#
$bib_num = 0;
$foot_num = 0;
$gloss_num = 0;
$idx_num = 0;
$sec_num = 0;
$doc_num = 0;
$html_num = 0;

#
# can I use ISO8859 characters? (HTML+)
#
if ($T2H_USE_ISO) {
    $things_map{'bullet'} = "&bull;";
    $things_map{'copyright'} = "&copy;";
    $things_map{'dots'} = "&hellip;";
    $things_map{'equiv'} = "&equiv;";
    $things_map{'expansion'} = "&rarr;";
    $things_map{'point'} = "&lowast;";
    $things_map{'result'} = "&rArr;";
}

#
# read texi2html extensions (if any)
#
$extensions = 'texi2html.ext'; # extensions in working directory
if (-f $extensions) {
    print "# reading extensions from $extensions\n" if $T2H_VERBOSE;
    require($extensions);
}
($progdir = $0) =~ s/[^\/]+$//;
if ($progdir && ($progdir ne './')) {
    $extensions = "${progdir}texi2html.ext"; # extensions in texi2html directory
    if (-f $extensions) {
	print "# reading extensions from $extensions\n" if $T2H_VERBOSE;
	require($extensions);
    }
}


print "# reading from $docu\n" if $T2H_VERBOSE;

#########################################################################
#
# latex2html stuff
# 
# latex2html conversions consist of three stages:
# 1) ToLatex: Put "latex" code into a latex file
# 2) ToHtml: Use latex2html to generate corresponding html code and images
# 3) FromHtml: Extract generated code and images from latex2html run
#

##########################
# default settings
#

# defaults for files and names

sub l2h_Init 
{
  local($root) = @_;
  
  return 0 unless ($root);
  
  $l2h_name =  "${root}_l2h";
  
  $l2h_latex_file = "$docu_rdir${l2h_name}.tex";
  $l2h_cache_file = "${docu_rdir}l2h_cache.pm";
  $T2H_L2H_L2H = "latex2html" unless ($T2H_L2H_L2H);
  
  # destination dir -- generated images are put there, should be the same
  # as dir of enclosing html document -- 
  $l2h_html_file = "$docu_rdir${l2h_name}.html";
  $l2h_prefix = "${l2h_name}_";
  return 1;
}


##########################
# 
# First stage: Generation of Latex file
# Initialize with: l2h_InitToLatex
# Add content with: l2h_ToLatex($text) --> HTML placeholder comment
# Finish with: l2h_FinishToLatex
# 

$l2h_latex_preample = <<EOT;
% This document was automatically generated by the l2h extenstion of texi2html
% DO NOT EDIT !!!
\\documentclass{article}
\\usepackage{html}
\\begin{document}
EOT

$l2h_latex_closing = <<EOT;
\\end{document}
EOT

# return used latex 1, if l2h could be initalized properly, 0 otherwise
sub l2h_InitToLatex
{
  %l2h_to_latex = ();
  unless ($T2H_L2H_SKIP)
  {
    unless (open(L2H_LATEX, ">$l2h_latex_file"))
    {
      warn "$ERROR Error l2h: Can't open latex file '$latex_file' for writing\n";
      return 0;
    }  
    print "# l2h: use ${l2h_latex_file} as latex file\n" if ($T2H_VERBOSE);
    print L2H_LATEX $l2h_latex_preample;
  }
  # open database for caching
  l2h_InitCache();
  $l2h_latex_count = 0;
  $l2h_to_latex_count = 0;
  $l2h_cached_count = 0;
  return  1;
}

# print text (1st arg) into latex file (if not already there), return
# HTML commentary which can be later on replaced by the latex2html
# generated text
sub l2h_ToLatex
{
  my($text) = @_;
  my($count);
  
  $l2h_to_latex_count++;
  $text =~ s/(\s*)$//;
  
  # try whether we can cache it
  my $cached_text = l2h_FromCache($text);
  if ($cached_text)
  {
    $l2h_cached_count++;
    return $cached_text;
  }
  
  # try whether we have text already on things to do
  unless ($count = $l2h_to_latex{$text})
  {
    $count = $l2h_latex_count;
    $l2h_latex_count++;
    $l2h_to_latex{$text} = $count;
    $l2h_to_latex[$count] = $text;
    unless ($T2H_L2H_SKIP)
    {
      print L2H_LATEX "\\begin{rawhtml}\n";
      print L2H_LATEX "<!-- l2h_begin ${l2h_name} ${count} -->\n";
      print L2H_LATEX "\\end{rawhtml}\n";
      
      print L2H_LATEX "$text\n";
      
      print L2H_LATEX "\\begin{rawhtml}\n";
      print L2H_LATEX "<!-- l2h_end ${l2h_name} ${count} -->\n";
      print L2H_LATEX "\\end{rawhtml}\n";
    }
  }
  return "<!-- l2h_replace ${l2h_name} ${count} -->"; 
}

# print closing into latex file and close it
sub l2h_FinishToLatex
{
  local ($reused);
  
  $reused = $l2h_to_latex_count - $l2h_latex_count - $l2h_cached_count;
  unless ($T2H_L2H_SKIP)
  {
    print L2H_LATEX $l2h_latex_closing;
    close(L2H_LATEX);
  }
  print "# l2h: finished to latex ($l2h_cached_count cached, $reused reused, $l2h_latex_count contents)\n" if ($T2H_VERBOSE);
  unless ($l2h_latex_count)
  {
    l2h_Finish();
    return 0;
  }
  return 1;
}

###################################
# Second stage: Use latex2html to generate corresponding html code and images
#
# l2h_ToHtml([$l2h_latex_file, [$l2h_html_dir]]):
#   Call latex2html on $l2h_latex_file
#   Put images (prefixed with $l2h_name."_") and html file(s) in $l2h_html_dir
#   Return 1, on success
#          0, otherwise
#
sub l2h_ToHtml
{
  local($call, $ext, $root, $dotbug);
  
  if ($T2H_L2H_SKIP)
  {
    print "# l2h: skipping latex2html run\n" if ($T2H_VERBOSE);
    return 1;
  }
  
  # Check for dot in directory where dvips will work
  if ($T2H_L2H_TMP)
  {
    if ($T2H_L2H_TMP =~ /\./)
    {
      warn "$ERROR Warning l2h: l2h_tmp dir contains a dot. Use /tmp, instead\n";
      $dotbug = 1;
    }
  }
  else
  {
    if (&getcwd =~ /\./)
    {
     warn "$ERROR Warning l2h: current dir contains a dot. Use /tmp as l2h_tmp dir \n";
     $dotbug = 1;
   }
  }
  # fix it, if necessary and hope that it works 
  $T2H_L2H_TMP = "/tmp" if ($dotbug);
    
  $call = $T2H_L2H_L2H;
  # use init file, if specified
  $call = $call . " -init_file " . $init_file if ($init_file && -f $init_file);
  # set output dir
  $call .=  ($docu_rdir ? " -dir $docu_rdir" : " -no_subdir");
  # use l2h_tmp, if specified
  $call = $call . " -tmp $T2H_L2H_TMP" if ($T2H_L2H_TMP);
  # options we want to be sure of
  $call = $call ." -address 0 -info 0 -split 0 -no_navigation -no_auto_link";
  $call = $call ." -prefix ${l2h_prefix} $l2h_latex_file"; 

  print "# l2h: executing '$call'\n" if ($T2H_VERBOSE);
  if (system($call))
  {
    warn "l2h ***Error: '${call}' did not succeed\n";
    return 0;
  }
  else
  {
    print "# l2h: latex2html finished successfully\n" if ($T2H_VERBOSE);
    return 1;
  }
}

# this is directly pasted over from latex2html
sub getcwd {
    local($_) = `pwd`;

    die "'pwd' failed (out of memory?)\n"
	unless length;
    chop;
    $_;
}


##########################
# Third stage: Extract generated contents from latex2html run
# Initialize with: l2h_InitFromHtml
#   open $l2h_html_file for reading
#   reads in contents into array indexed by numbers
#   return 1,  on success -- 0, otherwise
# Extract Html code with: l2h_FromHtml($text)
#   replaces in $text all previosuly inserted comments by generated html code
#   returns (possibly changed) $text
# Finish with: l2h_FinishFromHtml
#   closes $l2h_html_dir/$l2h_name.".$docu_ext" 

sub l2h_InitFromHtml
{
  local($h_line, $h_content, $count, %l2h_img);

  if (! open(L2H_HTML, "<${l2h_html_file}"))
  {
    print "$ERROR Error l2h: Can't open ${l2h_html_file} for reading\n";
    return 0;
  }
  print "# l2h: use ${l2h_html_file} as html file\n" if ($T2H_VERBOSE);

  $l2h_html_count = 0;
  
  while ($h_line = <L2H_HTML>)
  {
    if ($h_line =~ /^<!-- l2h_begin $l2h_name ([0-9]+) -->/)
    {
      $count = $1;
      $h_content = "";
      while ($h_line = <L2H_HTML>)
      {
	if ($h_line =~ /^<!-- l2h_end $l2h_name $count -->/)
	{
	  chomp $h_content;
	  chomp $h_content;
	  $l2h_html_count++;
	  $h_content = l2h_ToCache($count, $h_content);
	  $l2h_from_html[$count] = $h_content;
	  $h_content = '';
	  last;
	}
	$h_content = $h_content.$h_line;
      }
      if ($hcontent)
      {
	print "$ERROR Warning l2h: l2h_end $l2h_name $count not found\n" 
	  if ($T2H_VERBOSE);
	close(L2H_HTML);
	return 0;
      }
    }
  }
  print "# l2h: Got $l2h_html_count of $l2h_latex_count html contents\n"
    if ($T2H_VERBOSE);

  close(L2H_HTML);
  return 1;
}

sub l2h_FromHtml
{
  local($text) = @_;
  local($done, $to_do, $count);
  
  $to_do = $text;
  
  while ($to_do =~ /([^\000]*)<!-- l2h_replace $l2h_name ([0-9]+) -->([^\000]*)/)
  {
    $to_do = $1;
    $count = $2;
    $done = $3.$done;
    
    $done = "<!-- l2h_end $l2h_name $count -->".$done
      if ($T2H_DEBUG & $DEBUG_L2H);

    $done = &l2h_ExtractFromHtml($count) . $done;

    $done = "<!-- l2h_begin $l2h_name $count -->".$done
      if ($T2H_DEBUG & $DEBUG_L2H);
  }
  return $to_do.$done;
}


sub l2h_ExtractFromHtml
{
  local($count) = @_;
  
  return $l2h_from_html[$count] if ($l2h_from_html[$count]);
  
  if ($count >= 0 && $count < $l2h_latex_count)
  {
    # now we are in trouble
    local($l_l2h, $_);

    $l2h_extract_error++;
    print "$ERROR l2h: can't extract content $count from html\n" 
      if ($T2H_VERBOSE);
    # try simple (ordinary) substition (without l2h)
    $l_l2h = $T2H_L2H;
    $T2H_L2H = 0;
    $_ = $l2h_to_latex{$count};
    $_ = &substitute_style($_); 
    &unprotect_texi;
    $_ = "<!-- l2h: ". __LINE__ . " use texi2html -->" . $_
      if ($T2H_DEBUG & $DEBUG_L2H);
    $T2H_L2H = $l_l2h;
    return $_;
  }
  else
  {
    # now we have been incorrectly called
    $l2h_range_error++;
    print "$ERROR l2h: Request of $count content which is out of valide range [0,$l2h_latex_count)\n";
    return "<!-- l2h: ". __LINE__ . " out of range count $count -->"
      if ($T2H_DEBUG & $DEBUG_L2H);
    return "<!-- l2h: out of range count $count -->";
  }
}
    
sub l2h_FinishFromHtml
{
  if ($T2H_VERBOSE)
  {
    if ($l2h_extract_error + $l2h_range_error)
    {
      print "# l2h: finished from html ($l2h_extract_error extract and $l2h_range_error errors)\n";
    }
    else
    {
      print "# l2h: finished from html (no errors)\n";
    }
  }
}

sub l2h_Finish
{
  l2h_StoreCache();
  if ($T2H_L2H_CLEAN)
  {
    print "# l2h: removing temporary files generated by l2h extension\n"
      if $T2H_VERBOSE;
    while (<"$docu_rdir$l2h_name"*>)
    {
      unlink $_;
    }
  }
  print "# l2h: Finished\n" if $T2H_VERBOSE;
  return 1;
}

##############################
# stuff for l2h caching
#

# I tried doing this with a dbm data base, but it did not store all
# keys/values. Hence, I did as latex2html does it
sub l2h_InitCache
{
  if (-r "$l2h_cache_file")
  {
    my $rdo = do "$l2h_cache_file";
    warn("$ERROR l2h Error: could not load $docu_rdir$l2h_cache_file: $@\n")
      unless ($rdo);
  }
}

sub l2h_StoreCache
{
  return unless $l2h_latex_count;
  
  my ($key, $value);
  open(FH, ">$l2h_cache_file") || return warn"$ERROR l2h Error: could not open $docu_rdir$l2h_cache_file for writing: $!\n";

  
  while (($key, $value) = each %l2h_cache)
  {
    # escape stuff
    $key =~ s|/|\\/|g;
    $key =~ s|\\\\/|\\/|g;
    # weird, a \ at the end of the key results in an error
    # maybe this also broke the dbm database stuff
    $key =~ s|\\$|\\\\|;
    $value =~ s/\|/\\\|/g; 
    $value =~ s/\\\\\|/\\\|/g; 
    $value =~ s|\\\\|\\\\\\\\|g;
    print FH "\n\$l2h_cache_key = q/$key/;\n";
    print FH "\$l2h_cache{\$l2h_cache_key} = q|$value|;\n";
  }
  print FH "1;";
  close(FH);
}

# return cached html, if it exists for text, and if all pictures
# are there, as well
sub l2h_FromCache
{
  my $text = shift;
  my $cached = $l2h_cache{$text};
  if ($cached)
  {
    while ($cached =~ m/SRC="(.*?)"/g)
    {
      unless (-e "$docu_rdir$1")
      {
	return undef;
      }
    }
    return $cached;
  }
  return undef;
}

# insert generated html into cache, move away images, 
# return transformed html
$maximage = 1;
sub l2h_ToCache
{
  my $count = shift;
  my $content = shift;
  my @images = ($content =~ /SRC="(.*?)"/g);
  my ($src, $dest);

  for $src (@images)
  {
    $dest = $l2h_img{$src};
    unless ($dest)
    {
      my $ext;
      if ($src =~ /.*\.(.*)$/ && $1 ne $docu_ext)
      {
	$ext = $1;
      }
      else
      {
	warn "$ERROR: L2h image $src has invalid extension\n";
	next;
      }
      while (-e "$docu_rdir${docu_name}_$maximage.$ext") { $maximage++;}
      $dest = "${docu_name}_$maximage.$ext";
      system("cp -f $docu_rdir$src $docu_rdir$dest");
      $l2h_img{$src} = $dest;
      unlink "$docu_rdir$src" unless ($DEBUG & DEBUG_L2H);
    }
    $content =~ s/$src/$dest/g;
  }
  $l2h_cache{$l2h_to_latex[$count]} = $content;
  return $content;
}


#+++############################################################################
#                                                                              #
# Pass 1: read source, handle command, variable, simple substitution           #
#                                                                              #
#---############################################################################

@lines = ();				# whole document
@toc_lines = ();			# table of contents
@stoc_lines = ();			# table of contents
$curlevel = 0;				# current level in TOC
$node = '';				# current node name
$node_next = '';                        # current node next name               
$node_prev = '';                        # current node prev name
$node_up = '';                          # current node up name
$in_table = 0;				# am I inside a table
$table_type = '';			# type of table ('', 'f', 'v', 'multi')
@tables = ();			        # nested table support
$in_bibliography = 0;			# am I inside a bibliography
$in_glossary = 0;			# am I inside a glossary
$in_top = 0;				# am I inside the top node
$has_top = 0;				# did I see a top node?
$has_top_command = 0;			# did I see @top for automatic pointers?
$in_pre = 0;				# am I inside a preformatted section
$in_list = 0;				# am I inside a list
$in_html = 0;				# am I inside an HTML section
$first_line = 1;		        # is it the first line
$dont_html = 0;				# don't protect HTML on this line
$deferred_ref = '';			# deferred reference for indexes
@html_stack = ();			# HTML elements stack
$html_element = '';			# current HTML element
&html_reset;
%macros = ();                           # macros
$toc_indent =                           # used for identation in TOC's
  ($T2H_NUMBER_SECTIONS ? 'BLOCKQUOTE' : 'UL');                     

# init l2h
$T2H_L2H = &l2h_Init($docu_name) if ($T2H_L2H);
$T2H_L2H = &l2h_InitToLatex      if ($T2H_L2H);    

# build code for simple substitutions
# the maps used (%simple_map and %things_map) MUST be aware of this
# watch out for regexps, / and escaped characters!
$subst_code = '';
foreach (keys(%simple_map)) {
    ($re = $_) =~ s/(\W)/\\$1/g; # protect regexp chars
    $subst_code .= "s/\\\@$re/$simple_map{$_}/g;\n";
}
foreach (keys(%things_map)) {
    $subst_code .= "s/\\\@$_\\{\\}/$things_map{$_}/g;\n";
}
if ($use_acc) {
    # accentuated characters
    foreach (keys(%accent_map)) {
	if ($_ eq "`") {
	    $subst_code .= "s/$;3";
	} elsif ($_ eq "'") {
	    $subst_code .= "s/$;4";
	} else {
	    $subst_code .= "s/\\\@\\$_";
	}
	$subst_code .= "([a-z])/&\${1}$accent_map{$_};/gi;\n";
    }
}
eval("sub simple_substitutions { $subst_code }");

&init_input;
INPUT_LINE: while ($_ = &next_line) {
    #
    # remove \input on the first lines only
    #
    if ($first_line) {
	next if /^\\input/;
	$first_line = 0;
    }
    # non-@ substitutions cf. texinfmt.el
    #
    # parse texinfo tags
    #
    $tag = '';
    $end_tag = '';
    if (/^\s*\@end\s+(\w+)\b/) {
	$end_tag = $1;
    } elsif (/^\s*\@(\w+)\b/) {
	$tag = $1;
    }
    #
    # handle @html / @end html
    #
    if ($in_html) {
	if ($end_tag eq 'html') {
	    $in_html = 0;
	} else {
	    $tag2pro{$in_html} .= $_;
	}
	next;
    } elsif ($tag eq 'html') {
	$in_html = $PROTECTTAG . ++$html_num;
	push(@lines, $in_html);
	next;
    }

    #
    # try to remove inlined comments
    # syntax from tex-mode.el comment-start-skip
    #
    s/((^|[^\@])(\@\@)*)\@c(omment | |\{|$).*/$1/;

# Sometimes I use @c right at the end of  a line ( to suppress the line feed )
#    s/((^|[^\@])(\@\@)*)\@c(omment)?$/$1/;
#     s/((^|[^\@])(\@\@)*)\@c(omment)? .*/$1/;
#     s/(.*)\@c{.*?}(.*)/$1$2/;
#     s/(.*)\@comment{.*?}(.*)/$1$2/;
#     s/^(.*)\@c /$1/;
#     s/^(.*)\@comment /$1/;

    #############################################################
    # value substitution before macro expansion, so that
    # it works in macro arguments
    s/\@value{($VARRE)}/$value{$1}/eg;

    #############################################################
    # macro substitution
    while (/\@(\w+)/g)
    {
      if (exists($macros->{$1}))    
      {
	my $before = $`;
	my $name = $1;
	my $after = $';
	my @args;
	my $args;
	#####################################################
	# Support for multi-line macro invocations and nested
	# '{' and '}' within macro invocations added by
	# Eric Sunshine <sunshine@sunshineco.com> 2000/09/10.
	#####################################################
	if ($after =~ /^\s*{/) # Macro arguments delimited by '{' and '}'?
	{
	  my ($protect, $start, $end, $depth, $c) = (0, 0, 0, 0, 0);
	  foreach $c (unpack('C*', $after))
	  {
	    if ($protect)
	    { # Character protected by '\' or '@'; pass through unmolested.
	      $protect = 0;
	    }
	    elsif ($c == ord('\\') || $c == ord('@'))
	    { # '\' and '@' remove special meaning of next character.
	      $protect = 1;
	    }
	    elsif ($c == ord('{')) # Allow '{' and '}' to nest.
	    {
	      $depth++;
	    }
	    elsif ($c == ord('}'))
	    {
	      $depth--;
	      last if $depth == 0;
	    }
	    $start++ if !$depth; # Position of opening brace.
	    $end++;              # Position of closing brace.
	  }
	
	  # '{' & '}' did not completely unnest; append next line; try again.
	  if ($depth > 0)
	  {
	    my $paste = &next_line;
	    die "$ERROR Missing closing brace '}' for invocation of macro " .
	      "\"\@$name\" on line:\n", substr($_,0,70), "...\n" unless $paste;
	    s/\n$/ /;
	    unshift @input_spool, $_ . $paste;
	    next INPUT_LINE;
	  }
	
	  # Extract macro arguments from within '{' and '}'.
	  $len = $end - $start - 1;
	  $args = ($len > 0) ? substr($after, $start + 1, $len) : '';
	  $after = substr($after, $end + 1);
	}
	############ End Sunshine Modifications #############
	elsif (@{$macros->{$name}->{Args}} == 1) # Macro arg extends to EOL.
	{
	  $args = $after;
	  $args =~ s/^\s*//;
	  $args =~ s/\s*$//;
	  $after = '';
	}
	$args =~ s|\\\\|\\|g;
	$args =~ s|\\{|{|g;
        $args =~ s|\\}|}|g;
	if (@{$macros->{$name}->{Args}} > 1)
	{
	  $args =~ s/(^|[^\\]),/$1$;/g ;
	  $args =~ s|\\,|,|g;
	  @args = split(/$;\s*/, $args) if (@{$macros->{$name}->{Args}} > 1);
	}
	else
	{
	  $args =~ s|\\,|,|g;
	  @args = ($args);
	}
	my $macrobody = $macros->{$name}->{Body};
	for ($i=0; $i<=$#args; $i++)
	{
	  $macrobody =~ s|\\$macros->{$name}->{Args}->[$i]\\|$args[$i]|g;
	}
	$macrobody =~ s|\\\\|\\|g;
	$_ = $before . $macrobody . $after;
	unshift @input_spool, map {$_ = $_."\n"} split(/\n/, $_);
	next INPUT_LINE;
      }
    }				#
			    
    
    #
    # try to skip the line
    #
    if ($end_tag) {
        $in_titlepage = 0 if $end_tag eq 'titlepage';
	next if $to_skip{"end $end_tag"};
    } elsif ($tag) {
      $in_titlepage = 1 if $tag eq 'titlepage';
      next if $to_skip{$tag};
      last if $tag eq 'bye';
    }
    if ($in_top) {
	# parsing the top node
	if ($tag eq 'node' || 
	    ($sec2level{$tag} && $tag !~ /unnumbered/ && $tag !~ /heading/))
	{
	    # no more in top
	    $in_top = 0;
	    push(@lines, $TOPEND);
	}
    }
    unless ($in_pre) {
	s/``/\"/g;
	s/''/\"/g;
	s/([\w ])---([\w ])/$1--$2/g;
    }
    #
    # analyze the tag
    #
    if ($tag) {
	# skip lines
	&skip_until($tag), next if $tag eq 'ignore';
	&skip_until($tag), next if $tag eq 'ifnothtml';
	if ($tag eq 'ifinfo')
	{
	  &skip_until($tag), next unless $T2H_EXPAND eq 'info';
	}
	if ($tag eq 'iftex')
	{
	  &skip_until($tag), next unless $T2H_EXPAND eq 'tex';
	} 
	if ($tag eq 'tex')
	{
	  # add to latex2html file
	  if ($T2H_EXPAND eq 'tex' && $T2H_L2H && ! $in_pre)
	  {
	    # add space to the end -- tex(i2dvi) does this, as well 
	    push(@lines, &l2h_ToLatex(&string_until($tag) . " "));
	  }
	  else
	  {
	    &skip_until($tag);
	  }
	  next;
	}
	if ($tag eq 'titlepage')
	{
	  next;
	}
	# handle special tables
	if ($tag =~ /^(|f|v|multi)table$/) {
	    $table_type = $1;
	    $tag = 'table';
	}
	# special cases
	if ($tag eq 'top' || ($tag eq 'node' && /^\@node\s+top\s*,/i)) {
	    $in_top = 1;
	    $has_top = 1;
	    $has_top_command = 1 if $tag eq 'top';
	    @lines = (); # ignore all lines before top (title page garbage)
	    next;
	} elsif ($tag eq 'node') {
	  if ($in_top)
	  {
	    $in_top = 0;
	    push(@lines, $TOPEND);
	  }
	  warn "$ERROR Bad node line: $_" unless $_ =~ /^\@node\s$NODESRE$/o;
	  # request of "Richard Y. Kim" <ryk@ap.com>
	  s/^\@node\s+//;
	  $_ = &protect_html($_); # if node contains '&' for instance
	  ($node, $node_next, $node_prev, $node_up) = split(/,/);
	  &normalise_node($node);
	  &normalise_node($node_next);
	  &normalise_node($node_prev);
	  &normalise_node($node_up);
	  $node =~ /\"/ ?
            push @lines, &html_debug("<A NAME='$node'></A>\n", __LINE__) :
              ###push @lines, &html_debug("<A NAME=\"$node\"></A>\n", __LINE__);
              push @lines, &html_debug("<A NAME=\"$node\"></A>\n", __LINE__);
	  next;
	} elsif ($tag eq 'include') {
	    if (/^\@include\s+($FILERE)\s*$/o) {
		$file = LocateIncludeFile($1);
		if ($file && -e $file) {
		    &open($file);
		    print "# including $file\n" if $T2H_VERBOSE;
		} else {
		    warn "$ERROR Can't find $1, skipping";
		}
	    } else {
		warn "$ERROR Bad include line: $_";
	    }
	    next;
	} elsif ($tag eq 'ifclear') {
	    if (/^\@ifclear\s+($VARRE)\s*$/o) {
		next unless defined($value{$1});
		&skip_until($tag);
	    } else {
		warn "$ERROR Bad ifclear line: $_";
	    }
	    next;
	} elsif ($tag eq 'ifset') {
	    if (/^\@ifset\s+($VARRE)\s*$/o) {
		next if defined($value{$1});
		&skip_until($tag);
	    } else {
		warn "$ERROR Bad ifset line: $_";
	    }
	    next;
          } elsif ($tag eq 'menu') {
            if ($level eq "1")
              {
                push(@lines, "<div class=\"menuindex\"><SCRIPT language=JavaScript src=\"index$node_no\.js\"></SCRIPT></div>");
              }
            else
              {
                unless ($T2H_SHOW_MENU) {
                  &skip_until($tag);
                  next;
                }
                &html_push_if($tag);
                push(@lines, &html_debug('', __LINE__));
            }
	} elsif ($format_map{$tag}) {
	    $in_pre = 1 if $format_map{$tag} eq 'PRE';
	    &html_push_if($format_map{$tag});
	    push(@lines, &html_debug('', __LINE__));
	    $in_list++ if $format_map{$tag} eq 'UL' || $format_map{$tag} eq 'OL' ;
#	    push(@lines, &debug("<BLOCKQUOTE>\n", __LINE__))
#	      if $tag =~ /example/i;
	    # Eric Sunshine <sunshine@sunshineco.com>: <PRE>blah</PRE> looks
	    # better than <PRE>\nblah</PRE> on OmniWeb2 NextStep browser.
	    push(@lines, &debug("<$format_map{$tag}>" . 
				($in_pre ? '' : "\n"), __LINE__));
	    next;
	}
	elsif (exists $complex_format_map->{$tag})
	{
	  my $start = eval $complex_format_map->{$tag}->[0];
	  if ($@)
	  {
	    print "$ERROR: eval of complex_format_map->{$tag}->[0] $complex_format_map->{$tag}->[0]: $@";
	    $start = '<pre>'
	  }
	  $in_pre = 1 if $start =~ /<pre/;
	  push(@lines, html_debug($start. ($in_pre ? '' : "\n"), __LINE__));
	  next;
	} elsif ($tag eq 'table') {
	  # anorland@hem2.passagen.se
	  # if (/^\s*\@(|f|v|multi)table\s+\@(\w+)/) {
	     if (/^\s*\@(|f|v|multi)table\s+\@(\w+)|(\{[^\}]*\})/) {
		$in_table = $2;
		unshift(@tables, join($;, $table_type, $in_table));
		if ($table_type eq "multi") {
		    # don't use borders -- gets confused by empty cells
		    push(@lines, &debug("<TABLE>\n", __LINE__));
		    &html_push_if('TABLE');
		} else {
		    push(@lines, &debug("<DL COMPACT>\n", __LINE__));
		    &html_push_if('DL');
		}
		push(@lines, &html_debug('', __LINE__));
	    } else {
		warn "$ERROR Bad table line: $_";
	    }
	    next;
	} 
	elsif ($tag eq 'synindex' || $tag eq 'syncodeindex') 
	{
	  if (/^\@$tag\s+(\w+)\s+(\w+)\s*$/) 
	  {
	    my $from = $1;
	    my $to = $2;
	    my $prefix_from = IndexName2Prefix($from);
	    my $prefix_to = IndexName2Prefix($to);

	    warn("$ERROR unknown from index name $from ind syn*index line: $_"), next
	      unless $prefix_from;
	    warn("$ERROR unknown to index name $to ind syn*index line: $_"), next
	      unless $prefix_to;

	    if ($tag eq 'syncodeindex')
	    {
	      $index_properties->{$prefix_to}->{'from_code'}->{$prefix_from} = 1;
	    }
	    else
	    {
	       $index_properties->{$prefix_to}->{'from'}->{$prefix_from} = 1;
	    }
	  } 
	  else 
	  {
	    warn "$ERROR Bad syn*index line: $_";
	  }
	  next;
	} 
	elsif ($tag eq 'defindex' || $tag eq 'defcodeindex') 
	{
	  if (/^\@$tag\s+(\w+)\s*$/) 
	  {
	    my $name = $1;
	    $index_properties->{$name}->{name} = $name;
	    $index_properties->{$name}->{code} = 1 if $tag eq 'defcodeindex';
	  } 
	  else 
	  {
	    warn "$ERROR Bad defindex line: $_";
	  }
	  next;
	}
	elsif (/^\@printindex/)
	{
	  push (@lines, "<!--::${section}::-->$_");
	  next;
	}
	elsif ($tag eq 'sp') {
	    push(@lines, &debug("<P>\n", __LINE__));
	    next;
	} elsif ($tag eq 'center') {
	    push(@lines, &debug("<center>\n", __LINE__));
	    s/\@center//;
	} elsif ($tag eq 'setref') {
	    &protect_html; # if setref contains '&' for instance
	    if (/^\@$tag\s*{($NODERE)}\s*$/) {
		$setref = $1;
		$setref =~ s/\s+/ /g; # normalize
		$setref =~ s/ $//;
		$node2sec{$setref} = $name;
		$sec2node{$name} = $setref;
		$node2href{$setref} = "$docu_doc#$docid";
	    } else {
		warn "$ERROR Bad setref line: $_";
	    }
	    next;
	} elsif ($tag eq 'lowersections') {
	    local ($sec, $level);
	    while (($sec, $level) = each %sec2level) {
		$sec2level{$sec} = $level + 1;
	    }
	    next;
	} elsif ($tag eq 'raisesections') {
	    local ($sec, $level);
	    while (($sec, $level) = each %sec2level) {
		$sec2level{$sec} = $level - 1;
	    }
	    next;
	}
	elsif ($tag eq 'macro' || $tag eq 'rmacro')
	{
	  if (/^\@$tag\s*(\w+)\s*(.*)/)
	  {
	    my $name = $1;
	    my @args;
	    @args = split(/\s*,\s*/ , $1)
	      if ($2 =~ /^\s*{(.*)}\s*/);
	    
	    $macros->{$name}->{Args} = \@args;
	    $macros->{$name}->{Body} = '';
	    while (($_ = &next_line) && $_ !~ /\@end $tag/)
	    {
	      $macros->{$name}->{Body} .= $_;
	    }
	    die "ERROR: No closing '\@end $tag' found for macro definition of '$name'\n"
	      unless (/\@end $tag/);
	    chomp $macros->{$name}->{Body};
	  }
	  else
	  {
	    warn "$ERROR: Bad macro defintion $_"
	  }
	  next;
	}
	elsif ($tag eq 'unmacro')
	{
	  delete $macros->{$1} if (/^\@unmacro\s*(\w+)/);
	  next;
	}
	elsif ($tag eq 'documentlanguage')
	{
	  SetDocumentLanguage($1) if (!$T2H_LANG && /documentlanguage\s*(\w+)/);
	}
	elsif (defined($def_map{$tag})) {
	    if ($def_map{$tag}) {
		s/^\@$tag\s+//;
		$tag = $def_map{$tag};
		$_ = "\@$tag $_";
		$tag =~ s/\s.*//;
	    }
	} elsif (defined($user_sub{$tag})) {
	    s/^\@$tag\s+//;
	    $sub = $user_sub{$tag};
	    print "# user $tag = $sub, arg: $_" if $T2H_DEBUG & $DEBUG_USER;
	    if (defined(&$sub)) {
		chop($_);
		&$sub($_);
	    } else {
		warn "$ERROR Bad user sub for $tag: $sub\n";
	    }
	    next;
          }
	if (defined($def_map{$tag})) {
	    s/^\@$tag\s+//;
	    if ($tag =~ /x$/) {
		# extra definition line
		$tag = $`;
		$is_extra = 1;
	    } else {
		$is_extra = 0;
	    }
	    while (/\{([^\{\}]*)\}/) {
		# this is a {} construct
		($before, $contents, $after) = ($`, $1, $');
		# protect spaces
		$contents =~ s/\s+/$;9/g;
		# restore $_ protecting {}
		$_ = "$before$;7$contents$;8$after";
	    }
	    @args = split(/\s+/, &protect_html($_));
	    foreach (@args) {
		s/$;9/ /g;	# unprotect spaces
		s/$;7/\{/g;	# ... {
		s/$;8/\}/g;	# ... }
	    }
	    $type = shift(@args);
	    $type =~ s/^\{(.*)\}$/$1/;
	    print "# def ($tag): {$type} ", join(', ', @args), "\n"
		if $T2H_DEBUG & $DEBUG_DEF;
	    $type .= ':' if (!$T2H_DEF_TABLE); # it's nicer like this
	    my $name = shift(@args);
	    $name =~ s/^\{(.*)\}$/$1/;
            if ($is_extra) {
                $_ = &debug("<DT>", __LINE__) if (!$T2H_DEF_TABLE);
                $_ = &debug("", __LINE__) if ($T2H_DEF_TABLE);
                #$_ = &debug("<TR TEST1>\n", __LINE__) if ($T2H_DEF_TABLE);
	    } else {
		$_ = &debug("<DL>\n<DT>", __LINE__) if (!$T2H_DEF_TABLE);
		$_ = &debug("<TABLE WIDTH=\"100%\">\n", __LINE__) if ($T2H_DEF_TABLE);
	    }
	    if ($tag eq 'deffn' || $tag eq 'defvr' || $tag eq 'deftp') {
                if ($T2H_DEF_TABLE)
                {
                    $_ .= "<TR>\n<TD ALIGN=\"LEFT\"><B>$name</B>\n";
                    $_ .= " <I>@args</I>" if @args;
                    $_ .= "</TD>\n";
                    $_ .= "<TD ALIGN=\"RIGHT\">";
                    $_ .= "$type</TD>\n</TR>\n";
                }
                else
                {
                    $_ .= "<U>$type</U> <B>$name</B>";
                    $_ .= " <I>@args</I>" if @args;
                }
            } elsif ($tag eq 'deftypefn' || $tag eq 'deftypevr'
                      || $tag eq 'deftypeop' || $tag eq 'defcv'
                      || $tag eq 'defop') {
		$ftype = $name;
		$name = shift(@args);
                $name =~ s/^\{(.*)\}$/$1/;
                if ($T2H_DEF_TABLE)
                {
                    $_ .= "<TR>\n<TD ALIGN=\"LEFT\"><B>$name</B>";
                    $_ .= " <I>@args</I>" if @args;
                    $_ .= "</TD>\n";
                    $_ .= "<TD ALIGN=\"RIGHT\">";
                    $_ .= "$type of $ftype</TD>\n</TR>\n";
                }
                else
                {
                    $_ .= "<U>$type</U> $ftype <B>$name</B>";
                    $_ .= " <I>@args</I>" if @args;
                }
	    } else {
		warn "$ERROR Unknown definition type: $tag\n";
		$_ .= "<U>$type</U> <B>$name</B>";
		$_ .= " <I>@args</I>" if @args;
	    }
 	    $_ .= &debug("\n<DD>", __LINE__) if (!$T2H_DEF_TABLE);
            ########$_ .= &debug("\n</TABLE TEST3>\n<TABLE WIDTH=\"95%\">\n", __LINE__) if ($T2H_DEF_TABLE);
	    $name = &unprotect_html($name);
	    if ($tag eq 'deffn' || $tag eq 'deftypefn') {
	      EnterIndexEntry('f', $name, $docu_doc, $section, \@lines);
#		unshift(@input_spool, "\@findex $name\n");
	    } elsif ($tag eq 'defop') {
	      EnterIndexEntry('f', "$name on $ftype", $docu_doc, $section, \@lines);
#		unshift(@input_spool, "\@findex $name on $ftype\n");
	    } elsif ($tag eq 'defvr' || $tag eq 'deftypevr' || $tag eq 'defcv') {
	      EnterIndexEntry('v', $name, $docu_doc, $section, \@lines);
#		unshift(@input_spool, "\@vindex $name\n");
	    } else {
	      EnterIndexEntry('t', $name, $docu_doc, $section, \@lines);
#		unshift(@input_spool, "\@tindex $name\n");
	    }
            $dont_html = 1;
	}
    } elsif ($end_tag) {
	if ($format_map{$end_tag}) {
	    $in_pre = 0 if $format_map{$end_tag} eq 'PRE';
	    $in_list-- if $format_map{$end_tag} eq 'UL' || $format_map{$end_tag} eq 'OL' ;
	    &html_pop_if('P');
	    &html_pop_if('LI');
	    &html_pop_if();
	    push(@lines, &debug("</$format_map{$end_tag}>\n", __LINE__));
	    push(@lines, &html_debug('', __LINE__));
	}
	elsif (exists $complex_format_map->{$end_tag})
	{
	  my $end = eval $complex_format_map->{$end_tag}->[1];
	  if ($@)
	  {
	    print "$ERROR: eval of complex_format_map->{$end_tag}->[1] $complex_format_map->{$end_tag}->[0]: $@";
	    $end = '</pre>'
	  }
	  $in_pre = 0 if $end =~ m|</pre>|;
	  push(@lines, html_debug($end, __LINE__));
	} elsif ($end_tag =~ /^(|f|v|multi)table$/) {
	    unless (@tables) {
		warn "$ERROR \@end $end_tag without \@*table\n";
		next;
	    }
	    &html_pop_if('P');
	    ($table_type, $in_table) = split($;, shift(@tables));
	    unless ($1 eq $table_type) {
		warn "$ERROR \@end $end_tag without matching \@$end_tag\n";
		next;
	    }
	    if ($table_type eq "multi") {
		push(@lines, "</TR></TABLE>\n");
		&html_pop_if('TR');
	    } else {
		push(@lines, "</DL>\n");
		&html_pop_if('DD');
	    }
	    &html_pop_if();
	    if (@tables) {
		($table_type, $in_table) = split($;, $tables[0]);
	    } else {
		$in_table = 0;
	    }
	} elsif (defined($def_map{$end_tag})) {
 	    push(@lines, &debug("</DL>\n", __LINE__)) if (!$T2H_DEF_TABLE);
 	    push(@lines, &debug("</TABLE>\n", __LINE__)) if ($T2H_DEF_TABLE);
	} elsif ($end_tag eq 'menu') {
	    &html_pop_if();
	    push(@lines, $_); # must keep it for pass 2
	} 
	next;
    }
    #############################################################
    # anchor insertion
    while (/\@anchor\s*\{(.*?)\}/)
    {
      $_ = $`.$';
      my $anchor = $1;
      $anchor = &normalise_node($anchor);
      push @lines, &html_debug("<A NAME=\"$anchor\"> </A>\n");
      $node2href{$anchor} = "$docu_doc#$anchor";
      next INPUT_LINE if $_ =~ /^\s*$/;
    }

    #############################################################
    # index entry generation, after value substitutions
    if (/^\@(\w+?)index\s+/)
    {
      EnterIndexEntry($1, $', $docu_doc, $section, \@lines);
      next;
    }
    #
    # protect texi and HTML things
    &protect_texi;
    $_ = &protect_html($_) unless $dont_html;
    $dont_html = 0;
    # substitution (unsupported things)
    s/^\@exdent\s+//g;
    s/\@noindent\s+//g;
    s/\@refill\s+//g;
    # other substitutions
    &simple_substitutions;
    s/\@footnote\{/\@footnote$docu_doc\{/g; # mark footnotes, cf. pass 4
    #
    # analyze the tag again
    #
    if ($tag) {
      if (defined($sec2level{$tag}) && $sec2level{$tag} > 0) {
	    if (/^\@$tag\s+(.+)$/) {
		$name = $1;
		$name = &normalise_node($name);
		$level = $sec2level{$tag};
		# check for index
		$first_index_chapter = $name
		  if ($level == 1 && !$first_index_chapter && 
		      $name =~ /index/i);
		if ($in_top && /heading/){
		    $T2H_HAS_TOP_HEADING = 1;
                    $_ = &debug("<H$level>$name</H$level>\n", __LINE__);
		    &html_push_if('body');
		    print "# top heading, section $name, level $level\n"
			if $T2H_DEBUG & $DEBUG_TOC;
		}
		else
		{
		  unless (/^\@\w*heading/)
		  {
		    unless (/^\@unnumbered/)
		    {
		      my $number = &update_sec_num($tag, $level);
		      $name = $number. ' ' . $name if $T2H_NUMBER_SECTIONS;
		      $sec2number{$name} = $number;
		      $number2sec{$number} = $name;
		    }
		    if (defined($toplevel))
		    {
		      push @lines, ($level==$toplevel ? $CHAPTEREND : $SECTIONEND);
		    }
		    else
		    {
		      # first time we see a "section"
		      unless ($level == 1) 
		      {
			warn "$WARN The first section found is not of level 1: $_";
		      }
		      $toplevel = $level;
		    }
		    push(@sections, $name);
		    next_doc() if ($T2H_SPLIT eq 'section' ||
				   $T2H_SPLIT && $level == $toplevel);
		  }
		  $sec_num++;
		  $docid = "SEC$sec_num";
		  $tocid = (/^\@\w*heading/ ? undef : "TOC$sec_num");
		  # check biblio and glossary
		  $in_bibliography = ($name =~ /^([A-Z]|\d+)?(\.\d+)*\s*bibliography$/i);
		  $in_glossary = ($name =~ /^([A-Z]|\d+)?(\.\d+)*\s*glossary$/i);
                  
                
		  # check node
		  if ($node)
		  {
		    warn "$ERROR Duplicate node found: $node\n"
		      if ($node2sec{$node});
		  }
		  else
		  {
		    $name .= ' ' while ($node2sec{$name});
		    $node = $name;
		  }
                  
                  $node =~ /\"/ ?
                    push @lines, &html_debug("<A NAME='$node'></A>\n", __LINE__) :
                      ###push @lines, &html_debug("<A NAME=\"$node\"></A>\n", __LINE__);
                      push @lines, &html_debug("<A NAME=\"$node\"></A>\n", __LINE__);
                  
		  $name .= ' ' while ($sec2node{$name});
		  $section = $name; 
		  $node2sec{$node} = $name;
		  $sec2node{$name} = $node;
		  $node2href{$node} = "$docu_doc#$docid";
		  $node2next{$node} = $node_next;
		  $node2prev{$node} = $node_prev;
		  $node2up{$node} = $node_up;
		  print "# node $node, section $name, level $level\n"
		    if $T2H_DEBUG & $DEBUG_TOC;

		  $node = '';
		  $node_next = '';
		  $node_prev = '';
		  $node_next = '';

		  if ($tocid)
		  {
		    # update TOC
		    while ($level > $curlevel) {
		      $curlevel++;
		      push(@toc_lines, "<$toc_indent>\n");
		    }
		    while ($level < $curlevel) {
		      $curlevel--;
		      push(@toc_lines, "</$toc_indent>\n");
		    }
		    $_ = &t2h_anchor($tocid, "$docu_doc#$docid", $name, 1);
		    $_ = &substitute_style($_);
		    push(@stoc_lines, "$_<BR>\n") if ($level == 1);
		    if ($T2H_NUMBER_SECTIONS)
		    {
		      ##push(@toc_lines, "<div class=\"tlevel$level\">" . $_ . "</div><BR>\n")
		      push(@toc_lines, "<div class=\"tlevel$level\">" . $_ . "</div>\n")
		    }
		    else
		    {
		      push(@toc_lines, "<LI>" . $_ ."</LI>");
		    }
		  }
		  else
		  {
		    push(@lines, &html_debug("<A NAME=\"$docid\"> </A>\n", 
                                             __LINE__));
		  }
                  $name_wiki = $name;
                  $node_no = $name;
                  $ascii = '[\x00-\x7F]';
                  $twoBytes = '[\x8E\xA1-\xFE][\xA1-\xFE]';
                  $threeBytes = '\x8F[\xA1-\xFE][\xA1-\xFE]';
                  $name_wiki =~ s/^[0-9.]*[ ]*//gi;
                  $name_wiki =~ s/[ ]*<EM>\([0-9\/]*\)<\/EM>//gi;
                  $name_wiki =~ s/\s+//gi;
                  $name_wiki =~ s/&#[0-9]+;//gi;
                  $nodename = $sec2node{$name};
                  if ($nodename =~ /\s+$/) { $nodename =~ s/\s+$//; }
                  $nodename =~ s/ /%20/g;
                  if ($node_no =~ /^([0-9A-Za-z]+)\..*$/i)
                    {
                      $node_no =~ s/^([0-9A-Za-z]+)\..*$/$1/gi;
                    }
                    else
                    {
                      $node_no = $nodename;
                      $node_no =~ s/%20//g;
                    }
                  
                  # ����������
                  if ($name_wiki =~ /\s+$/) { $name_wiki =~ s/\s+$//; }
                  &jcode::convert(\$name_wiki, 'euc');
                  $name_wiki = "texi/elisp21/".$name_wiki;
                  $name_wiki2 = $name_wiki;
                  $name_wiki2 = &url_encode($name_wiki);
                  $name_wiki3 = &url_encode2($name_wiki);

                  $filename = "d:/akihisa/backup/www/pukiwiki/wiki/$name_wiki3.txt";
                 if (-e $filename) {
		     @foo = stat($filename);	# stat�ǥե�����������
		     ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst)
			 = localtime($foo[9]);# ��������
		     $year += 1900;
		     $mon += 1;
                     $size = (-s $filename);
                     $size = $size / 1000;
                     $size = trunc($size,1);
                     
                     $filename = "$year/$mon/$mday";
                 }
                 else
                   {
                     $filename = "̵��"
                 }

                  if ($level eq "1")
                    {
                      if ($node_no ne "1")
                        {
                          if ($lastlevel eq "5")
                            { print JSFILE "</ul></ul></ul></ul>";}
                          elsif ($lastlevel eq "4")
                            { print JSFILE "</ul></ul></ul>";}
                          elsif ($lastlevel eq "3")
                            { print JSFILE "</ul></ul>";}
                          elsif ($lastlevel eq "2")
                            { print JSFILE "</ul>";}
                          elsif ($lastlevel eq "1")
                            { }
                          ##print JSFILE "</ul> </td> </tr></table>');";
                          print JSFILE "</ul>');";
                          close( JSFILE );
                        }
                      #$filestring = "document.writeln('<table> <tr> <td> <ul> ";
                      $filestring = "document.writeln('<ul> ";
                      &jcode::convert(\$filestring, 'euc');
                      open( JSFILE, ">index$node_no\.js" ) || die "index$node_no\.js file open error!";
                      print JSFILE "$filestring";
                      $lastlevel = $level;
                    }
                  if ($lastlevel == $level) {}
                  else {
                    if ($lastlevel > $level)
                      {
                        $leveldiff = $lastlevel - $level;
                        while ($leveldiff ne 0)
                          {
                            $leveldiff -= 1;
                            print JSFILE "</ul>";
                          }
                      }
                    else {
                        print JSFILE "<ul>";
                      }}

                  $outputname = $name;
                  ##$outputname =~ s/[ ]*<EM>\([0-9\/]*\)<\/EM>//gi;
                  $outputname =~ s/'//gi;

                  $filestring = "<li> <a href=\"#${docid}\">$outputname</a>";
                  &jcode::convert(\$filestring, 'euc');
                  print JSFILE "$filestring";

                  $lastlevel = $level;
		  # update DOC
		  push(@lines, &html_debug('', __LINE__));
		  &html_reset;
		  $_ =  "<H$level> $name </H$level>\n<!--docid::${docid}::-->\n<div class=\"info\">URL=\"<a href=\"http://www.bookshelf.jp/cgi-bin/goto.cgi?file=elisp21&node=$nodename\">http://www.bookshelf.jp/cgi-bin/goto.cgi?file=elisp21&node=$nodename</a>\"<br>\n\"$name_wiki\"�ؤ�<a href=\"http://www.bookshelf.jp/pukiwiki/pukiwiki.php?refer=Meadow%20memo&cmd=read&page=$name_wiki2\">������</a>($filename)</div><FORM METHOD=\"GET\" ACTION=\"http://www.bookshelf.jp/cgi-bin/wwwsrch.cgi\"><div class=\"info\">����<INPUT TYPE=text NAME=WORD SIZE=30><INPUT TYPE=hidden NAME=index VALUE=memo CHECKED><INPUT TYPE=hidden NAME=target VALUE=all CHECKED><INPUT TYPE=hidden NAME=\"memoall\" VALUE=\"on\" CHECKED><INPUT TYPE=hidden NAME=ANDOR VALUE=and CHECKED><INPUT TYPE=radio NAME=lisp VALUE=off CHECKED>��ʸ<INPUT TYPE=radio NAME=lisp VALUE=on>Elisp<INPUT TYPE=submit VALUE=\"����\"></div></FORM>";
		  $_ = &debug($_, __LINE__);
		  push(@lines, &html_debug('', __LINE__));
		}
		# update DOC
		foreach $line (split(/\n+/, $_)) {
		    push(@lines, "$line\n");
		}
		next;
	    } else {
		warn "$ERROR Bad section line: $_";
	    }
	} else {
	    # track variables
	    $value{$1} = Unprotect_texi($2), next if /^\@set\s+($VARRE)\s+(.*)$/o;
	    delete $value{$1}, next if /^\@clear\s+($VARRE)\s*$/o;
	    # store things
	    $value{'_shorttitle'} = Unprotect_texi($1), next if /^\@shorttitle\s+(.*)$/;
	    $value{'_setfilename'}   = Unprotect_texi($1), next if /^\@setfilename\s+(.*)$/;
	    $value{'_settitle'}      = Unprotect_texi($1), next if /^\@settitle\s+(.*)$/;
	    $value{'_author'}   .= Unprotect_texi($1)."\n", next if /^\@author\s+(.*)$/;
	    $value{'_subtitle'} .= Unprotect_texi($1)."\n", next if /^\@subtitle\s+(.*)$/;
	    $value{'_title'}    .= Unprotect_texi($1)."\n", next if /^\@title\s+(.*)$/;

	    # list item
	    if (/^\s*\@itemx?\s+/) {
		$what = $';
		$what =~ s/\s+$//;
		if ($in_bibliography && $use_bibliography) {
		    if ($what =~ /^$BIBRE$/o) {
			$id = 'BIB' . ++$bib_num;
			$bib2href{$what} = "$docu_doc#$id";
			print "# found bibliography for '$what' id $id\n"
			    if $T2H_DEBUG & $DEBUG_BIB;
			$what = &t2h_anchor($id, '', $what);
		    }
		} elsif ($in_glossary && $T2H_USE_GLOSSARY) {
		    $id = 'GLOSS' . ++$gloss_num;
		    $entry = $what;
		    $entry =~ tr/A-Z/a-z/ unless $entry =~ /^[A-Z\s]+$/;
		    $gloss2href{$entry} = "$docu_doc#$id";
		    print "# found glossary for '$entry' id $id\n"
			if $T2H_DEBUG & $DEBUG_GLOSS;
		    $what = &t2h_anchor($id, '', $what);
		}
		elsif ($in_table && ($table_type eq 'f' || $table_type eq 'v'))
		{
		  EnterIndexEntry($table_type, $what, $docu_doc, $section, \@lines);
		}
		&html_pop_if('P');
		if ($html_element eq 'DL' || $html_element eq 'DD') {
		    if ($things_map{$in_table} && !$what) {
			# special case to allow @table @bullet for instance
			push(@lines, &debug("<DT>$things_map{$in_table}\n", __LINE__));
		    } else {
			push(@lines, &debug("<DT>\@$in_table\{$what\}\n", __LINE__));
		    }
		    push(@lines, "<DD>");
		    &html_push('DD') unless $html_element eq 'DD';
		    if ($table_type) { # add also an index
			unshift(@input_spool, "\@${table_type}index $what\n");
		    }
		} elsif ($html_element eq 'TABLE') {
		    push(@lines, &debug("<TR><TD>$what</TD>\n", __LINE__));
		    &html_push('TR');
		} elsif ($html_element eq 'TR') {
		    push(@lines, &debug("</TR>\n", __LINE__));
		    push(@lines, &debug("<TR><TD>$what</TD>\n", __LINE__));
		} else {
		    push(@lines, &debug("<LI>$what\n", __LINE__));
		    &html_push('LI') unless $html_element eq 'LI';
		}
		push(@lines, &html_debug('', __LINE__));
		if ($deferred_ref) {
		    push(@lines, &debug("$deferred_ref\n", __LINE__));
		    $deferred_ref = '';
		}
		next;
	    } elsif (/^\@tab\s+(.*)$/) {
		push(@lines, "<TD>$1</TD>\n");
		next;
	    }
	}
    }
    # paragraph separator
    if ($_ eq "\n" && ! $in_pre) {
	next if $#lines >= 0 && $lines[$#lines] eq "\n";
	if ($html_element eq 'P') {
	    push (@lines, &debug("<P>\n", __LINE__));
	}
# 	else
# 	{
# 	  push(@lines, "<P></P>\n");
# 	  $_ = &debug("<P></P>\n", __LINE__);
# 	}
        elsif ($html_element eq 'body' || $html_element eq 'BLOCKQUOTE' || $html_element eq 'DD' || $html_element eq 'LI') 
	{
	  &html_push('P');
	  push(@lines, &debug("<P>\n", __LINE__));
	}
      }
    # otherwise
    push(@lines, $_) unless $in_titlepage;
    push(@lines, &debug("</center>\n", __LINE__))  if ($tag eq 'center');
}

# finish TOC
$level = 0;
while ($level < $curlevel) {
    $curlevel--;
    push(@toc_lines, "</$toc_indent>\n");
}

push(@toc_lines, "<hr>");
    
print "# end of pass 1\n" if $T2H_VERBOSE;

SetDocumentLanguage('en') unless ($T2H_LANG);
#+++############################################################################
#                                                                              #
# Stuff related to Index generation                                            #
#                                                                              #
#---############################################################################

sub EnterIndexEntry
{
  my $prefix = shift;
  my $key = shift;
  my $docu_doc = shift;
  my $section = shift;
  my $lines = shift;
  local $_;

  warn "$ERROR Undefined index command: $_", next
    unless (exists ($index_properties->{$prefix}));
  $key =~ s/\s+$//;
  $_ = $key;
  &protect_texi;
  $key = $_;
  $_ = &protect_html($_);
  my $html_key = substitute_style($_);
  my $id;
  $key = remove_style($key);
  $key = remove_things($key);
  $_ = $key;
  &unprotect_texi;
  $key = $_;
  while (exists $index->{$prefix}->{$key}) {$key .= ' '};
  if ($lines->[$#lines] =~ /^<!--docid::(.+)::-->$/)
  {
    $id = $1;
  }
  else
  {
    $id = 'IDX' . ++$idx_num;
    push(@$lines, &t2h_anchor($id, '', $T2H_INVISIBLE_MARK, !$in_pre));
  }
  $index->{$prefix}->{$key}->{html_key} = $html_key;
  $index->{$prefix}->{$key}->{section} = $section;
  $index->{$prefix}->{$key}->{href} = "$docu_doc#$id";
  print "# found ${prefix}index  for '$key' with id $id\n"
    if $T2H_DEBUG & $DEBUG_INDEX;
}

sub IndexName2Prefix
{
  my $name = shift;
  my $prefix;

  for $prefix (keys %$index_properties)
  {
    return $prefix if ($index_properties->{$prefix}->{name} eq $name);
  }
  return undef;
}

sub GetIndexEntries
{
  my $normal = shift;
  my $code = shift;
  my ($entries, $prefix, $key) = ({});
  
  for $prefix (keys %$normal)
  {
    for $key (keys %{$index->{$prefix}})
    {
      $entries->{$key} = {%{$index->{$prefix}->{$key}}};
    }
  }

  if (defined($code))
  {
    for $prefix (keys %$code)
    {
      unless (exists $normal->{$keys})
      {
	for $key (keys %{$index->{$prefix}})
	{
	  $entries->{$key} = {%{$index->{$prefix}->{$key}}};
	  $entries->{$key}->{html_key} = "<CODE>$entries->{$key}->{html_key}</CODE>";
	}
      }
    }
  }
  return $entries;
}

sub byAlpha
{
  if ($a =~ /^[A-Za-z]/)
  {
    if ($b =~ /^[A-Za-z]/)
    {
      return lc($a) cmp lc($b);
    }
    else
    {
      return 1;
    }
  }
  elsif ($b =~ /^[A-Za-z]/)
  {
    return -1;
  }
  else
  {
    return lc($a) cmp lc($b);
  } 
}

sub GetIndexPages
{
  my $entries = shift;
  my (@Letters, $key);
  my ($EntriesByLetter, $Pages, $page) = ({}, [], {});
  my @keys = sort byAlpha keys %$entries;

  for $key (@keys)
  {
    $tmp = $key;
    # ����EUC���Ѵ�����
    &jcode'convert(*tmp, "euc");
    $ascii = '[\x00-\x7F]';
    $twoBytes = '[\x8E\xA1-\xFE][\xA1-\xFE]';
    $threeBytes = '\x8F[\xA1-\xFE][\xA1-\xFE]';
    
    if ($tmp =~ /^(?:$ascii)/) {
      $tmp =~ s/^(.).*$/$1/g;
    }
    if ($tmp =~ /^(?:$twoBytes)/) {
      $tmp =~ s/^(..).*$/$1/g;
    }
    if ($tmp =~ /^(?:$threeBytes)/) {
      $tmp =~ s/^(...).*$/$1/g;
    }

    push @{$EntriesByLetter->{uc(substr($key,0, (length $tmp)))}} , $entries->{$key};
  }
  @Letters = sort byAlpha keys %$EntriesByLetter;
  
  $T2H_SPLIT_INDEX = 0 unless ($T2H_SPLIT);

  unless ($T2H_SPLIT_INDEX)
  {
    $page->{First} = $Letters[0];
    $page->{Last} = $Letters[$#Letters];
    $page->{Letters} = \@Letters;
    $page->{EntriesByLetter} = $EntriesByLetter;
    push @$Pages, $page;
    return $Pages;
  }

  if ($T2H_SPLIT_INDEX =~ /^\d+$/)
  {
    my $i = 0;
    my ($prev_letter, $letter);
    $page->{First} = $Letters[0];
    for $letter (@Letters)
    {
      if ($i > $T2H_SPLIT_INDEX)
      {
	$page->{Last} = $prev_letter;
	push @$Pages, {%$page};
	$page->{Letters} = [];
	$page->{EntriesByLetter} = {};
	$page->{First} = $letter;
	$i=0;
      }
      push @{$page->{Letters}}, $letter;
      $page->{EntriesByLetter}->{$letter} = [@{$EntriesByLetter->{$letter}}];
      $i += scalar(@{$EntriesByLetter->{$letter}});
      $prev_letter = $letter;
    }
    $page->{Last} = $Letters[$#Letters];
    push @$Pages, {%$page};
  }
  return $Pages;
}

sub GetIndexSummary
{
  my $first_page = shift;
  my $Pages = shift;
  my $name = shift;
  my ($page, $letter, $summary, $i, $l1, $l2, $l);

  $i = 0;
  $summary = '<table><tr><th valign=top>Jump to: &nbsp; </th><td>';
  
  for $page ($first_page, @$Pages)
  {
    for $letter (@{$page->{Letters}})
    {
      $l = t2h_anchor('', "$page->{href}#${name}_$letter", "<b>$letter</b>", 
		      0, 'style="text-decoration:none"') . "\n &nbsp; \n";
      
      if ($letter =~ /^[A-Za-z]/)
      {
	$l2 .= $l;
      }
      else
      {
	$l1 .= $l;
      }
    }
  }
  $summary .= $l1 . "<BR>\n" if ($l1);
  $summary .= $l2 . '</td></tr></table><br>';
  return $summary;
}

sub PrintIndexPage
{
  my $lines = shift;
  my $summary = shift;
  my $page = shift;
  my $name = shift;

  push @$lines, $summary;

  push @$lines , <<EOT;
<P>
<TABLE border=0>
<TR><TD></TD><TH ALIGN=LEFT>Index Entry</TH><TH ALIGN=LEFT> Section</TH></TR>
<TR><TD COLSPAN=3> <HR></TD></TR>
EOT

  for $letter (@{$page->{Letters}})
  {
    push @$lines, "<TR><TH><A NAME=\"${name}_$letter\"></A>$letter</TH><TD></TD><TD></TD></TR>\n";
    for $entry (@{$page->{EntriesByLetter}->{$letter}})
    {
      push @$lines, 
      "<TR><TD></TD><TD valign=top>" . 
	t2h_anchor('', $entry->{href}, $entry->{html_key}) .
	  "</TD><TD valign=top>" . 
	    t2h_anchor('', sec_href($entry->{section}), clean_name($entry->{section})) .
	      "</TD></TR>\n";
    }
    push @$lines, "<TR><TD COLSPAN=3> <HR></TD></TR>\n";
  }
  push @$lines, "</TABLE><P>";
  push @$lines, $summary;
}

sub PrintIndex
{
  my $lines = shift;
  my $name = shift;
  my $section = shift;
  $section = 'Top' unless $section;
  my $prefix = IndexName2Prefix($name);

  warn ("$ERROR printindex: bad index name: $name"), return 
    unless $prefix;

  if ($index_properties->{$prefix}->{code})
  {
    $index_properties->{$prefix}->{from_code}->{$prefix} = 1;
  }
  else
  {
    $index_properties->{$prefix}->{from}->{$prefix}= 1;
  }

  my $Entries = GetIndexEntries($index_properties->{$prefix}->{from}, 
				$index_properties->{$prefix}->{from_code});
  return unless %$Entries;

  if ($T2H_IDX_SUMMARY)
  {
    my $key;
    open(FHIDX, ">$docu_rdir$docu_name" . "_$name.idx")
      || die "Can't open > $docu_rdir$docu_name" . "_$name.idx for writing: $!\n";
    print "# writing $name index summary in $docu_rdir$docu_name" . "_$name.idx...\n" if $T2H_VERBOSE;

    for $key (sort keys %$Entries)
    {
      print FHIDX "$key\t$Entries->{$key}->{href}\n";
    }
  }

  my $Pages = GetIndexPages($Entries);
  my $page;
  my $first_page = shift @$Pages;
  my $sec_name = $section;
  # remove section number
  $sec_name =~ s/.*? // if $sec_name =~ /^([A-Z]|\d+)\./;

  ($first_page->{href} = sec_href($section)) =~ s/\#.*$//;
  # Update tree structure of document
  if (@$Pages)
  {
    my $sec;
    my @after;

    while (@sections && $sections[$#sections] ne $section)
    {
      unshift @after, pop @sections;
    }

    for $page (@$Pages)
    {
      my $node = ($page->{First} ne $page->{Last} ? 
		  "$sec_name: $page->{First} -- $page->{Last}" :
		  "$sec_name: $page->{First}");
      push @sections, $node;
      $node2sec{$node} = $node;
      $sec2node{$node} = $node;
      $node2up{$node} = $section;
      $page->{href} = next_doc();
      $page->{name} = $node;
      $node2href{$node} = $page->{href};
      if ($prev_node)
      {
	$node2next{$prev_node} = $node;
	$node2prev{$node} = $prev_node;
      }
      $prev_node = $node;
    }
    push @sections, @after;
  }

  my $summary = GetIndexSummary($first_page, $Pages, $name);
  PrintIndexPage($lines, $summary, $first_page, $name);
  for $page (@$Pages)
  {
    push @$lines, ($T2H_SPLIT eq 'chapter' ? $CHAPTEREND : $SECTIONEND);
    push @$lines, "<H2 ALIGN=\"Left\">$page->{name}</H2>\n";
    PrintIndexPage($lines, $summary, $page, $name);
  }
}


#+++############################################################################
#                                                                              #
# Pass 2/3: handle style, menu, index, cross-reference                         #
#                                                                              #
#---############################################################################

@lines2 = ();				# whole document (2nd pass)
@lines3 = ();				# whole document (3rd pass)
$in_menu = 0;				# am I inside a menu

$top_menu = 0;				# am I inside a menu
$in_h1 = 0;				# am I inside a menu

while (@lines) {
    $_ = shift(@lines);
    #
    # special case (protected sections)
    #
    if (/^$PROTECTTAG/o) {
	push(@lines2, $_);
	next;
    }
    if (/^<H1/)
      {
        $in_h1 = 1;
      }
    if (/^<H2/)
      {
        $in_h1 = 0;
      }
    #
    # menu
    #
    if (/^\@menu\b/)
    {
      $in_menu = 1;
      $in_menu_listing = 1;
      if ($top_menu == 0)
        {
          push(@lines2, &debug("<BLOCKQUOTE><TABLE BORDER=0 CELLSPACING=0> \n", __LINE__));
        }
      elsif ($in_h1 ne "1")
        {
          push(@lines2, &debug("<BLOCKQUOTE><TABLE BORDER=0 CELLSPACING=0> \n", __LINE__));
        }
      else
        {
          push(@lines2, &debug("<noscript><BLOCKQUOTE><TABLE BORDER=0 CELLSPACING=0> \n", __LINE__));
        }
      next;
    }
    if (/^\@end\s+menu\b/)
    {
      if ($in_menu_listing)
      {
        if ($top_menu == 0)
          {
            $top_menu =1;
            push(@lines2, &debug("</TABLE></BLOCKQUOTE>\n", __LINE__));
          }
        elsif ($in_h1 ne "1")
          {
            push(@lines2, &debug("</TABLE></BLOCKQUOTE>\n", __LINE__));
          }
        else
          {
            push(@lines2, &debug("</TABLE></BLOCKQUOTE></noscript>\n", __LINE__));
          }
      }
      else
      {
        if ($top_menu == 0)
          {
            $top_menu =1;
            push(@lines2, &debug("</BLOCKQUOTE>\n", __LINE__));
          }
        elsif ($in_h1 ne "1")
          {
            $top_menu =1;
            push(@lines2, &debug("</BLOCKQUOTE>\n", __LINE__));
          }
        else
          {
            push(@lines2, &debug("</BLOCKQUOTE></noscript>\n", __LINE__));
          }
      }
      $in_menu = 0;
      $in_menu_listing = 0;
      next;
    }
    if ($in_menu) 
    {
      my ($node, $name, $descr);
      if (/^\*\s+($NODERE)::/o)
      {
	$node = $1;
	$descr = $';
      }
      elsif (/^\*\s+(.+):\s+([^\t,\.\n]+)[\t,\.\n]/)
      {
	$name = $1;
	$node = $2;
	$descr = $';
      }
      elsif (/^\*/) 
      {
	warn "$ERROR Bad menu line: $_";
      }
      else
      {
	if ($in_menu_listing)
	{
	  $in_menu_listing = 0;
	  push(@lines2, &debug("</TABLE>\n", __LINE__));
	}
	# should be like verbatim -- preseve spaces, etc
	s/ /\&nbsp;/g;
	$_ .= "<br>\n";
	push(@lines2, $_);
      }
      if ($node)
      {
	if (! $in_menu_listing)
	{
	  $in_menu_listing = 1;
	  push(@lines2, &debug("<TABLE BORDER=0 CELLSPACING=0>\n", __LINE__));
	}
	# look for continuation
	while ($lines[0] =~ /^\s+\w+/)
	{
	  $descr .= shift(@lines);
	}
	&menu_entry($node, $name, $descr);
      } 
      next;
    }
    #
    # printindex
    #
    PrintIndex(\@lines2, $2, $1), next
      if (/^<!--::(.*)::-->\@printindex\s+(\w+)/);
    #
    # simple style substitutions
    #
    $_ = &substitute_style($_);
    #
    # xref
    #
    while (/\@(x|px|info|)ref{([^{}]+)(}?)/) {
	# note: Texinfo may accept other characters
	($type, $nodes, $full) = ($1, $2, $3);
	($before, $after) = ($`, $');
	if (! $full && $after) {
	    warn "$ERROR Bad xref (no ending } on line): $_";
	    $_ = "$before$;0${type}ref\{$nodes$after";
	    next; # while xref
	}
	if ($type eq 'x') {
	    $type = "$T2H_WORDS->{$T2H_LANG}->{'See'} ";
	} elsif ($type eq 'px') {
	    $type = "$T2H_WORDS->{$T2H_LANG}->{'see'} ";
	} elsif ($type eq 'info') {
	    $type = "$T2H_WORDS->{$T2H_LANG}->{'See'} Info";
	} else {
	    $type = '';
	}
	unless ($full) {
	    $next = shift(@lines);
	    $next = &substitute_style($next);
	    chop($nodes); # remove final newline
	    if ($next =~ /\}/) { # split on 2 lines
		$nodes .= " $`";
		$after = $';
	    } else {
		$nodes .= " $next";
		$next = shift(@lines);
		$next = &substitute_style($next);
		chop($nodes);
		if ($next =~ /\}/) { # split on 3 lines
		    $nodes .= " $`";
		    $after = $';
		} else {
		    warn "$ERROR Bad xref (no ending }): $_";
		    $_ = "$before$;0xref\{$nodes$after";
		    unshift(@lines, $next);
		    next; # while xref
		}
	    }
	}
	$nodes =~ s/\s+/ /g; # remove useless spaces
	@args = split(/\s*,\s*/, $nodes);
	$node = $args[0]; # the node is always the first arg
	$node = &normalise_node($node);
	$sec = $args[2] || $args[1] || $node2sec{$node};
    if ($nodes =~ /emacs/)
      {
        $node_name = $nodes;
        $node_name =~ s/(emacs)//g;
        $node_name =~ s/ /%20/g;
        $href = "http://www.bookshelf.jp/cgi-bin/goto.cgi?file=emacs21&node=$node_name";
      }
    else
      {
        $href = $node2href{$node};
      }
	if (@args == 5) { # reference to another manual
	    $sec = $args[2] || $node;
	    $man = $args[4] || $args[3];
        $node_name = $args[0];
        $node_name =~ s/ /%20/g;
        if ($args[3] == "emacs")
          {
            $href = "http://www.bookshelf.jp/cgi-bin/goto.cgi?file=emacs21&node=$node_name";
            $_ = "${before}${type}<a href=\"$href\">$man</a>$after";
          }
        elsif ($args[3] == "elisp")
          {
            $href = "http://www.bookshelf.jp/cgi-bin/goto.cgi?file=elisp21&node=$node_name";
            $_ = "${before}${type}<a href=\"$href\">$man</a>$after";
          }
        else
          {
            $_ = "${before}${type}$T2H_WORDS->{$T2H_LANG}->{'section'} `$sec' in \@cite{$man}$after";
          }
	} elsif ($type =~ /Info/) { # inforef
	    warn "$ERROR Wrong number of arguments: $_" unless @args == 3;
	    ($nn, $_, $in) = @args;
	    $_ = "${before}${type} file `$in', node `$nn'$after";
	} elsif ($sec && $href && ! $T2H_SHORT_REF) {
	    $_  = "${before}${type}";
	    $_ .= "$T2H_WORDS->{$T2H_LANG}->{'section'} " if ${type};
	    $_ .= &t2h_anchor('', $href, $sec) . $after;
	} 
	elsif ($href)
	{
	  $_ = "${before}${type} " . 
	    &t2h_anchor('', $href, $args[2] || $args[1] || $node) . 
	      $after;
	}
	else {
	    warn "$ERROR Undefined node ($node): $_";
	    $_ = "$before$;0xref{$nodes}$after";
	}
    }

    # replace images
    s[\@image\s*{(.+?)}]
    {
     my @args = split (/\s*,\s*/, $1);
     my $base = $args[0];
     my $image = 
       LocateIncludeFile("$base.png") || 
       LocateIncludeFile("$base.jpg") ||
       LocateIncludeFile("$base.gif");
     warn "$ERROR no image file for $base: $_" unless ($image && -e $image);
     "<IMG SRC=\"$image\" ALT=\"$base\">";
     ($T2H_CENTER_IMAGE ?
      "<CENTER><IMG SRC=\"$image\" ALT=\"$base\"></CENTER>" :
      "<IMG SRC=\"$image\" ALT=\"$base\">");
    }eg;

    #
    # try to guess bibliography references or glossary terms
    #
    unless (/^<H\d><A NAME=\"SEC\d/) {
	if ($use_bibliography) {
	    $done = '';
	    while (/$BIBRE/o) {
		($pre, $what, $post) = ($`, $&, $');
		$href = $bib2href{$what};
		if (defined($href) && $post !~ /^[^<]*<\/A>/) {
		    $done .= $pre . &t2h_anchor('', $href, $what);
		} else {
		    $done .= "$pre$what";
		}
		$_ = $post;
	    }
	    $_ = $done . $_;
	}
	if ($T2H_USE_GLOSSARY) {
	    $done = '';
	    while (/\b\w+\b/) {
		($pre, $what, $post) = ($`, $&, $');
		$entry = $what;
		$entry =~ tr/A-Z/a-z/ unless $entry =~ /^[A-Z\s]+$/;
		$href = $gloss2href{$entry};
		if (defined($href) && $post !~ /^[^<]*<\/A>/) {
		    $done .= $pre . &t2h_anchor('', $href, $what);
		} else {
		    $done .= "$pre$what";
		}
		$_ = $post;
	    }
	    $_ = $done . $_;
	}
    }
    # otherwise
    push(@lines2, $_);
}
print "# end of pass 2\n" if $T2H_VERBOSE;

#
# split style substitutions
#
while (@lines2) {
    $_ = shift(@lines2);
    #
    # special case (protected sections)
    #
    if (/^$PROTECTTAG/o) {
	push(@lines3, $_);
	next;
    }
    #
    # split style substitutions
    #
    $old = '';
    while ($old ne $_) {
        $old = $_;
	if (/\@(\w+)\{/) {
	    ($before, $style, $after) = ($`, $1, $');
	    if (defined($style_map{$style})) {
		$_ = $after;
		$text = '';
		$after = '';
		$failed = 1;
		while (@lines2) {
		    if (/\}/) {
			$text .= $`;
			$after = $';
			$failed = 0;
			last;
		    } else {
			$text .= $_;
			$_ = shift(@lines2);
		    }
		}
		if ($failed) {
		    die "* Bad syntax (\@$style) after: $before\n";
		} else {
		    $text = &apply_style($style, $text);
		    $_ = "$before$text$after";
		}
	    }
	}
    }
    # otherwise
    push(@lines3, $_);
}
print "# end of pass 3\n" if $T2H_VERBOSE;
	
#+++############################################################################
#                                                                              #
# Pass 4: foot notes, final cleanup                                            #
#                                                                              #
#---############################################################################

@foot_lines = ();			# footnotes
@doc_lines = ();			# final document
$end_of_para = 0;			# true if last line is <P>
	
while (@lines3) {
    $_ = shift(@lines3);
    #
    # special case (protected sections)
    #
    if (/^$PROTECTTAG/o) {
	push(@doc_lines, $_);
	$end_of_para = 0;
	next;
    }
    #
    # footnotes
    #
    while (/\@footnote([^\{\s]+)\{/) {
	($before, $d, $after) = ($`, $1, $');
	$_ = $after;
	$text = '';
	$after = '';
	$failed = 1;
	while (@lines3) {
	    if (/\}/) {
		$text .= $`;
		$after = $';
		$failed = 0;
		last;
	    } else {
		$text .= $_;
		$_ = shift(@lines3);
	    }
	}
	if ($failed) {
	    die "* Bad syntax (\@footnote) after: $before\n";
	} else {
	    $foot_num++;
	    $docid  = "DOCF$foot_num";
	    $footid = "FOOT$foot_num";
	    $foot = "($foot_num)";
	    push(@foot_lines, "<H3>" . &t2h_anchor($footid, "$d#$docid", $foot) . "</H3>\n");
	    $text = "<P>$text" unless $text =~ /^\s*<P>/;
	    push(@foot_lines, "$text\n");
	    $_ = $before . &t2h_anchor($docid, "$docu_foot#$footid", $foot) . $after;
	}
    }
    #
    # remove unnecessary <P>
    #
    if (/^\s*<P>\s*$/) {
	next if $end_of_para++;
    } else {
	$end_of_para = 0;
    }
    # otherwise
    push(@doc_lines, $_);
}
	
print "# end of pass 4\n" if $T2H_VERBOSE;

#+++############################################################################
#                                                                              #
# Pass 5: print things                                                         #
#                                                                              #
#---############################################################################

$T2H_L2H = &l2h_FinishToLatex if ($T2H_L2H);
$T2H_L2H = &l2h_ToHtml        if ($T2H_L2H);
$T2H_L2H = &l2h_InitFromHtml  if ($T2H_L2H);

##T2H_InitGlobals();

# fix node2up, node2prev, node2next, if desired
if ($has_top_command)
{
  for $section (keys %sec2number)
  {
    $node = $sec2node{$section};
    $node2up{$node} = Sec2UpNode($section) unless $node2up{$node};
    $node2prev{$node} = Sec2PrevNode($section) unless $node2prev{$node};
    $node2next{$node} = Sec2NextNode($section) unless $node2next{$node};
  }
}

# prepare %T2H_THISDOC
$T2H_THISDOC{fulltitle} = $value{'_title'} || $value{'_settitle'} || "Untitled Document";
$T2H_THISDOC{title} = $value{'_settitle'} || $T2H_THISDOC{fulltitle};
$T2H_THISDOC{author} = $value{'_author'};
$T2H_THISDOC{subtitle} = $value{'_subtitle'};
$T2H_THISDOC{shorttitle} = $value{'_shorttitle'};
for $key (keys %T2H_THISDOC)
{
  $_ = &substitute_style($T2H_THISDOC{$key});
  &unprotect_texi;
  s/\s*$//;
  $T2H_THISDOC{$key} = $_;
}

# if no sections, then simply print document as is
unless (@sections)
{
  print "# Writing content into $docu_top_file \n" if $T2H_VERBOSE;
  open(FILE, "> $docu_top_file") 
    || die "$ERROR: Can't open $docu_top_file for writing: $!\n";

  &$T2H_print_page_head(\*FILE);
  $T2H_THIS_SECTION = \@doc_lines;
  t2h_print_lines(\*FILE);
  &$T2H_print_foot_navigation(\*FILE);
  &$T2H_print_page_foot(\*FILE);
  close(FILE);
  goto Finish;
}

# initialize $T2H_HREF, $T2H_NAME
%T2H_HREF = 
  (
   'First' ,   sec_href($sections[0]),
   'Last',     sec_href($sections[$#sections]),
   'About',     $docu_about. '#SEC_About',
  );

# prepare TOC, OVERVIEW, TOP
$T2H_TOC = \@toc_lines;
$T2H_OVERVIEW = \@stoc_lines;
if ($has_top)
{
  while (1)
  {
    $_ = shift @doc_lines;
    last if /$TOPEND/;
    push @$T2H_TOP, $_;
  }
  $T2H_HREF{'Top'} = $docu_top . '#SEC_Top';
}
else
{
  $T2H_HREF{'Top'} = $T2H_HREF{First};
}

$node2href{Top} = $T2H_HREF{Top};
$T2H_HREF{Contents} = $docu_toc.'#SEC_Contents' if @toc_lines;
$T2H_HREF{Overview} = $docu_stoc.'#SEC_OVERVIEW' if @stoc_lines;

# settle on index
if ($T2H_INDEX_CHAPTER)
{
  $T2H_HREF{Index} = $node2href{normalise_node($T2H_INDEX_CHAPTER)};
  warn "$ERROR T2H_INDEX_CHAPTER '$T2H_INDEX_CHAPTER' not found\n"
    unless $T2H_HREF{Index};
}
if (! $T2H_HREF{Index} && $first_index_chapter)
{
  $T2H_INDEX_CHAPTER = $first_index_chapter;
  $T2H_HREF{Index} = $node2href{$T2H_INDEX_CHAPTER};
}

print "# Using '" . clean_name($T2H_INDEX_CHAPTER) . "' as index page\n"
  if ($T2H_VERBOSE && $T2H_HREF{Index});

%T2H_NAME =
  (
   'First',   clean_name($sec2node{$sections[0]}),
   'Last',    clean_name($sec2node{$sections[$#sections]}),
   'About',    $T2H_WORDS->{$T2H_LANG}->{'About_Title'},
   'Contents', $T2H_WORDS->{$T2H_LANG}->{'ToC_Title'},
   'Overview', $T2H_WORDS->{$T2H_LANG}->{'Overview_Title'},
   'Index' ,   clean_name($T2H_INDEX_CHAPTER),
   'Top',      clean_name($T2H_TOP_HEADING || $T2H_THISDOC{'title'} || $T2H_THISDOC{'shorttitle'}),
  );

#############################################################################
# print frame and frame toc file
#
if ( $T2H_FRAMES )
{
  open(FILE, "> $docu_frame_file") 
    || die "$ERROR: Can't open $docu_frame_file for writing: $!\n";
  print "# Creating frame in $docu_frame_file ...\n" if $T2H_VERBOSE;
  &$T2H_print_frame(\*FILE);
  close(FILE);

  open(FILE, "> $docu_toc_frame_file") 
    || die "$ERROR: Can't open $docu_toc_frame_file for writing: $!\n";
  print "# Creating toc frame in $docu_frame_file ...\n" if $T2H_VERBOSE;
   &$T2H_print_toc_frame(\*FILE);
  close(FILE);
}


#############################################################################
# print Top
#
open(FILE, "> $docu_top_file") 
  || die "$ERROR: Can't open $docu_top_file for writing: $!\n";
&$T2H_print_page_head(\*FILE) unless ($T2H_SPLIT);

if ($has_top)
{
  print "# Creating Top in $docu_top_file ...\n" if $T2H_VERBOSE;
  $T2H_THIS_SECTION = $T2H_TOP;
  $T2H_HREF{This} = $T2H_HREF{Top};
  $T2H_NAME{This} = $T2H_NAME{Top};
  &$T2H_print_Top(\*FILE);
}
  
close(FILE) if $T2H_SPLIT;

#############################################################################
# Print sections
#
$T2H_NODE{Forward} = $sec2node{$sections[0]};
$T2H_NAME{Forward} = &clean_name($sec2node{$sections[0]});
$T2H_HREF{Forward} = sec_href($sections[0]);
$T2H_NODE{This} = 'Top';
$T2H_NAME{This} = $T2H_NAME{Top};
$T2H_HREF{This} = $T2H_HREF{Top};
if ($T2H_SPLIT)
{
  print "# writing " . scalar(@sections) . 
    " sections in $docu_rdir$docu_name"."_[1..$doc_num]"
	  if $T2H_VERBOSE;
  $previous = ($T2H_SPLIT eq 'chapter' ? $CHAPTEREND : $SECTIONEND);
  undef $FH;
  $doc_num = 0;
}
else
{
  print "# writing " . scalar(@sections) . " sections in $docu_top_file ..." 
    if $T2H_VERBOSE;
  $FH = \*FILE;
  $previous = '';
}

$counter = 0;
# loop through sections
while ($section = shift(@sections)) 
{
  if ($T2H_SPLIT && ($T2H_SPLIT eq 'section' || $previous eq $CHAPTEREND))
  { 
    if ($FH)
    {
      #close previous page
      &$T2H_print_chapter_footer($FH) if $T2H_SPLIT eq 'chapter';
      &$T2H_print_page_foot($FH);
      close($FH);
      undef $FH;
    }
  }
  $T2H_NAME{Back} = $T2H_NAME{This};
  $mytitle  = $node2sec{$T2H_NAME{Forward}};
  $mytitle =~ s/[ ]*<EM>\([0-9\/]*\)<\/EM>//gi;
  $mytitle =~ s/^[0-9\.]*//i;
  $T2H_NAME{mytitle} = $mytitle;
  $T2H_HREF{Back} = $T2H_HREF{This};
  $T2H_NODE{Back} = $T2H_NODE{This};
  $T2H_NAME{This} = $T2H_NAME{Forward};
  $T2H_HREF{This} = $T2H_HREF{Forward};
  $T2H_NODE{This} = $T2H_NODE{Forward};
  if ($sections[0])
  {
    $T2H_NODE{Forward} = $sec2node{$sections[0]};
    $T2H_NAME{Forward} = &clean_name($T2H_NODE{Forward});
    $T2H_HREF{Forward} = sec_href($sections[0]);
  }
  else
  {
    undef $T2H_HREF{Forward}, $T2H_NODE{Forward}, $T2H_NAME{Forward};
  }

  $node = $node2up{$T2H_NODE{This}};
  $T2H_HREF{Up} = $node2href{$node};
  if ($T2H_HREF{Up} eq $T2H_HREF{This} || ! $T2H_HREF{Up})
  {
    $T2H_NAME{Up} = $T2H_NAME{Top};
    $T2H_HREF{Up} = $T2H_HREF{Top};
    $T2H_NODE{Up} = 'Up';
  }
  else
  {
    $T2H_NAME{Up} = &clean_name($node);
    $T2H_NODE{Up} = $node;
  }

  $node = $T2H_NODE{This};
  $node = $node2prev{$node};
  $T2H_NAME{Prev} = &clean_name($node);
  $T2H_HREF{Prev} = $node2href{$node};
  $T2H_NODE{Prev} = $node;

  $node = $T2H_NODE{This};
  if ($node2up{$node} && $node2up{$node} ne 'Top'&&
      ($node2prev{$node} eq $T2H_NODE{Back} || ! $node2prev{$node}))
  {
    $node = $node2up{$node};
    while ($node && $node ne $node2up{$node} && ! $node2prev{$node})
    {
      $node = $node2up{$node};
    }
    $node = $node2prev{$node} 
      unless $node2up{$node} eq 'Top' || ! $node2up{$node};
  }
  else
  {
    $node = $node2prev{$node};
  }
  $T2H_NAME{FastBack} = &clean_name($node);
  $T2H_HREF{FastBack} = $node2href{$node};
  $T2H_NODE{FastBack} = $node;
  
  $node = $T2H_NODE{This};
  $node = $node2next{$node};
  $T2H_NAME{Next} = &clean_name($node);
  $T2H_HREF{Next} = $node2href{$node};
  $T2H_NODE{Next} = $node;

  $node = $T2H_NODE{This};
  if ($node2up{$node} && $node2up{$node} ne 'Top'&& 
      ($node2next{$node} eq $T2H_NODE{Forward} || ! $node2next{$node}))
  {
    $node = $node2up{$node};
    while ($node && $node ne $node2up{$node} && ! $node2next{$node})
    {
      $node = $node2up{$node};
    }
  }
  $node = $node2next{$node};
  $T2H_NAME{FastForward} = &clean_name($node);
  $T2H_HREF{FastForward} = $node2href{$node};
  $T2H_NODE{FastForward} = $node;

  if (! defined($FH))
  {
    my $file = $T2H_HREF{This};
    $file =~ s/\#.*$//;
    open(FILE, "> $docu_rdir$file") || 
      die "$ERROR: Can't open $docu_rdir$file for writing: $!\n";
    $FH = \*FILE;
    &$T2H_print_page_head($FH);
    t2h_print_label($FH);
    &$T2H_print_chapter_header($FH) if $T2H_SPLIT eq 'chapter';
  }
  else
  {
    t2h_print_label($FH);
  }

  $T2H_THIS_SECTION = [];
  while (@doc_lines) {
    $_ = shift(@doc_lines);
    last if ($_ eq $SECTIONEND || $_ eq $CHAPTEREND);
    push(@$T2H_THIS_SECTION, $_);
  }
  $previous = $_;
  &$T2H_print_section($FH);

  if ($T2H_VERBOSE)
  {
    $counter++;
    print "." if $counter =~ /00$/;
  }
}
if ($T2H_SPLIT)
{
  &$T2H_print_chapter_footer($FH) if $T2H_SPLIT eq 'chapter';
  &$T2H_print_page_foot($FH);
  close($FH);
}
print "\n" if $T2H_VERBOSE;

#############################################################################
# Print ToC, Overview, Footnotes
#
undef $T2H_HREF{Prev};
undef $T2H_HREF{Next};
undef $T2H_HREF{Back};
undef $T2H_HREF{Forward};
undef $T2H_HREF{Up};

if (@foot_lines)
{
  print "# writing Footnotes in $docu_foot_file...\n" if $T2H_VERBOSE;
  open (FILE, "> $docu_foot_file") || die "$ERROR: Can't open $docu_foot_file for writing: $!\n"
      if $T2H_SPLIT;
  $T2H_HREF{This} = $docu_foot;
  $T2H_NAME{This} = $T2H_WORDS->{$T2H_LANG}->{'Footnotes_Title'};
  $T2H_THIS_SECTION = \@foot_lines;
  &$T2H_print_Footnotes(\*FILE);
  close(FILE) if $T2H_SPLIT;
}

if (@toc_lines)
{
  print "# writing Toc in $docu_toc_file...\n" if $T2H_VERBOSE;
  open (FILE, "> $docu_toc_file") || die "$ERROR: Can't open $docu_toc_file for writing: $!\n"
      if $T2H_SPLIT;
  $T2H_HREF{This} = $T2H_HREF{Contents};
  $T2H_NAME{This} = $T2H_NAME{Contents};
  $T2H_THIS_SECTION = \@toc_lines;
  &$T2H_print_Toc(\*FILE);
  close(FILE) if $T2H_SPLIT;
}

if (@stoc_lines)
{
  print "# writing Overview in $docu_stoc_file...\n" if $T2H_VERBOSE;
  open (FILE, "> $docu_stoc_file") || die "$ERROR: Can't open $docu_stoc_file for writing: $!\n"
      if $T2H_SPLIT;
  
  $T2H_HREF{This} = $T2H_HREF{Overview};
  $T2H_NAME{This} = $T2H_NAME{Overview};
  $T2H_THIS_SECTION = \@stoc_lines;
  unshift @$T2H_THIS_SECTION, "<BLOCKQUOTE>\n";
  push @$T2H_THIS_SECTION, "\n</BLOCKQUOTE>\n";
  &$T2H_print_Overview(\*FILE);
  close(FILE) if $T2H_SPLIT;
}

if ($about_body = &$T2H_about_body())
{
  print "# writing About in $docu_about_file...\n" if $T2H_VERBOSE;
  open (FILE, "> $docu_about_file") || die "$ERROR: Can't open $docu_about_file for writing: $!\n"
      if $T2H_SPLIT;
  
  $T2H_HREF{This} = $T2H_HREF{About};
  $T2H_NAME{This} = $T2H_NAME{About};
  $T2H_THIS_SECTION = [$about_body];
  &$T2H_print_About(\*FILE);
  close(FILE) if $T2H_SPLIT;
}

unless ($T2H_SPLIT)
{
  &$T2H_print_page_foot(\*FILE);
  close (FILE);
}
  
Finish:
&l2h_FinishFromHtml if ($T2H_L2H);
&l2h_Finish if($T2H_L2H);
print "# that's all folks\n" if $T2H_VERBOSE;

exit(0);

#+++############################################################################
#                                                                              #
# Low level functions                                                          #
#                                                                              #
#---############################################################################

sub LocateIncludeFile
{
  my $file = shift;
  my $dir;

  return $file if (-e $file && -r $file);
  foreach $dir (@T2H_INCLUDE_DIRS)
  {
    return "$dir/$file" if (-e "$dir/$file" && -r "$dir/$file");
  }
  return undef;
}

sub clean_name 
{
  local ($_);
  $_ = &remove_style($_[0]);
  &unprotect_texi;
  return $_;
}

sub update_sec_num {
    local($name, $level) = @_;
    my $ret;

    $level--; # here we start at 0
    if ($name =~ /^appendix/ || defined(@appendix_sec_num)) {
	# appendix style
	if (defined(@appendix_sec_num)) {
	    &incr_sec_num($level, @appendix_sec_num);
	} else {
	    @appendix_sec_num = ('A', 0, 0, 0);
	}
	$ret = join('.', @appendix_sec_num[0..$level]);
    } else {
	# normal style
	if (defined(@normal_sec_num)) 
	{
	  &incr_sec_num($level, @normal_sec_num);
	} 
	else 
	{
	  @normal_sec_num = (1, 0, 0, 0);
	}
	$ret = join('.', @normal_sec_num[0..$level]);
    }
    
    $ret .= "." if $level == 0;
    return $ret;
}

sub incr_sec_num {
    local($level, $l);
    $level = shift(@_);
    $_[$level]++;
    foreach $l ($level+1 .. 3) {
	$_[$l] = 0;
    }
}

sub Sec2UpNode
{
  my $sec = shift;
  my $num = $sec2number{$sec};

  return '' unless $num;
  return 'Top' unless $num =~ /\.\d+/;
  $num =~ s/\.[^\.]*$//;
  $num = $num . '.' unless $num =~ /\./;
  return $sec2node{$number2sec{$num}};
}

sub Sec2PrevNode
{
  my $sec = shift;
  my $num = $sec2number{$sec};
  my ($i, $post);
  
  if ($num =~ /(\w+)(\.$|$)/)
  {
    $num = $`;
    $i = $1;
    $post = $2;
    if ($i eq 'A')
    {
      $i = $normal_sec_num[0];
    }
    elsif ($i ne '1')
    {
      # unfortunately, -- operator is not magical
      $i = chr(ord($i) + 1);
    }
    else
    {
      return '';
    }
    return $sec2node{$number2sec{$num . $i . $post}}
  }
  return '';
}

sub Sec2NextNode
{
  my $sec = shift;
  my $num = $sec2number{$sec};
  my $i;

  if ($num =~ /(\w+)(\.$|$)/)
  {
    $num = $`;
    $i = $1;
    $post = $2;
    if ($post eq '.' && $i eq $normal_sec_num[0])
    {
      $i = 'A';
    }
    else
    {
      $i++;
    }
    return $sec2node{$number2sec{$num . $i . $post}}
  }
  return '';
}

sub check {
    local($_, %seen, %context, $before, $match, $after);

    while (<>) {
	if (/\@(\*|\.|\:|\@|\{|\})/) {
	    $seen{$&}++;
	    $context{$&} .= "> $_" if $T2H_VERBOSE;
	    $_ = "$`XX$'";
	    redo;
	}
	if (/\@(\w+)/) {
	    ($before, $match, $after) = ($`, $&, $');
	    if ($before =~ /\b[\w-]+$/ && $after =~ /^[\w-.]*\b/) { # e-mail address
		$seen{'e-mail address'}++;
		$context{'e-mail address'} .= "> $_" if $T2H_VERBOSE;
	    } else {
		$seen{$match}++;
		$context{$match} .= "> $_" if $T2H_VERBOSE;
	    }
	    $match =~ s/^\@/X/;
	    $_ = "$before$match$after";
	    redo;
	}
    }
    
    foreach (sort(keys(%seen))) {
	if ($T2H_VERBOSE) {
	    print "$_\n";
	    print $context{$_};
	} else {
	    print "$_ ($seen{$_})\n";
	}
    }
}

sub open {
    local($name) = @_;

    ++$fh_name;
    if (open($fh_name, $name)) {
	unshift(@fhs, $fh_name);
    } else {
	warn "$ERROR Can't read file $name: $!\n";
    }
}

sub init_input {
    @fhs = ();			# hold the file handles to read
    @input_spool = ();		# spooled lines to read
    $fh_name = 'FH000';
    &open($docu);
}

sub next_line {
    local($fh, $line);

    if (@input_spool) {
	$line = shift(@input_spool);
	return($line);
    }
    while (@fhs) {
	$fh = $fhs[0];
	$line = <$fh>;
	return($line) if $line;
	close($fh);
	shift(@fhs);
    }
    return(undef);
}

# used in pass 1, use &next_line
sub skip_until {
    local($tag) = @_;
    local($_);

    while ($_ = &next_line) {
	return if /^\@end\s+$tag\s*$/;
    }
    die "* Failed to find '$tag' after: " . $lines[$#lines];
}

# used in pass 1 for l2h use &next_line
sub string_until {
    local($tag) = @_;
    local($_, $string);

    while ($_ = &next_line) {
	return $string if /^\@end\s+$tag\s*$/;
#	$_ =~ s/hbox/mbox/g;
	$string = $string.$_;
    }
    die "* Failed to find '$tag' after: " . $lines[$#lines];
}

#
# HTML stacking to have a better HTML output
#

sub html_reset {
    @html_stack = ('html');
    $html_element = 'body';
}

sub html_push {
    local($what) = @_;
    push(@html_stack, $html_element);
    $html_element = $what;
}

sub html_push_if {
    local($what) = @_;
    push(@html_stack, $html_element)
	if ($html_element && $html_element ne 'P');
    $html_element = $what;
}

sub html_pop {
    $html_element = pop(@html_stack);
}

sub html_pop_if {
    local($elt);

    if (@_) {
	foreach $elt (@_) {
	    if ($elt eq $html_element) {
		$html_element = pop(@html_stack) if @html_stack;
		last;
	    }
	}
    } else {
	$html_element = pop(@html_stack) if @html_stack;
    }
}

sub html_debug {
    local($what, $line) = @_;
    if ($T2H_DEBUG & $DEBUG_HTML)
    {
     $what = "\n" unless $what;
     return("<!-- $line @html_stack, $html_element -->$what")
    }	
    return($what);
}

# to debug the output...
sub debug {
    local($what, $line) = @_;
    return("<!-- $line -->$what")
	if $T2H_DEBUG & $DEBUG_HTML;
    return($what);
}

sub SimpleTexi2Html
{
  local $_ = $_[0];
  &protect_texi;
  &protect_html;
  $_ = substitute_style($_);
  $_[0]  = $_;
}

sub normalise_node {
  local $_ = $_[0];
  s/\s+/ /g;
  s/ $//;
  s/^ //;
  &protect_texi;
  &protect_html;
  $_ = substitute_style($_);
  $_[0]  = $_;
}

sub menu_entry 
{
  my ($node, $name, $descr) = @_;
  my ($href, $entry);
  
  &normalise_node($node);
  $href = $node2href{$node};
  if ($href) 
  {
    $descr =~ s/^\s+//;
    $descr =~ s/\s*$//;
    $descr = SimpleTexi2Html($descr);
    if ($T2H_NUMBER_SECTIONS && !$T2H_NODE_NAME_IN_MENU && $node2sec{$node})
    {
      $entry = $node2sec{$node};
      $name = '';
    }
    else
    {
      &normalise_node($name);
      $entry = ($name && ($name ne $node || ! $T2H_AVOID_MENU_REDUNDANCY) 
		? "$name : $node" : $node);
    }

    if ($T2H_AVOID_MENU_REDUNDANCY && $descr)
    {
      my $clean_entry = $entry;
      $clean_entry =~ s/^.*? // if ($clean_entry =~ /^([A-Z]|\d+)\.[\d\.]* /);
      $clean_entry =~ s/[^\w]//g;
      my $clean_descr = $descr;
      $clean_descr =~ s/[^\w]//g;
      $descr = '' if ($clean_entry eq $clean_descr)
    }
    push(@lines2,&debug('<TR><TD ALIGN="left" VALIGN="TOP">' . 
			&t2h_anchor('', $href, $entry) . 
			'</TD><TD>&nbsp;&nbsp;</TD><TD ALIGN="left" VALIGN="TOP">' . 
			$descr . 
			"</TD></TR>\n", __LINE__));
  }
  elsif ($node =~ /^\(.*\)\w+/)
  {
    push(@lines2,&debug('<TR><TD ALIGN="left" VALIGN="TOP">' . 
			$entry . 
			'</TD><TD ALIGN="left" VALIGN="TOP">' . $descr . 
			"</TD></TR>\n", __LINE__))
  }
  else
  {
    warn "$ERROR Undefined node of menu_entry ($node): $_";
  }
}

sub do_ctrl { "^$_[0]" }

sub do_email {
    local($addr, $text) = split(/,\s*/, $_[0]);

    $text = $addr unless $text;
    &t2h_anchor('', "mailto:$addr", $text);
}

sub do_sc 
{ 
  # l2h does this much better
  return &l2h_ToLatex("{\\sc ".&unprotect_html($_[0])."}") if ($T2H_L2H);
  return "\U$_[0]\E";
}

sub do_math
{
  return &l2h_ToLatex("\$".&unprotect_html($_[0])."\$") if ($T2H_L2H);
  return "<EM>".$text."</EM>";
}

sub do_uref {
    local($url, $text, $only_text) = split(/,\s*/, $_[0]);

    $text = $only_text if $only_text;
    $text = $url unless $text;
    &t2h_anchor('', $url, $text);
}

sub do_comm {
    local($text, $url) = split(/,\s*/, $_[0]);
    return("<div class=\"comment\">".$text."</div>");
}

sub do_dif {
    local($text, $url) = split(/,\s*/, $_[0]);
    return("<div class=\"dif\">".$text."</div>");
}

sub do_div {
    local($url, $text) = split(/,\s*/, $_[0]);
    return("<div class=\"".$url."\">".$text."</div>");
}

sub do_span {
    local($url, $text) = split(/,\s*/, $_[0]);
    return("<span class=\"".$url."\">".$text."</span>");
}
sub do_face2html {
    local($url, $text) = split(/,\s*/, $_[0]);
    return("<span style=\"".$url."\">".$text."</span>");
}
sub do_face2html2 {
    local($url, $text) = split(/____\s*/, $_[0]);
    return("<span style=\"".$url."\">".$text."</span>");
}

sub do_addnifty {
    return "<FORM METHOD=\"post\" ACTION=\"http://www.bookshelf.jp/cgi-bin/wwwmail.cgi\" > 
��̾����<INPUT TYPE=\"text\" NAME=\"name\" SIZE=\"30\" MAXLENGTH=\"40\" VALUE=\"�ʤʤ�����\"><br>
�᡼�륢�ɥ쥹��<INPUT TYPE=\"text\" NAME=\"EMAIL\" SIZE=\"25\" MAXLENGTH=\"60\" VALUE=\"secret\@mail.adr\"><br>
<input type=\"hidden\" name=\"HPAGE\" value=\"\">
������ɲä����ߤ�����<br><TEXTAREA NAME=\"MESSAGE\" ROWS=\"10\" COLS=\"50\">
</TEXTAREA><br><br>
<INPUT TYPE=\"submit\" VALUE=\"����\">
<INPUT TYPE=\"reset\" VALUE=\"���ꥢ\">
</FORM> 
"}


    sub do_count {
    return "<SCRIPT LANGUAGE=\"javascript\">
         <!--
         xx = escape(top.document.referrer);
         yy = \"\";
         for (i = 0; i < xx.length; i++) {
             zz = xx.charAt(i);
             yy += (zz == \"+\") ? \"%2B\" : zz;
         }
         document.write('<IMG  ');
         document.write('SRC=\"http://www.akihisa.f2s.com/f2s-cgi/meadow.cgi');
         document.write('?hide+count.gif+ref+',yy , '\">');
         // --> <IMG SRC=\"http://www.akihisa.f2s.com/f2s-cgi/meadow.cgi?hide+count.gif\">
         </script>"
}

sub do_right {
  return "<div class=\"right\">".$text."</div>";
}    

sub do_CITE {
  return "<div class=\"cite\">".$text."</div>";
}    
    
sub do_url { &t2h_anchor('', $_[0], $_[0]) }
sub do_img {
    ##&img_anchor('', $_[0], $_[1])
    local($url, $text,$align) = split(/,\s*/, $_[0]);
     if ("" eq $align)
     {
       return("<img src=\"".$url."\" alt=\"".$text."\">");
     }
     else
       {
       return("<img src=\"".$url."\" alt=\"".$text."\" ALIGN=\"".$align."\">");
       }
  }

sub do_inserttoc
{
}

sub img_anchor {
    local($name, $href, $text, $newline, $extra_attribs) = @_;
    local($result);

    $result = "<img";
    $result .= " NAME=\"$name\"" if $name;
    if ($href)
    {
      $href =~ s|^$T2H_HREF_DIR_INSTEAD_FILE|./| 
	if ($T2H_HREF_DIR_INSTEAD_FILE);
      $result .= ($href =~ /\"/ ? " src='$href'"  : " src=\"$href\"");
    }
    $result .= " $extra_attribs" if $extra_attribs;
    $result .= ">";
    $result .= "\n" if $newline;
    return($result);
}




sub do_acronym
{
  return '<FONT SIZE="-1">' . $_[0] . '</FONT>';
}

sub do_accent
{
  return "&$_[0]acute;" if $_[1] eq 'H';
  return "$_[0]." if $_[1] eq 'dotaccent';
  return "$_[0]*" if $_[1] eq 'ringaccent';
  return "$_[0]".'[' if $_[1] eq 'tieaccent';
  return "$_[0]".'(' if $_[1] eq 'u';
  return "$_[0]_" if $_[1] eq 'ubaraccent';
  return ".$_[0]" if $_[1] eq 'udotaccent';
  return "$_[0]&lt;" if $_[1] eq 'v';
  return "&$_[0]cedil;" if $_[1] eq ',';
  return "$_[0]" if $_[1] eq 'dotless';
  return undef;
}

sub apply_style {
    local($texi_style, $text) = @_;
    local($style);

    $style = $style_map{$texi_style};
    if (defined($style)) { # known style
	my $do_quotes = 0;
	if ($style =~ /^\"/) { # add quotes
	    $style = $';
	    $do_quotes = 1;
	}
	if ($style =~ /^\&/) { # custom
	    $style = $';
	    $text = &$style($text, $texi_style);
	} elsif ($style) { # good style
	    $text = "<$style>$text</$style>";
	} else { # no style
	}
	$text = "\`$text\'" if $do_quotes;
    } else { # unknown style
	$text = undef;
    }
    return($text);
}

# remove Texinfo styles
sub remove_style {
    local($_) = @_;
    1 while(s/\@\w+{([^\{\}]+)}/$1/g);
    return($_);
}

sub remove_things
{
  local ($_) = @_;
  s|\@(\w+)\{\}|$1|g;
  return $_;
}

sub substitute_style {
    local($_) = @_;
    local($changed, $done, $style, $text);

    &simple_substitutions;
    $changed = 1;
    while ($changed) {
	$changed = 0;
	$done = '';
	while (/\@(\w+){([^\{\}]+)}/ || /\@(,){([^\{\}]+)}/) {
	    $text = &apply_style($1, $2);
	    if ($text) {
		$_ = "$`$text$'";
		$changed = 1;
	    } else {
		$done .= "$`\@$1";
		$_ = "{$2}$'";
	    }
	}
        $_ = $done . $_;
    }
    return($_);
}

sub t2h_anchor {
    local($name, $href, $text, $newline, $extra_attribs) = @_;
    local($result);

    $result = "<A";
    $result .= " NAME=\"$name\"" if $name;
    if ($href)
    {
      $href =~ s|^$T2H_HREF_DIR_INSTEAD_FILE|./| 
	if ($T2H_HREF_DIR_INSTEAD_FILE);
      $result .= ($href =~ /\"/ ? " HREF='$href'"  : " HREF=\"$href\"");
    }
    $result .= " $extra_attribs" if $extra_attribs;
    $result .= ">$text</A>";
    $result .= "\n" if $newline;
    return($result);
}

sub pretty_date {
    local(@MoY, $sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst);

    @MoY = ('January', 'February', 'March', 'April', 'May', 'June',
	    'July', 'August', 'September', 'October', 'November', 'December');
    ($sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst) = localtime(time);
    $year += ($year < 70) ? 2000 : 1900;
    # obachman: Let's do it as the Americans do
    return("$MoY[$mon], $mday  $year");
}

sub doc_href {
    local($num) = @_;

    return("${docu_name}_$num.$docu_ext");
}

sub sec_href
{
  return $node2href{$sec2node{$_[0]}};
}

sub next_doc {
    $docu_doc = &doc_href(++$doc_num);
}

sub t2h_print_lines {
    my ($fh, $lines) = @_;
    local($_);
    $lines = $T2H_THIS_SECTION unless $lines;
    my $cnt = 0;
    for (@$lines) 
    {
	$_ = l2h_FromHtml($_) if ($T2H_L2H);
	if (/^$PROTECTTAG/o) {
	    $_ = $tag2pro{$_};
	} else {
	    &unprotect_texi;
	}
	s/@/&\#64;/g;	# Avoid Spammers' robot correcting e-mail addresses.
	print $fh $_;
	$cnt += split(/\W*\s+\W*/);
    }
    return $cnt;
}

sub protect_texi {
    # protect @ { } ` '
    s/\@\@/$;0/go;
    s/\@\{/$;1/go;
    s/\@\}/$;2/go;
    s/\@\`/$;3/go;
    s/\@\'/$;4/go;
}

sub protect_html {
    local($what) = @_;
    # protect & < >
    $what =~ s/\&/\&\#38;/g;
    $what =~ s/\</\&\#60;/g;
    $what =~ s/\>/\&\#62;/g;
    # restore anything in quotes
    # this fixes my problem where I had:
    # < IMG SRC="leftarrow.gif" ALT="<--" >  but what if I wanted &#60; in my ALT text ??
    # maybe byte stuffing or some other technique should be used.
    $what =~ s/\"([^\&]+)\&\#60;(.*)\"/"$1<$2"/g;
    $what =~ s/\"([^\&]+)\&\#62;(.*)\"/"$1>$2"/g;
    $what =~ s/\"([^\&]+)\&\#38;(.*)\"/"$1&$2"/g;
    # but recognize some HTML things
    $what =~ s/\&\#60;\/A\&\#62;/<\/A>/g;	      # </A>
    $what =~ s/\&\#60;A ([^\&]+)\&\#62;/<A $1>/g;     # <A [^&]+>
    $what =~ s/\&\#60;IMG ([^\&]+)\&\#62;/<IMG $1>/g; # <IMG [^&]+>
    return($what);
}

sub unprotect_texi {
    s/$;0/\@/go;
    s/$;1/\{/go;
    s/$;2/\}/go;
    s/$;3/\`/go;
    s/$;4/\'/go;
}

sub Unprotect_texi 
{
  local $_ = shift;
  &unprotect_texi;
  return($_);
}

sub unprotect_html {
    local($what) = @_;
    $what =~ s/\&\#38;/\&/g;
    $what =~ s/\&\#60;/\</g;
    $what =~ s/\&\#62;/\>/g;
    return($what);
}

sub t2h_print_label
{
    my $fh = shift;
    my $href = shift || $T2H_HREF{This};
    $href =~ s/.*#(.*)$/$1/;
#    print $fh qq{<br><A NAME="$href"></A>[<a href="#top">Page Top</a> / <a href="#bottom">Page bottom</a>]\n};
  
    print $fh qq{<br><A NAME="$href"> </A>\n};
}

##���ܸ�򸡺����󥸥�η������Ѵ�
sub url_encode {
  $_ = shift;
  s/([^ \w])/'%'.uc(unpack('H2',$1))/ge;
  s/\s/+/g;
  $_;
}

## �����ȥե������Ѥ��Ѵ�
## ����ե��٥åȤ��Ѵ�����
sub url_encode2 {
  $_ = shift;
  s/(.)/uc(unpack('H2',$1))/ge;
  s/\s/+/g;
  $_;
}

sub trunc {
	my $val = shift;	# �ڤ�ΤƤ��
	my $col = shift;	# �������ʲ��Τɤ��ޤǻĤ���
	my $r = 10 ** $col;
	if ($val > 0) {
		return int($val * $r) / $r;
	} else {
		my $tmp = $val * $r;
		if ($tmp == int($tmp)) {
			return $tmp / $r;
		} else {
			return int($tmp - 1) / $r;
		}
	}
}
##############################################################################

	# These next few lines are legal in both Perl and nroff.

.00 ;			# finish .ig
 
'di			\" finish diversion--previous line must be blank
.nr nl 0-1		\" fake up transition to first page again
.nr % 0			\" start at page 1
'; __END__ ############# From here on it's a standard manual page ############
.so /usr/local/man/man1/texi2html.1