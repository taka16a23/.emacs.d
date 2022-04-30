;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:

;;;### (autoloads nil "align-let" "align-let.el" (0 0 0 0))
;;; Generated autoloads from align-let.el

(let ((loads (get 'align-let 'custom-loads))) (if (member '"align-let" loads) nil (put 'align-let 'custom-loads (cons '"align-let" loads))))

(put 'align-let-spaces 'safe-local-variable 'integerp)

(autoload 'align-let "align-let" "\
Align the value expressions in a Lisp `let' or `setq' form.
Point should be within or immediately in front of the let form.
For example `align-let' changes

    (let ((x 1)
          (foo   2)
          (zz (blah)))
      ...)
to
    (let ((x   1)
          (foo 2)
          (zz  (blah)))
      ...)

Or

    (setq x 1
          foo 2)
to
    (setq x   1
          foo 2)

When point is somewhere in the middle of the form, possibly
nested in an expression, the beginning of a let is found by
looking for a double-paren pattern like

    (sym ... ((...

This means `align-let' works with various kinds of `let', `let*',
etc in various Lisp dialects.  But possible `setq' functions are
hard-coded, currently `setq', `setq-default' and `psetq'.

See `align-let-spaces' to have more than one space after the
longest variable.

----------------------------------------------------------------
Scheme `and-let*' is recognised too,

    (and-let* (...

Its \"(var value)\" forms can be bare symbols so may not start
with a \"((\" like above.  You can have `align-let' recognise
other such forms by setting an `align-let' property on the symbol
in Emacs,

    (put 'my-and-let* 'align-let 1)

The property value is the argument number of the bindings part.
So for example if you made

    (my-xandlet foo bar (abc
                         (def 123)
                         (ghi 456))
      ...

then the bindings are the 3rd argument and you set

    (put 'my-xandlet 'align-let 3)

----------------------------------------------------------------
The align-let.el home page is
URL `http://user42.tuxfamily.org/align-let/index.html'" t nil)

(autoload 'align-let-keybinding "align-let" "\
Bind C-c C-a to `align-let' in the current mode keymap.
This is designed for use from the mode hook of any lisp-like
language, eg. `emacs-lisp-mode-hook' or `scheme-mode-hook'.

In the current implementation, if you `unload-feature' to remove
`align-let' the key bindings made here are not removed.  If you
use the `autoload' recommended in the align-let.el Install
\(manually or generated) then Emacs automatically re-loads on a
later `C-c C-a'." nil nil)

(custom-add-option 'emacs-lisp-mode-hook 'align-let-keybinding)

(custom-add-option 'scheme-mode-hook 'align-let-keybinding)

(autoload 'align-let-region "align-let" "\
`align-let' all forms between START and END.
Interactively, align forms in the region between point and mark.

If a `let' form starts within the region but extends beyond END
then all its binding forms are aligned, even those past END.

One possibility for this command would be to combine it with
`indent-sexp' or `indent-pp-sexp' (\\[indent-pp-sexp]), or some sort
of \"indent defun\", for a one-key cleanup.  There's nothing
offered for that yet but it should be easy to make a combination
command according to personal preference.  It doesn't matter
whether you indent or align-let first, because align-let only
cares about variable name widths, not any indenting, and
indenting doesn't care about how much space there is after
variables!  Remember to use markers for the operative region, as
indent and align-let will both insert or delete characters.

\(fn START END)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "align-let" '("align-let-")))

;;;***

;;;### (autoloads nil "approx-isearch" "approx-isearch.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from approx-isearch.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "approx-isearch" '("approx-isearch-")))

;;;***

;;;### (autoloads nil "approx-old-isearch" "approx-old-isearch.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from approx-old-isearch.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "approx-old-isearch" '("approx-isearch-")))

;;;***

;;;### (autoloads nil "approx-search" "approx-search.el" (0 0 0 0))
;;; Generated autoloads from approx-search.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "approx-search" '("approx-")))

;;;***

;;;### (autoloads nil "ascii-table" "ascii-table.el" (0 0 0 0))
;;; Generated autoloads from ascii-table.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ascii-table" '("ascii-table")))

;;;***

;;;### (autoloads nil "auto-complete-yasnippet" "auto-complete-yasnippet.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from auto-complete-yasnippet.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "auto-complete-yasnippet" '("ac-")))

;;;***

;;;### (autoloads nil "bat-mode" "bat-mode.el" (0 0 0 0))
;;; Generated autoloads from bat-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "bat-mode" '("bat-")))

;;;***

;;;### (autoloads nil "c-includes" "c-includes.el" (0 0 0 0))
;;; Generated autoloads from c-includes.el

(autoload 'c-includes-add-binding "c-includes" "\
Set binding for C-c C-i in cc-mode." nil nil)

(autoload 'c-includes-current-file "c-includes" "\
Find all of the header file included by the current file.

\(fn &optional REGEXP)" t nil)

(autoload 'c-includes "c-includes" "\
Find all of the header files included by FILENAME.
REGEXP, if non-nil, is a regular expression to search for within
FILENAME and the files that it includes.  The output will be
structured in the same order that the compiler will see it, enabling
you determine order of occurrence.

\(fn FILENAME &optional REGEXP)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "c-includes" '("c-")))

;;;***

;;;### (autoloads nil "color-theme-6.6.0/color-theme" "color-theme-6.6.0/color-theme.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from color-theme-6.6.0/color-theme.el

(autoload 'color-theme-select "color-theme-6.6.0/color-theme" "\
Displays a special buffer for selecting and installing a color theme.
With optional prefix ARG, this buffer will include color theme libraries
as well.  A color theme library is in itself not complete, it must be
used as part of another color theme to be useful.  Thus, color theme
libraries are mainly useful for color theme authors.

\(fn &optional ARG)" t nil)

(autoload 'color-theme-describe "color-theme-6.6.0/color-theme" "\
Describe color theme listed at point.
This shows the documentation of the value of text-property color-theme
at point.  The text-property color-theme should be a color theme
function.  See `color-themes'." t nil)

(autoload 'color-theme-install-at-mouse "color-theme-6.6.0/color-theme" "\
Install color theme clicked upon using the mouse.
First argument EVENT is used to set point.  Then
`color-theme-install-at-point' is called.

\(fn EVENT)" t nil)

(autoload 'color-theme-install-at-point-for-current-frame "color-theme-6.6.0/color-theme" "\
Install color theme at point for current frame only.
Binds `color-theme-is-global' to nil and calls
`color-theme-install-at-point'." t nil)

(autoload 'color-theme-print "color-theme-6.6.0/color-theme" "\
Print the current color theme function.

You can contribute this function to <URL:news:gnu.emacs.sources> or
paste it into your .emacs file and call it.  That should recreate all
the settings necessary for your color theme.

Example:

    (require 'color-theme)
    (defun my-color-theme ()
      \"Color theme by Alex Schroeder, created 2000-05-17.\"
      (interactive)
      (color-theme-install
       '(...
	 ...
	 ...)))
    (my-color-theme)

If you want to use a specific color theme function, you can call the
color theme function in your .emacs directly.

Example:

    (require 'color-theme)
    (color-theme-gnome2)

\(fn &optional BUF)" t nil)

(autoload 'color-theme-analyze-defun "color-theme-6.6.0/color-theme" "\
Once you have a color-theme printed, check for missing faces.
This is used by maintainers who receive a color-theme submission
and want to make sure it follows the guidelines by the color-theme
author." t nil)

(autoload 'color-theme-make-snapshot "color-theme-6.6.0/color-theme" "\
Return the definition of the current color-theme.
The function returned will recreate the color-theme in use at the moment." nil nil)

(autoload 'color-theme-compare "color-theme-6.6.0/color-theme" "\
Compare two color themes.
This will print the differences between installing THEME-A and
installing THEME-B.  Note that the order is important: If a face is
defined in THEME-A and not in THEME-B, then this will not show up as a
difference, because there is no reset before installing THEME-B.  If a
face is defined in THEME-B and not in THEME-A, then this will show up as
a difference.

\(fn THEME-A THEME-B)" t nil)

(autoload 'color-theme-install "color-theme-6.6.0/color-theme" "\
Install a color theme defined by frame parameters, variables and faces.

The theme is installed for all present and future frames; any missing
faces are created.  See `color-theme-install-faces'.

THEME is a color theme definition.  See below for more information.

If you want to install a color theme from your .emacs, use the output
generated by `color-theme-print'.  This produces color theme function
which you can copy to your .emacs.

A color theme definition is a list:
\([FUNCTION] FRAME-PARAMETERS VARIABLE-SETTINGS FACE-DEFINITIONS)

FUNCTION is the color theme function which called `color-theme-install'.
This is no longer used.  There was a time when this package supported
automatic factoring of color themes.  This has been abandoned.

FRAME-PARAMETERS is an alist of frame parameters.  These are installed
with `color-theme-install-frame-params'.  These are installed last such
that any changes to the default face can be changed by the frame
parameters.

VARIABLE-DEFINITIONS is an alist of variable settings.  These are
installed with `color-theme-install-variables'.

FACE-DEFINITIONS is an alist of face definitions.  These are installed
with `color-theme-install-faces'.

If `color-theme-is-cumulative' is nil, a color theme will undo face and
frame-parameter settings of previous color themes.

\(fn THEME)" nil nil)

(autoload 'color-theme-submit "color-theme-6.6.0/color-theme" "\
Submit your color-theme to the maintainer." t nil)

(autoload 'color-theme-initialize "color-theme-6.6.0/color-theme" "\
Initialize the color theme package by loading color-theme-libraries." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "color-theme-6.6.0/color-theme" '("color-theme" "define-color-theme")))

;;;***

;;;### (autoloads nil "color-theme-6.6.0/color-theme-autoloads" "color-theme-6.6.0/color-theme-autoloads.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from color-theme-6.6.0/color-theme-autoloads.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "color-theme-6.6.0/color-theme-autoloads" '("color-theme-generate-autoloads")))

;;;***

;;;### (autoloads nil "color-theme-6.6.0/color-theme-other" "color-theme-6.6.0/color-theme-other.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from color-theme-6.6.0/color-theme-other.el

(autoload 'color-theme-black "color-theme-6.6.0/color-theme-other" "\
Black background.
Doesn't mess with most faces, but does turn on dark background mode." t nil)

(autoload 'color-theme-black-calm-forest "color-theme-6.6.0/color-theme-other" "\
Color theme by Artur Hefczyc, created 2003-04-18." t nil)

(autoload 'color-theme-black-hober "color-theme-6.6.0/color-theme-other" "\
Does all sorts of crazy stuff.
Originally based on color-theme-standard, so I probably still have some
setting that I haven't changed. I also liberally copied settings from
the other themes in this package. The end result isn't much like the
other ones; I hope you like it.

\(fn &optional PREVIEW)" t nil)

(autoload 'color-theme-white-katester "color-theme-6.6.0/color-theme-other" "\
Color theme by walterh@rocketmail.com, created 2001-12-12.
A pastelly-mac like color-theme." t nil)

(autoload 'color-theme-black-lawrence-hackers-like "color-theme-6.6.0/color-theme-other" "\
Color theme by lawrence mitchell <wence@gmx.li>.
Mainly shades of green.
Contains faces for erc, gnus, most of jde." t nil)

(autoload 'color-theme-black-matrix-hackers-like "color-theme-6.6.0/color-theme-other" "\
Color theme by walterh@rocketmail.com, created 2003-10-16." t nil)

(autoload 'color-theme-black-lethe "color-theme-6.6.0/color-theme-other" "\
Color theme by Ivica Loncar, created 2002-08-02.
Some additional X resources as suggested by the author:

Emacs*menubar.Foreground:		Yellow
Emacs*menubar.Background:		#1a2b3c
Emacs*menubar.topShadowColor:		gray
Emacs*menubar.bottomShadowColor:	dimgray

Some fonts I really like (note: this fonts are not highly
available):

Emacs.default.attributeFont: -letl-*-medium-r-*-*-*-*-*-*-*-*-iso8859-2
Emacs*menubar*Font:  -etl-fixed-medium-r-normal--14-*-*-*-*-*-iso8859-1

Mouse fix:

Emacs*dialog*XmPushButton.translations:#override
	  <Btn1Down>:         Arm()
 <Btn1Down>,<Btn1Up>: Activate()			 Disarm()
      <Btn1Down>(2+):     MultiArm()
	<Btn1Up>(2+):       MultiActivate()
	    <Btn1Up>:           Activate()			 Disarm()
      <Key>osfSelect:    ArmAndActivate()
    <Key>osfActivate:   ArmAndActivate()
	<Key>osfHelp:    Help()
 ~Shift ~Meta ~Alt <Key>Return:  ArmAndActivate()
       <EnterWindow>:      Enter()
       <LeaveWindow>:      Leave()


Bonus: do not use 3D modeline." t nil)

(autoload 'color-theme-black-ld-dark "color-theme-6.6.0/color-theme-other" "\
Dark Color theme by Linh Dang, created 2001-11-06." t nil)

(autoload 'color-theme-black-renegade "color-theme-6.6.0/color-theme-other" "\
Renegade BBS styled color theme. Works well in X and terminals.
Created by Dave Benjamin <ramen@ramenfest.com> Dec 23 2005." t nil)

(autoload 'color-theme-black-retro-green-hackers-like "color-theme-6.6.0/color-theme-other" "\
Plain green on black faces for those longing for the good old days.

\(fn &optional COLOR FUNC)" t nil)

(autoload 'color-theme-white-sitaramv-nt "color-theme-6.6.0/color-theme-other" "\
Black foreground on white background.
Includes faces for font-lock, widget, custom, speedbar." t nil)

(autoload 'color-theme-white-standard "color-theme-6.6.0/color-theme-other" "\
Emacs default colors.
If you are missing standard faces in this theme, please notify the maintainer." t nil)

(autoload 'color-theme-white-emacs-21 "color-theme-6.6.0/color-theme-other" "\
Color theme used by Emacs 21.1.
Added and adapted for XEmacs by Alex Schroeder.  Adaptation mostly
consisted of resolving :inherit attributes and adding missing faces.
This theme includes faces from the following Emacs libraries: add-log
calendar comint cus-edit cus-face custom diff-mode ediff-init re-builder
viper-init enriched em-ls em-prompt esh-test faces font-lock generic-x
gnus-art gnus-cite gnus message hilit-chg hi-lock info isearch log-view
paren pcvs-info antlr-mode cperl-mode ebrowse idlwave idlw-shell
make-mode sh-script vhdl-mode smerge-mode speedbar strokes artist
flyspell texinfo tex-mode tooltip vcursor wid-edit woman term man" t nil)

(autoload 'color-theme-white-emacs-nw "color-theme-6.6.0/color-theme-other" "\
Follow emacs21's color-theme, with -nw getting 100% compatibility.

Alex's `color-theme-emacs-21' follows emacs21's theme, but in the
current scheme of things, that means that when it works on X, it won't
work in -nw perfectly.  The modeline and menuline will have same
colors as the rest of emacs, which can be particularly disturbing when
there are multiple windows.

OTOH, `color-theme-emacs-nw' follows emacs21's theme but the goal is
100% -nw compatibility, and in X; we shall try for decent color
scheme, and as much compability default emacs21's X as possble.
Bugs to deego@gnufans.org.

TODO: Try to make this theme relative to color-theme-emacs-21 rather
than absolute, viz: call that first and then tweak minor stuff." t nil)

(autoload 'color-theme-white-subtle-hacker "color-theme-6.6.0/color-theme-other" "\
Subtle Hacker Color Theme.
Based on gnome2, but uses white for important things like comments,
and less of the unreadable tomato.  By Colin Walters <levanti@verbum.org>" t nil)

(autoload 'color-theme-white-vim-colors "color-theme-6.6.0/color-theme-other" "\
Color theme by Michael Soulier, created 2003-03-26." t nil)

(autoload 'color-theme-gnome2 "color-theme-6.6.0/color-theme-other" "\
Wheat on darkslategrey scheme.
`color-theme-gnome' started it all.

This theme supports standard faces, font-lock, eshell, info, message,
gnus, custom, widget, woman, diary, cperl, bbdb, and erc.  This theme
includes faces for Emacs and XEmacs.

The theme does not support w3 faces because w3 faces can be controlled
by your default style sheet.

This is what you should put in your .Xdefaults file, if you want to
change the colors of the menus in Emacs 20 as well:

emacs*Background:		DarkSlateGray
emacs*Foreground:		Wheat" t nil)

;;;***

;;;### (autoloads nil "color-theme-6.6.0/themes/color-theme-dark-laptop"
;;;;;;  "color-theme-6.6.0/themes/color-theme-dark-laptop.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from color-theme-6.6.0/themes/color-theme-dark-laptop.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "color-theme-6.6.0/themes/color-theme-dark-laptop" '("color-theme-dark-laptop")))

;;;***

;;;### (autoloads nil "color-theme-6.6.0/themes/color-theme-t1" "color-theme-6.6.0/themes/color-theme-t1.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from color-theme-6.6.0/themes/color-theme-t1.el

(autoload 'color-theme-t1 "color-theme-6.6.0/themes/color-theme-t1" "\
Color theme by t1" t nil)

;;;***

;;;### (autoloads nil "columnize" "columnize.el" (0 0 0 0))
;;; Generated autoloads from columnize.el

(autoload 'columnize-strings "columnize" "\
Trivial wrapper for `columnize-text' which see.
Uses `columnize-quoted-regexp' to recognize quoted strings as words even if
they contain embedded spaces.

\(fn BEGIN END &optional PILLAR-WIDTH)" t nil)

(autoload 'columnize-text "columnize" "\
Turns a list of words in a region into an evenly spaced list.
For clarity I use pillar to describe a column of words since the word
column already has a meaning in emacs.

The region is defined by BEGIN and END.  If PILLAR-WIDTH is not specified then
the length of the longest word in the region + `columnize-spacing' is used.
The number of pillars is determined by how many will fit between the indent
column and `fill-column'.  The list is indented to BEGIN's `current-column'.
Words are defined as the sequence of characters matching `columnize-regexp'.

Interactively, point and mark determine the region, a prefix argument sets
PILLAR-WIDTH.  A value of 0 or 1 means use the default.  Negative values mean
calculate a width that yields that number of pillars.  For example -4 means
calculate a value for PILLAR-WIDTH that yields 4 pillars.

If PILLAR-WIDTH is specified but is less than or equal to the longest word,
words will overflow into adjacent pillars but cannot span more than
`columnize-span' pillars which see.

Example using a fill-column of 70 and letting pillar-width default.

     here is a list of various length words that I want columnized

     here        is          a           list        of
     various     length      words       that        I
     want        columnized

See also `columnize-strings'.

\(fn BEGIN END &optional PILLAR-WIDTH)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "columnize" '("columnize-")))

;;;***

;;;### (autoloads nil "dmacro" "dmacro.el" (0 0 0 0))
;;; Generated autoloads from dmacro.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "dmacro" '("*dmacro-arry" "dmacro-")))

;;;***

;;;### (autoloads nil "doc-view-extension" "doc-view-extension.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from doc-view-extension.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doc-view-extension" '("doc-view-")))

;;;***

;;;### (autoloads nil "doctest-mode" "doctest-mode.el" (0 0 0 0))
;;; Generated autoloads from doctest-mode.el

(add-to-list 'auto-mode-alist '("\\.doctest$" . doctest-mode))

(autoload 'doctest-mode "doctest-mode" "\
A major mode for editing text files that contain Python
doctest examples.  Doctest is a testing framework for Python that
emulates an interactive session, and checks the result of each
command.  For more information, see the Python library reference:
<http://docs.python.org/lib/module-doctest.html>

`doctest-mode' defines three kinds of line, each of which is
treated differently:

  - 'Source lines' are lines consisting of a Python prompt
    ('>>>' or '...'), followed by source code.  Source lines are
    colored (similarly to `python-mode') and auto-indented.

  - 'Output lines' are non-blank lines immediately following
    source lines.  They are colored using several doctest-
    specific output faces.

  - 'Text lines' are any other lines.  They are not processed in
    any special way.

\\{doctest-mode-map}

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "doctest-mode" '("column-at-char" "doctest-" "find-doctest-output-line" "font-lock-defaults-alist" "hide-example-source" "on-")))

;;;***

;;;### (autoloads nil "duplicate-line" "duplicate-line.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from duplicate-line.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "duplicate-line" '("duplicate-")))

;;;***

;;;### (autoloads nil "eval-expr" "eval-expr.el" (0 0 0 0))
;;; Generated autoloads from eval-expr.el

(defvar eval-expr-error-message-delay 3 "\
*Amount of time, in seconds, to display in echo area before continuing.")

(custom-autoload 'eval-expr-error-message-delay "eval-expr" t)

(defvar eval-expr-prompt "Eval: " "\
*Prompt used by eval-expr.")

(custom-autoload 'eval-expr-prompt "eval-expr" t)

(defvar eval-expr-honor-debug-on-error t "\
*If non-nil, do not trap evaluation errors.
Instead, allow errors to throw user into the debugger, provided
debug-on-error specifies that the particular error is a debuggable condition.")

(custom-autoload 'eval-expr-honor-debug-on-error "eval-expr" t)

(defvar eval-expr-use-echo-area-or-buffer 1 "\
*Preference for when to use echo area of a temporary buffer for results.

If set to t or `buffer', always put results into a temporary buffer.
If set to `nil' or `echo-area', always display results in echo area.
If an integer N, use the echo area unless the results would require more
than N lines to display; in that case, use a temporary buffer.

Some versions of emacs can display arbitrarily large output in the echo
area by dynamically resizing it, so a temporary buffer is not necessary
unless you expect the output to exceed the limits of the resize thresholds
or want to be able to edit the results.")

(custom-autoload 'eval-expr-use-echo-area-or-buffer "eval-expr" t)

(defvar eval-expr-print-level (cond ((boundp 'eval-expression-print-level) (default-value 'eval-expression-print-level)) ((boundp 'print-level) (default-value 'print-level))) "\
*Like print-level, but affect results printed by `eval-expr' only.")

(custom-autoload 'eval-expr-print-level "eval-expr" t)

(defvar eval-expr-print-length (cond ((boundp 'eval-expression-print-length) (default-value 'eval-expression-print-length)) ((boundp 'print-length) (default-value 'print-length))) "\
*Like print-length, but affect results printed by `eval-expr' only.")

(custom-autoload 'eval-expr-print-length "eval-expr" t)

(defvar eval-expr-print-function (if (fboundp 'pp) 'pp 'prin1) "\
*Function to use for printing objects.
E.g. this can be set to `pp' to generate pretty-printed results,
or `prin1' for unformatted results.")

(custom-autoload 'eval-expr-print-function "eval-expr" t)

(autoload 'eval-expr-install "eval-expr" "\
Replace standard eval-expression command with enhanced eval-expr." t nil)

(autoload 'eval-expr "eval-expr" "\
Evaluate EXPRESSION and print value in minibuffer, temp, or current buffer.
A temp output buffer is used if there is more than one line in the
evaluated result.
If invoked with a prefix arg, or second lisp argument EE::INSERT-VALUE is
non-nil, then insert final value into the current buffer at point.

Value is also consed on to front of the variable `values'.

\(fn EE::EXPRESSION &optional EE::INSERT-VALUE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "eval-expr" '("eval-expr-")))

;;;***

;;;### (autoloads nil "everything" "everything.el" (0 0 0 0))
;;; Generated autoloads from everything.el

(defalias 'everything 'everything-find-file)

(autoload 'everything-find-file "everything" "\
Prompt for a search string, let the user choose one of the returned files and
open it." t nil)

(autoload 'everything-find-prompt "everything" "\
Prompt for a query and return the chosen filename.
If the current major mode is dired or (e)shell-mode limit the search to
the current directory and its sub-directories." nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "everything" '("everything-" "files-response-handler" "generic-response-handler")))

;;;***

;;;### (autoloads nil "flymake-patch" "flymake-patch.el" (0 0 0 0))
;;; Generated autoloads from flymake-patch.el

(autoload 'flymake-mode "flymake-patch" "\
Minor mode to do on-the-fly syntax checking.
When called interactively, toggles the minor mode.
With arg, turn Flymake mode on if and only if arg is positive.

\(fn &optional ARG)" t nil)

(autoload 'flymake-mode-on "flymake-patch" "\
Turn flymake mode on." nil nil)

(autoload 'flymake-mode-off "flymake-patch" "\
Turn flymake mode off." nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "flymake-patch" '("flymake-" "one-true" "string-match-multi")))

;;;***

;;;### (autoloads nil "gccsense" "gccsense.el" (0 0 0 0))
;;; Generated autoloads from gccsense.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "gccsense" '("ac-" "gccsense-")))

;;;***

;;;### (autoloads nil "grep-edit" "grep-edit.el" (0 0 0 0))
;;; Generated autoloads from grep-edit.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "grep-edit" '("grep-")))

;;;***

;;;### (autoloads nil "jaspace" "jaspace.el" (0 0 0 0))
;;; Generated autoloads from jaspace.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jaspace" '("jaspace-")))

;;;***

;;;### (autoloads nil "javascript" "javascript.el" (0 0 0 0))
;;; Generated autoloads from javascript.el

(autoload 'javascript-mode "javascript" "\
Major mode for editing JavaScript source text.

Key bindings:

\\{javascript-mode-map}" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "javascript" '("javascript-" "js-")))

;;;***

;;;### (autoloads nil "jedi-eldoc" "jedi-eldoc.el" (0 0 0 0))
;;; Generated autoloads from jedi-eldoc.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "jedi-eldoc" '("jedi-eldoc")))

;;;***

;;;### (autoloads nil "ll-debug" "ll-debug.el" (0 0 0 0))
;;; Generated autoloads from ll-debug.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ll-debug" '("ll-debug-")))

;;;***

;;;### (autoloads nil "make-file-executable" "make-file-executable.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from make-file-executable.el

(autoload 'make-file-executable "make-file-executable" "\
Make the file of this buffer executable, when it is a script source." nil nil)

;;;***

;;;### (autoloads nil "mell" "mell.el" (0 0 0 0))
;;; Generated autoloads from mell.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mell" '("mell-")))

;;;***

;;;### (autoloads nil "mylisps/annotation" "mylisps/annotation.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/annotation.el

(autoload 'annotation "mylisps/annotation" "\
Insert Annotation tag from `annotation-list'." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/annotation" '("annotation-" "which-in-list")))

;;;***

;;;### (autoloads nil "mylisps/anything-info-python" "mylisps/anything-info-python.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/anything-info-python.el

(autoload 'anything-info-python-at-point "mylisps/anything-info-python" "\
Preconfigured `anything' for search info at point." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/anything-info-python" '("anything-c-")))

;;;***

;;;### (autoloads nil "mylisps/auto-install-ext" "mylisps/auto-install-ext.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/auto-install-ext.el

(autoload 'auto-install-save&erase "mylisps/auto-install-ext" "\
Auto install erase after save as one command.
`auto-install-buffer-save', `erase-auto-install-buffer'" t nil)

(autoload 'auto-install-handle-emacswiki-package-name "mylisps/auto-install-ext" "\
Handle elisp package name from `EmacsWiki'.
DOWNLOAD-BUFFER is the name of download buffer.
PROMPT-INSTALL is non-nil, will prompt package name for install.

\(fn DOWNLOAD-BUFFER &optional PROMPT-INSTALL)" nil nil)

(autoload 'erase-auto-install-buffer "mylisps/auto-install-ext" nil nil nil)

(autoload 'auto-install-download-by-wget "mylisps/auto-install-ext" "\


\(fn URL HANDLE-FUNCTION DOWNLOAD-BUFFER)" nil nil)

;;;***

;;;### (autoloads nil "mylisps/auto-recover" "mylisps/auto-recover.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/auto-recover.el

(defvar auto-recover-exclude-re "\\.junk\\.")

(autoload 'auto-recover-startup "mylisps/auto-recover" "\
Auto recover from auto save.
If auto save file is old, then will delete it." nil nil)

(autoload 'cleanup-autosave "mylisps/auto-recover" "\
Clean up auto save file.
If auto save file is old, then will delete it.

\(fn &optional FORCE)" t nil)

(autoload 'force-cleanup-autosave "mylisps/auto-recover" "\
ARGS" t nil)

(autoload 'before-kill-emacs-cleanup-autosave "mylisps/auto-recover" nil nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/auto-recover" '("file-name-from-auto-save")))

;;;***

;;;### (autoloads nil "mylisps/auto-svn" "mylisps/auto-svn.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from mylisps/auto-svn.el

(autoload 'svn-status-pylib "mylisps/auto-svn" "\
" t nil)

(autoload 'svn-status-emacsd "mylisps/auto-svn" "\
" t nil)

(autoload 'svn-status-zsh "mylisps/auto-svn" "\
" t nil)

;;;***

;;;### (autoloads nil "mylisps/auto-yasnippet-extension" "mylisps/auto-yasnippet-extension.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/auto-yasnippet-extension.el

(autoload 'auto-yasnippet-ext "mylisps/auto-yasnippet-extension" "\
Compact command with `create-auto-yasnippet', `expand-auto-yasnippet'.
Do `create-auto-yasnippet' if mark is active.
Else do `expand-auto-yasnippet'.
ARGS: prefix

\(fn START END)" t nil)

;;;***

;;;### (autoloads nil "mylisps/autoinsert-yas" "mylisps/autoinsert-yas.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/autoinsert-yas.el

(autoload 'yas-expand-link "mylisps/autoinsert-yas" "\
Hyperlink function for yasnippet expansion.
Argument KEY .
Argument DEL .

\(fn KEY DEL)" nil nil)

(autoload 'yas-expand-link-choice "mylisps/autoinsert-yas" "\
Hyperlink to select yasnippet template.
Argument DEL .
Optional argument KEYS .

\(fn DEL &rest KEYS)" nil nil)

(autoload 'my-auto-insert-elisp "mylisps/autoinsert-yas" nil nil nil)

(autoload 'my-auto-insert-cpp "mylisps/autoinsert-yas" nil nil nil)

(autoload 'my-auto-insert-shscripts "mylisps/autoinsert-yas" "\
" nil nil)

(autoload 'my-auto-insert-init-python "mylisps/autoinsert-yas" nil nil nil)

(autoload 'my-auto-insert-main-python "mylisps/autoinsert-yas" "\
" nil nil)

(autoload 'my-junk-auto-insert-python "mylisps/autoinsert-yas" nil nil nil)

(autoload 'my-test-auto-insert-python "mylisps/autoinsert-yas" nil nil nil)

(autoload 'my-junk-auto-insert-elisp "mylisps/autoinsert-yas" nil nil nil)

(autoload 'my-setup-auto-insert-python "mylisps/autoinsert-yas" nil nil nil)

(autoload 'my-auto-insert-python "mylisps/autoinsert-yas" nil nil nil)

(autoload 'my-auto-insert-django-urls "mylisps/autoinsert-yas" nil nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/autoinsert-yas" '("auto-insert-choose" "choose-input" "shell-auto-insert-choose")))

;;;***

;;;### (autoloads nil "mylisps/balle-python-shift" "mylisps/balle-python-shift.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/balle-python-shift.el

(autoload 'balle-python-shift-left "mylisps/balle-python-shift" nil t nil)

(autoload 'balle-python-shift-right "mylisps/balle-python-shift" nil t nil)

;;;***

;;;### (autoloads nil "mylisps/biz/biz-mode" "mylisps/biz/biz-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/biz/biz-mode.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/biz/biz-mode" '("biz-mode" "line-start-curly-brace" "refact-to-newline-curly-brace")))

;;;***

;;;### (autoloads nil "mylisps/check-misspell" "mylisps/check-misspell.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/check-misspell.el

(defvar no-check-type-miss nil)

(defvar typemiss-list 'nil)

(make-variable-buffer-local 'typemiss-list)

(autoload 'check-misspell "mylisps/check-misspell" nil t nil)

;;;***

;;;### (autoloads nil "mylisps/clean-backup" "mylisps/clean-backup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/clean-backup.el

(autoload 'clean-backup-files "mylisps/clean-backup" "\
Delete backup-files if not exists sources." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/clean-backup" '("clean--backup-files")))

;;;***

;;;### (autoloads nil "mylisps/constraction-loaddefs" "mylisps/constraction-loaddefs.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/constraction-loaddefs.el

(autoload 'constraction-loaddefs "mylisps/constraction-loaddefs" "\
Make 06_loaddefs_start.el file that parsed autoload." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/constraction-loaddefs" '("init-update-directory-autoloads" "loaddefs-init-file" "make-loaddefs_start")))

;;;***

;;;### (autoloads nil "mylisps/delete-file-if-no-contents" "mylisps/delete-file-if-no-contents.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/delete-file-if-no-contents.el

(autoload 'delete-file-if-no-contents "mylisps/delete-file-if-no-contents" "\
Delete buffer if no contents." nil nil)

;;;***

;;;### (autoloads nil "mylisps/e2wm/e2wm-minor-commands" "mylisps/e2wm/e2wm-minor-commands.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/e2wm/e2wm-minor-commands.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/e2wm/e2wm-minor-commands" '("defe2wm:" "e2wm" "hide" "show" "toggle")))

;;;***

;;;### (autoloads nil "mylisps/e2wm/e2wm-t1code-pst" "mylisps/e2wm/e2wm-t1code-pst.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/e2wm/e2wm-t1code-pst.el

(autoload 'e2wm:dp-t1code "mylisps/e2wm/e2wm-t1code-pst" "\
" t nil)

(autoload 'e2wm:dp-t1code-navi-sub-ipython "mylisps/e2wm/e2wm-t1code-pst" "\
" t nil)

(autoload 'e2wm:dp-t1code-navi-relaunch-sub-ipython "mylisps/e2wm/e2wm-t1code-pst" "\
" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/e2wm/e2wm-t1code-pst" '("e2wm:")))

;;;***

;;;### (autoloads nil "mylisps/e2wm/e2wm_book_pst" "mylisps/e2wm/e2wm_book_pst.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/e2wm/e2wm_book_pst.el

(autoload 'e2wm:dp-book "mylisps/e2wm/e2wm_book_pst" "\
" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/e2wm/e2wm_book_pst" '("e2wm:")))

;;;***

;;;### (autoloads nil "mylisps/e2wm/e2wm_c_code_pst" "mylisps/e2wm/e2wm_c_code_pst.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/e2wm/e2wm_c_code_pst.el

(autoload 'e2wm:dp-C-code "mylisps/e2wm/e2wm_c_code_pst" "\
" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/e2wm/e2wm_c_code_pst" '("e2wm:")))

;;;***

;;;### (autoloads nil "mylisps/e2wm/e2wm_elisp_pst" "mylisps/e2wm/e2wm_elisp_pst.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/e2wm/e2wm_elisp_pst.el

(autoload 'e2wm:dp-elispcode "mylisps/e2wm/e2wm_elisp_pst" "\
" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/e2wm/e2wm_elisp_pst" '("e2wm")))

;;;***

;;;### (autoloads nil "mylisps/e2wm/e2wm_macro" "mylisps/e2wm/e2wm_macro.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/e2wm/e2wm_macro.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/e2wm/e2wm_macro" '("defe2wm:pst-change")))

;;;***

;;;### (autoloads nil "mylisps/e2wm/e2wm_pycode_pst" "mylisps/e2wm/e2wm_pycode_pst.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/e2wm/e2wm_pycode_pst.el

(autoload 'e2wm:dp-pycode "mylisps/e2wm/e2wm_pycode_pst" "\
" t nil)

(autoload 'e2wm:start-direct-pycode "mylisps/e2wm/e2wm_pycode_pst" "\
" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/e2wm/e2wm_pycode_pst" '("e2wm:")))

;;;***

;;;### (autoloads nil "mylisps/e2wm/e2wm_term_pst" "mylisps/e2wm/e2wm_term_pst.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/e2wm/e2wm_term_pst.el

(autoload 'e2wm:dp-term "mylisps/e2wm/e2wm_term_pst" nil t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/e2wm/e2wm_term_pst" '("e2wm:" "re-search-buffers")))

;;;***

;;;### (autoloads nil "mylisps/e2wm/e2wm_web_pst" "mylisps/e2wm/e2wm_web_pst.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/e2wm/e2wm_web_pst.el

(autoload 'e2wm:dp-web "mylisps/e2wm/e2wm_web_pst" "\
" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/e2wm/e2wm_web_pst" '("e2wm:web-")))

;;;***

;;;### (autoloads nil "mylisps/elisp-util" "mylisps/elisp-util.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/elisp-util.el

(autoload 't1-elisp-find-tag "mylisps/elisp-util" "\
In Emacs Lisp mode, one of these functions is called:
`find-library', `find-variable', `find-face-definition',
`find-function' and `find-tag'." t nil)

(autoload 'right-parentheses-indent "mylisps/elisp-util" "\
Insert right-parentheses then indent.
N

\(fn N)" t nil)

(autoload 'debug-on "mylisps/elisp-util" "\
Debug mode on." t nil)

(autoload 'degug-off "mylisps/elisp-util" "\
Debug mode off." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/elisp-util" '("expand" "macro-expand" "re-in-string" "sym")))

;;;***

;;;### (autoloads nil "mylisps/filecache-ext" "mylisps/filecache-ext.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/filecache-ext.el

(autoload 'file-cache-save-cache-to-file "mylisps/filecache-ext" "\
Save contents of `file-cache-alist' to FILE.
For later retrieval using `file-cache-read-cache-from-file'

\(fn FILE)" t nil)

(autoload 'file-cache-read-cache-from-file "mylisps/filecache-ext" "\
Clear `file-cache-alist' and read cache from FILE.
The file cache can be saved to a file using `file-cache-save-cache-to-file'.

\(fn FILE)" t nil)

(autoload 'file-cache-add-this-file "mylisps/filecache-ext" nil nil nil)

(autoload 'filecache-cleaning "mylisps/filecache-ext" nil t nil)

;;;***

;;;### (autoloads nil "mylisps/hotstring" "mylisps/hotstring.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/hotstring.el

(autoload 'hotstring-mode "mylisps/hotstring" "\
Hotstring mode

If called interactively, enable Hotstring mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(put 'hotstring-global-mode 'globalized-minor-mode t)

(defvar hotstring-global-mode nil "\
Non-nil if Hotstring-Global mode is enabled.
See the `hotstring-global-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `hotstring-global-mode'.")

(custom-autoload 'hotstring-global-mode "mylisps/hotstring" nil)

(autoload 'hotstring-global-mode "mylisps/hotstring" "\
Toggle Hotstring mode in all buffers.
With prefix ARG, enable Hotstring-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Hotstring mode is enabled in all buffers where
`(lambda nil (hotstring-mode 1))' would do it.
See `hotstring-mode' for more information on Hotstring mode.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/hotstring" '("hots")))

;;;***

;;;### (autoloads nil "mylisps/join-one-start" "mylisps/join-one-start.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/join-one-start.el

(autoload 'joinone-start-files "mylisps/join-one-start" nil t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/join-one-start" '("joinone-")))

;;;***

;;;### (autoloads nil "mylisps/maintain" "mylisps/maintain.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from mylisps/maintain.el

(autoload 'do-directory-files "mylisps/maintain" "\
Do function each file in directory.

\(fn DIR FUNC &optional REGEXP)" nil nil)

;;;***

;;;### (autoloads nil "mylisps/mini" "mylisps/mini.el" (0 0 0 0))
;;; Generated autoloads from mylisps/mini.el

(autoload 't1-mini-toggle "mylisps/mini" "\
mini toggle" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/mini" '("t1-mini-")))

;;;***

;;;### (autoloads nil "mylisps/nosetests" "mylisps/nosetests.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/nosetests.el

(autoload 'nosetests-run-buffer "mylisps/nosetests" "\


\(fn ARGS)" t nil)

(autoload 'nosetests-run-all "mylisps/nosetests" "\


\(fn ARGS)" t nil)

(autoload 'nosetests-run-dir "mylisps/nosetests" "\


\(fn ARGS)" t nil)

(autoload 'nosetests-run-it "mylisps/nosetests" "\


\(fn ARGS)" t nil)

(autoload 'nosetests-run-buffer-cover-package "mylisps/nosetests" "\
ARGS 

\(fn ARGS)" t nil)

(autoload 'nosetests-run-all-cover-package "mylisps/nosetests" "\
ARGS

\(fn ARGS)" t nil)

(autoload 'nosetests-run-dir-cover-package "mylisps/nosetests" "\
ARGS

\(fn ARGS)" t nil)

(autoload 'nosetests-run-it-cover-package "mylisps/nosetests" "\
ARGS

\(fn ARGS)" t nil)

(autoload 'nosetests-turn-on-pdb "mylisps/nosetests" "\
" t nil)

(autoload 'nosetests-turn-off-pdb "mylisps/nosetests" "\
" t nil)

(autoload 'nosetests-turn-on-coverage "mylisps/nosetests" "\
ARGS" t nil)

(autoload 'nosetests-turn-off-coverage "mylisps/nosetests" "\
ARGS" t nil)

(autoload 'nosetests-turn-on-profile "mylisps/nosetests" "\
ARGS" t nil)

(autoload 'nosetests-turn-off-profile "mylisps/nosetests" "\
ARGS" t nil)

(autoload 'nosetests-turn-on-doctest "mylisps/nosetests" "\
" t nil)

(autoload 'nosetests-turn-off-doctest "mylisps/nosetests" "\
" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/nosetests" '("colorize-compilation-buffer" "inner-testable" "nose" "outer-testable")))

;;;***

;;;### (autoloads nil "mylisps/purge-package" "mylisps/purge-package.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/purge-package.el

(defvar purge-package-list nil)

(defvar purge-package-flag t)

(autoload 'purge-package "mylisps/purge-package" "\
Purge package functions.

\(fn &optional FORCE)" t nil)

;;;***

;;;### (autoloads nil "mylisps/python-extensions" "mylisps/python-extensions.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/python-extensions.el

(autoload 'py-make-__all__-from-buffer "mylisps/python-extensions" "\
Create __all__ statements from buffer." t nil)

(autoload 'py-add-to-__all__ "mylisps/python-extensions" "\
add-to-__all__" t nil)

(autoload 'py--insert-imports "mylisps/python-extensions" "\

MODULENAME: strings of module name like 'os', 'sys'
STR: will insert strings
TAIL: if non-nill then insert string tail of imports block.

\(fn MODULENAME STR &optional TAIL)" nil nil)

(autoload 'py--insert-imports-regexp "mylisps/python-extensions" "\
py-insert-imports
REGEXP: search by regexp
STR: will insert strings
TAIL: if non-nill then insert string tail of imports block.

\(fn REGEXP STR &optional TAIL)" nil nil)

(autoload 'py-indirect-import "mylisps/python-extensions" "\
Indirect import region." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/python-extensions" '("indirect-" "py-")))

;;;***

;;;### (autoloads nil "mylisps/python-untabify" "mylisps/python-untabify.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/python-untabify.el

(autoload 'python-untabify "mylisps/python-untabify" "\
ARGS" t nil)

;;;***

;;;### (autoloads nil "mylisps/python/__python__" "mylisps/python/__python__.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/python/__python__.el

(autoload 'py:auto-colon "mylisps/python/__python__" "\
Python auto insert ':'." t nil)

(autoload 'py:auto-colon-return-on-line "mylisps/python/__python__" "\
Auto insert ':' and newline at end of lines." t nil)

(autoload 'py:return-on-line "mylisps/python/__python__" nil t nil)

(autoload 'py:newline "mylisps/python/__python__" "\
Auto insert ':' and newline." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/python/__python__" '("line-column" "py:")))

;;;***

;;;### (autoloads nil "mylisps/python/__python__operator" "mylisps/python/__python__operator.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/python/__python__operator.el

(autoload 'py:= "mylisps/python/__python__operator" "\
N

\(fn N)" t nil)

(autoload 'py:* "mylisps/python/__python__operator" "\
Wrap smart-operator-*.
N

\(fn N)" t nil)

(autoload 'py:\, "mylisps/python/__python__operator" "\
Wrap smart-operator-,.
N

\(fn N)" t nil)

(autoload 'py:- "mylisps/python/__python__operator" "\
Wrap smart-operator--.
N

\(fn N)" t nil)

(autoload 'py:+ "mylisps/python/__python__operator" "\
Wrap smart-operator-+.
N

\(fn N)" t nil)

(autoload 'py:/ "mylisps/python/__python__operator" "\
Wrap smart-operator-/.
N

\(fn N)" t nil)

(autoload 'py:% "mylisps/python/__python__operator" "\
Wrap smart-operator-%.
N

\(fn N)" t nil)

(autoload 'py:> "mylisps/python/__python__operator" "\
Wrap smart-operator->.
N

\(fn N)" t nil)

(autoload 'py:< "mylisps/python/__python__operator" "\
Wrap smart-operator-<.
N

\(fn N)" t nil)

(autoload 'py:& "mylisps/python/__python__operator" "\
Wrap smart-operator-&.
N

\(fn N)" t nil)

(autoload 'py:| "mylisps/python/__python__operator" "\
Wrap smart-operator-|.
N

\(fn N)" t nil)

(autoload 'py:: "mylisps/python/__python__operator" "\
ARGS

\(fn N)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/python/__python__operator" '("py-" "py:" "skip-ope")))

;;;***

;;;### (autoloads nil "mylisps/python/python-clonedigger" "mylisps/python/python-clonedigger.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/python/python-clonedigger.el

(autoload 'py:clonedigger "mylisps/python/python-clonedigger" "\
" t nil)

(autoload 'py:clonedigger-project "mylisps/python/python-clonedigger" "\
" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/python/python-clonedigger" '("py:clonedigger-run")))

;;;***

;;;### (autoloads nil "mylisps/python/python-debug" "mylisps/python/python-debug.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/python/python-debug.el

(autoload 'py:insert-pdb-set-trace "mylisps/python/python-debug" "\
Python insert-pdb-set-trace." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/python/python-debug" '("pdb-this-buffer")))

;;;***

;;;### (autoloads nil "mylisps/python/python-snippet-helper" "mylisps/python/python-snippet-helper.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/python/python-snippet-helper.el

(autoload 'py-snippet:argparse-add_argument-convert-dest-name "mylisps/python/python-snippet-helper" "\
ARGS

\(fn TEXT)" nil nil)

(autoload 'prev-def-name "mylisps/python/python-snippet-helper" nil nil nil)

(autoload 'prev-def-args "mylisps/python/python-snippet-helper" nil nil nil)

(autoload 'prev-class-name "mylisps/python/python-snippet-helper" nil nil nil)

(autoload 'py-in-class-block-p "mylisps/python/python-snippet-helper" "\
Return t if point in class block.
Also end of block has indented return t." nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/python/python-snippet-helper" '("py--go-to-paren-class")))

;;;***

;;;### (autoloads nil "mylisps/python/python-test-generator" "mylisps/python/python-test-generator.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/python/python-test-generator.el

(autoload 'py:testsmethod-insert-kill-ring "mylisps/python/python-test-generator" "\
CLS

\(fn &optional CLS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/python/python-test-generator" '("py:" "testsmethod-template")))

;;;***

;;;### (autoloads nil "mylisps/recover-last-killed-file" "mylisps/recover-last-killed-file.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/recover-last-killed-file.el

(defvar last-killed-file nil)

(autoload 'set-last-killed-file "mylisps/recover-last-killed-file" nil nil nil)

(autoload 'get-last-killed-file "mylisps/recover-last-killed-file" nil t nil)

;;;***

;;;### (autoloads nil "mylisps/recover-version" "mylisps/recover-version.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/recover-version.el

(autoload 'recover-version "mylisps/recover-version" "\
Recover from backup versions." t nil)

(defalias 'back-to-revision 'recover-version)

;;;***

;;;### (autoloads nil "mylisps/refactoring-elisp" "mylisps/refactoring-elisp.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/refactoring-elisp.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/refactoring-elisp" '("elisp-fit-tail")))

;;;***

;;;### (autoloads nil "mylisps/remark" "mylisps/remark.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mylisps/remark.el

(autoload 'remark "mylisps/remark" "\
Revive marked region." t nil)

;;;***

;;;### (autoloads nil "mylisps/rename-old-del" "mylisps/rename-old-del.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/rename-old-del.el

(autoload 'rename-old-del "mylisps/rename-old-del" "\
Write current buffer into file FILENAME.
This makes the buffer visit that file, and marks it as not modified.

If you specify just a directory name as FILENAME, that means to use
the default file name but in that directory.  You can also yank
the default file name into the minibuffer to edit it, using \\<minibuffer-local-map>\\[next-history-element].

If the buffer is not already visiting a file, the default file name
for the output file is the buffer name.

If optional second arg CONFIRM is non-nil, this function
asks for confirmation before overwriting an existing file.
Interactively, confirmation is required unless you supply a prefix argument.

If rename, prompt delete old file.

\(fn FILENAME &optional CONFIRM)" t nil)

;;;***

;;;### (autoloads nil "mylisps/renumber" "mylisps/renumber.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from mylisps/renumber.el

(autoload 'renumber "mylisps/renumber" "\
Renumber the list items in the current paragraph,
    starting at point.

\(fn &optional NUM)" t nil)

(autoload 'renumber-list "mylisps/renumber" "\
Renumber the list items in the current START..END region.
    If optional prefix arg NUM is given, start numbering from that number
    instead of 1.

\(fn START END &optional NUM)" t nil)

(autoload 'increment-number-at-point "mylisps/renumber" nil t nil)

(autoload 'decrement-number-at-point "mylisps/renumber" nil t nil)

;;;***

;;;### (autoloads nil "mylisps/replace-dir-sep" "mylisps/replace-dir-sep.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/replace-dir-sep.el

(autoload 'replace-dir-sep "mylisps/replace-dir-sep" "\
replace-dir-sep" t nil)

(autoload 'rep-dir-sep "mylisps/replace-dir-sep" "\
Replace directory separator.
START: start of region
END: end of region

\(fn START END)" t nil)

;;;***

;;;### (autoloads nil "mylisps/rest-room" "mylisps/rest-room.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/rest-room.el

(defvar rest-room-hook nil)

(autoload 'rest-room "mylisps/rest-room" nil t nil)

;;;***

;;;### (autoloads nil "mylisps/rotate-text" "mylisps/rotate-text.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/rotate-text.el

(defvar rotate-text-rotations 'nil "\
List of text rotation sets.")

(make-variable-buffer-local 'rotate-text-rotations)

(autoload 'rotate-region "mylisps/rotate-text" "\
Rotate all matches in `rotate-text-rotations' between point and mark.

\(fn BEG END)" t nil)

(autoload 'rotate-string "mylisps/rotate-text" "\
Rotate all matches in STRING using associations in ROTATIONS.
If ROTATIONS are not given it defaults to `rotate-text-rotations'.

\(fn STRING &optional ROTATIONS)" nil nil)

(autoload 'rotate-next "mylisps/rotate-text" "\
Return the next element after STRING in ROTATIONS.

\(fn STRING &optional ROTATIONS)" nil nil)

(autoload 'rotate-get-rotations-for "mylisps/rotate-text" "\
Return the string rotations for STRING in ROTATIONS.

\(fn STRING &optional ROTATIONS)" nil nil)

(autoload 'rotate-convert-rotations-to-regexp "mylisps/rotate-text" "\


\(fn ROTATIONS)" nil nil)

(autoload 'rotate-flatten-list "mylisps/rotate-text" "\
Flatten LIST-OF-LISTS to a single list.
Example:
  (rotate-flatten-list '((a b c) (1 ((2 3)))))
    => (a b c 1 2 3)

\(fn LIST-OF-LISTS)" nil nil)

(autoload 'rotate-word-at-point "mylisps/rotate-text" "\
Rotate word at point based on sets in `rotate-text-rotations'." t nil)

(autoload 'indent-or-rotate "mylisps/rotate-text" "\
If point is at end of a word, then else indent the line." t nil)

;;;***

;;;### (autoloads nil "mylisps/scrap-code" "mylisps/scrap-code.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/scrap-code.el

(autoload 'scrap-code "mylisps/scrap-code" "\
Scraping current buffer to scrap directory." t nil)

;;;***

;;;### (autoloads nil "mylisps/server-utils" "mylisps/server-utils.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/server-utils.el

(autoload 'after-init-server "mylisps/server-utils" "\
Launch server after init." nil nil)

;;;***

;;;### (autoloads nil "mylisps/settings/auto-complete-setup" "mylisps/settings/auto-complete-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/auto-complete-setup.el

(autoload 'auto-complete-stop&save "mylisps/settings/auto-complete-setup" "\
Auto complete stop and save." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/auto-complete-setup" '("auto-complete-")))

;;;***

;;;### (autoloads nil "mylisps/settings/auto-highlight-symbol-setup"
;;;;;;  "mylisps/settings/auto-highlight-symbol-setup.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from mylisps/settings/auto-highlight-symbol-setup.el

(autoload 'ahs-edit-mode-tmp-whole-buffer "mylisps/settings/auto-highlight-symbol-setup" "\
ARG
%OPTIONAL
TEMPORARY" t nil)

(autoload 'py:ahs-edit-mode-def-region "mylisps/settings/auto-highlight-symbol-setup" "\
" t nil)

(autoload 'py:ahs-edit-mode-class-region "mylisps/settings/auto-highlight-symbol-setup" "\
" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/auto-highlight-symbol-setup" '("py:")))

;;;***

;;;### (autoloads nil "mylisps/settings/auto-recover-setup" "mylisps/settings/auto-recover-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/auto-recover-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/auto-recover-setup" '("no-autorecover-init-time-flag")))

;;;***

;;;### (autoloads nil "mylisps/settings/auto-save-setup" "mylisps/settings/auto-save-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/auto-save-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/auto-save-setup" '("my-auto-save-dir")))

;;;***

;;;### (autoloads nil "mylisps/settings/backup-setup" "mylisps/settings/backup-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/backup-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/backup-setup" '("avoid-old-backup-re" "backup-first-change" "force-backup-of-buffer" "make-backup-")))

;;;***

;;;### (autoloads nil "mylisps/settings/base-setup" "mylisps/settings/base-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/base-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/base-setup" '("message-box" "my-bell-function")))

;;;***

;;;### (autoloads nil "mylisps/settings/c-mode-setup" "mylisps/settings/c-mode-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/c-mode-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/c-mode-setup" '("gtags-mode-predefine" "insert-include")))

;;;***

;;;### (autoloads nil "mylisps/settings/check-default-setup" "mylisps/settings/check-default-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/check-default-setup.el

(autoload 'default-el-update-var "mylisps/settings/check-default-setup" "\
update 09_check_default_start.el setting variables." nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/check-default-setup" '("default-el-")))

;;;***

;;;### (autoloads nil "mylisps/settings/dired-setup" "mylisps/settings/dired-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/dired-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/dired-setup" '("dired-" "my-dired-today-search" "py:dired-create-directory")))

;;;***

;;;### (autoloads nil "mylisps/settings/dsvn-setup" "mylisps/settings/dsvn-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/dsvn-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/dsvn-setup" '("svn-")))

;;;***

;;;### (autoloads nil "mylisps/settings/e2wm-setup" "mylisps/settings/e2wm-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/e2wm-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/e2wm-setup" '("e2wm:toggle-start-stop")))

;;;***

;;;### (autoloads nil "mylisps/settings/eldoc-setup" "mylisps/settings/eldoc-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/eldoc-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/eldoc-setup" '("eldoc-emacs-lisp-mode-hook")))

;;;***

;;;### (autoloads nil "mylisps/settings/elisp-mode-hooks-setup" "mylisps/settings/elisp-mode-hooks-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/elisp-mode-hooks-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/elisp-mode-hooks-setup" '("emacs-lisp-mode-hook" "lisp-interaction-mode-hook")))

;;;***

;;;### (autoloads nil "mylisps/settings/environment-setup" "mylisps/settings/environment-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/environment-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/environment-setup" '("define-my-path" "my-")))

;;;***

;;;### (autoloads nil "mylisps/settings/eww-setup" "mylisps/settings/eww-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/eww-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/eww-setup" '("eww-" "shr-")))

;;;***

;;;### (autoloads nil "mylisps/settings/expand-region-setup" "mylisps/settings/expand-region-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/expand-region-setup.el

(autoload 't1-mark "mylisps/settings/expand-region-setup" "\
ARG

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "mylisps/settings/face-setup" "mylisps/settings/face-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/face-setup.el

(autoload 'toggle-max-window "mylisps/settings/face-setup" nil t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/face-setup" '("color" "default-frame-width" "list-colors" "set-cursor-")))

;;;***

;;;### (autoloads nil "mylisps/settings/final-setup" "mylisps/settings/final-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/final-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/final-setup" '("bfn" "space-to-tab" "tab-to-space")))

;;;***

;;;### (autoloads nil "mylisps/settings/flycheck-setup" "mylisps/settings/flycheck-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/flycheck-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/flycheck-setup" '("flycheck-emacs-lisp-mode-hook")))

;;;***

;;;### (autoloads nil "mylisps/settings/frame-setup" "mylisps/settings/frame-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/frame-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/frame-setup" '("frame-" "main-" "running-emacs-count")))

;;;***

;;;### (autoloads nil "mylisps/settings/gdb-setup" "mylisps/settings/gdb-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/gdb-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/gdb-setup" '("kill-some-gud-buffers")))

;;;***

;;;### (autoloads nil "mylisps/settings/header2-setup" "mylisps/settings/header2-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/header2-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/header2-setup" '("header-" "make-revision" "update-")))

;;;***

;;;### (autoloads nil "mylisps/settings/helm-setup" "mylisps/settings/helm-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/helm-setup.el

(autoload 'helm-my-edit "mylisps/settings/helm-setup" "\
" t nil)

;;;***

;;;### (autoloads nil "mylisps/settings/iswitchb-setup" "mylisps/settings/iswitchb-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/iswitchb-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/iswitchb-setup" '("iswitchb-")))

;;;***

;;;### (autoloads nil "mylisps/settings/linux-keyrate-setup" "mylisps/settings/linux-keyrate-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/linux-keyrate-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/linux-keyrate-setup" '("keyrate-" "my-set-keyrate")))

;;;***

;;;### (autoloads nil "mylisps/settings/ll-debug-setup" "mylisps/settings/ll-debug-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/ll-debug-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/ll-debug-setup" '("my-ll-debug-toggle-comment-region-or-line" "t1-py-delete-debug-print")))

;;;***

;;;### (autoloads nil "mylisps/settings/loaddefs-setup" "mylisps/settings/loaddefs-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/loaddefs-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/loaddefs-setup" '("loaddefs-name" "update-loaddefs-site-lisp")))

;;;***

;;;### (autoloads nil "mylisps/settings/modeline-setup" "mylisps/settings/modeline-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/modeline-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/modeline-setup" '("mode-line-point-o" "toggle-mode-line")))

;;;***

;;;### (autoloads nil "mylisps/settings/multiple-cursors-setup" "mylisps/settings/multiple-cursors-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/multiple-cursors-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/multiple-cursors-setup" '("my-mc/")))

;;;***

;;;### (autoloads nil "mylisps/settings/nosetests-setup" "mylisps/settings/nosetests-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/nosetests-setup.el

(autoload 'nosetests-mode-predefine "mylisps/settings/nosetests-setup" "\
For `eval-after-load' nosetests function." nil nil)

(autoload 'nosetests-mode-face-predefine "mylisps/settings/nosetests-setup" "\
For nosetests face." nil nil)

(autoload 'nosetests-run-all+ "mylisps/settings/nosetests-setup" "\


\(fn ARGS)" t nil)

(autoload 'nosetests-run-it-cover-package+ "mylisps/settings/nosetests-setup" "\
ARGS

\(fn ARGS)" t nil)

(autoload 'nosetests-run-all-cover-package+ "mylisps/settings/nosetests-setup" "\
ARGS

\(fn ARGS)" t nil)

;;;***

;;;### (autoloads nil "mylisps/settings/open-junk-file-setup" "mylisps/settings/open-junk-file-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/open-junk-file-setup.el

(autoload 'cleanup-open-junk-files "mylisps/settings/open-junk-file-setup" "\
" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/open-junk-file-setup" '("open-junk-file-di")))

;;;***

;;;### (autoloads nil "mylisps/settings/package-setup" "mylisps/settings/package-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/package-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/package-setup" '("package-bundle")))

;;;***

;;;### (autoloads nil "mylisps/settings/py-environment-setup" "mylisps/settings/py-environment-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/py-environment-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/py-environment-setup" '("my-pylib-dir" "pythonpath-")))

;;;***

;;;### (autoloads nil "mylisps/settings/pymacs-setup" "mylisps/settings/pymacs-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/pymacs-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/pymacs-setup" '("rope-open-current-or-parent")))

;;;***

;;;### (autoloads nil "mylisps/settings/python-mode-setup" "mylisps/settings/python-mode-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/python-mode-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/python-mode-setup" '("inferior-python-mode-hook" "my-python-" "python-" "refactoring-python-mode-hook")))

;;;***

;;;### (autoloads nil "mylisps/settings/refactoring-elisp-setup"
;;;;;;  "mylisps/settings/refactoring-elisp-setup.el" (0 0 0 0))
;;; Generated autoloads from mylisps/settings/refactoring-elisp-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/refactoring-elisp-setup" '("refactoring-elisp-emacs-lisp-mode-hook")))

;;;***

;;;### (autoloads nil "mylisps/settings/register-setup" "mylisps/settings/register-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/register-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/register-setup" '("insert-register-disable-exchange")))

;;;***

;;;### (autoloads nil "mylisps/settings/rotate-text-setup" "mylisps/settings/rotate-text-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/rotate-text-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/rotate-text-setup" '("rotate-text-emacs-lisp-mode-hook")))

;;;***

;;;### (autoloads nil "mylisps/settings/sdic-setup" "mylisps/settings/sdic-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/sdic-setup.el

(autoload 'my-sdic-describe-word-with-popup "mylisps/settings/sdic-setup" "\
Display the meaning of word.

\(fn WORD &optional SEARCH-FUNCTION)" t nil)

;;;***

;;;### (autoloads nil "mylisps/settings/sql-setup" "mylisps/settings/sql-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/sql-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/sql-setup" '("sql-interactive-auto-semicolon")))

;;;***

;;;### (autoloads nil "mylisps/settings/subroutines" "mylisps/settings/subroutines.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/subroutines.el

(autoload 'list-matched-buffers "mylisps/settings/subroutines" "\
RE

\(fn RE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/subroutines" '("at-string|comment-p" "benchmark-load" "carbon-p" "change-as-root" "colinux-p" "cygwin-p" "darwin-p" "delete-buffer-regexp" "emacs2" "file-root-p" "flatten" "force-kill-emacs" "insert-" "kill-some-buffers-by-" "linux-p" "meadow-p" "myrecompile-recursively" "narrow-to-line" "ns-p" "nt-p" "parse-command-line" "recursive-" "startup-" "time-lag" "walk-edit" "windows-p" "x->bool")))

;;;***

;;;### (autoloads nil "mylisps/settings/t1-simple-setup" "mylisps/settings/t1-simple-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/t1-simple-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/t1-simple-setup" '("t1-simple-emacs-lisp-mode-hook" "uniq-region")))

;;;***

;;;### (autoloads nil "mylisps/settings/term-setup" "mylisps/settings/term-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/term-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/term-setup" '("term-")))

;;;***

;;;### (autoloads nil "mylisps/settings/text-adjust-setup" "mylisps/settings/text-adjust-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/text-adjust-setup.el

(autoload 'text-adjust-space-before-save-if-needed "mylisps/settings/text-adjust-setup" nil nil nil)

;;;***

;;;### (autoloads nil "mylisps/settings/view-setup" "mylisps/settings/view-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/view-setup.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/view-setup" '("turn-o" "view-mode-by-exclude-regexp")))

;;;***

;;;### (autoloads nil "mylisps/settings/w3m-setup" "mylisps/settings/w3m-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/w3m-setup.el

(autoload 'w3m-browse-url-new-tab "mylisps/settings/w3m-setup" "\


\(fn URL &optional NEW-SESSION)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/w3m-setup" '("my-w3m-" "rand-w3m-view-this-url-background-session" "w3m-")))

;;;***

;;;### (autoloads nil "mylisps/settings/yasnippet-setup" "mylisps/settings/yasnippet-setup.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/settings/yasnippet-setup.el

(autoload 'yas-popup-isearch-prompt "mylisps/settings/yasnippet-setup" "\


\(fn PROMPT CHOICES &optional DISPLAY-FN)" nil nil)

(defvar yas-my-pre-marker nil)

(defvar yas-my-post-marker nil)

(autoload 'yas-my-save-marker "mylisps/settings/yasnippet-setup" nil nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/settings/yasnippet-setup" '("decrement-yas-number" "flycheck-isactive-flag" "increment-yas-number" "recover-flycheck-after-exit-from-yas" "snippet-finalize" "yasnippet-local-condition-predefine")))

;;;***

;;;### (autoloads nil "mylisps/sort-ext" "mylisps/sort-ext.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from mylisps/sort-ext.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/sort-ext" '("reverse-" "sort-")))

;;;***

;;;### (autoloads nil "mylisps/switch-buffer" "mylisps/switch-buffer.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/switch-buffer.el

(autoload 'switch-message "mylisps/switch-buffer" "\
Switch *Messages* buffer." t nil)

(autoload 't1-switch-04_bindings_start "mylisps/switch-buffer" "\
Switch 04_bindings_start or find file." t nil)

(autoload 'switch-test_start "mylisps/switch-buffer" "\
Switch test_start.el or find file." t nil)

(autoload 'switch-hotstring "mylisps/switch-buffer" "\
Switch to 30_hotstring_plugin_start.el" t nil)

(autoload 'switch-allinone "mylisps/switch-buffer" "\
Switch allinone.org or find file." t nil)

(autoload 'switch-scratch "mylisps/switch-buffer" "\
Switch *scratch*." t nil)

(autoload 'switch-start-dir "mylisps/switch-buffer" "\
" t nil)

(autoload 'switch-dired "mylisps/switch-buffer" "\
Switch Dired." t nil)

(autoload 'switch-junk "mylisps/switch-buffer" "\
Switch funk file." t nil)

(autoload 'switch-snippets "mylisps/switch-buffer" "\
switch snippets directory as dired." t nil)

(autoload 'switch-ipython "mylisps/switch-buffer" "\
Switch Ipythn." t nil)

(autoload 'find-file-conf "mylisps/switch-buffer" "\
Find file startup config." t nil)

(autoload 'match-dir-file "mylisps/switch-buffer" "\
Return first matched file name by STRING in DIRECTORY.
EXCUDE is exclude regexp to match file name

\(fn STRING DIRECTORY &optional EXCLUDE)" nil nil)

(autoload 'register-buffer "mylisps/switch-buffer" "\


\(fn &optional ARG)" t nil)

(autoload 'launch-or-switch-term "mylisps/switch-buffer" "\
If exists term buffer then switch it.
If not exists term buffer then create term buffer." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/switch-buffer" '("register-buffer" "switch--regexp" "t1-switch--findfile")))

;;;***

;;;### (autoloads nil "mylisps/t1-bind-key" "mylisps/t1-bind-key.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/t1-bind-key.el

(autoload 't1-edit-bind-keys "mylisps/t1-bind-key" "\
For my edit binding keys.
MAPS like '((\"a\" . end-of-line)).

\(fn MAPS)" nil nil)

(autoload 't1-switch-bind-keys "mylisps/t1-bind-key" "\
ARGS

\(fn MAPS)" nil nil)

(autoload 't1-ctl-x-bind-keys "mylisps/t1-bind-key" "\
MAPS

\(fn MAPS)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/t1-bind-key" '("bind-from-table" "common-view-map-" "t1-")))

;;;***

;;;### (autoloads nil "mylisps/t1-simple" "mylisps/t1-simple.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/t1-simple.el

(autoload 'my-backward-seq "mylisps/t1-simple" "\
Sequential Backward Move. Beginning of LINE, WINDOW, BUFFER. And return START-POINT.
Args:  4 = start point
       8 = beginning of line
      12 = beginning of window
      16 = beginning of buffer

\(fn &optional ARGS)" t nil)

(autoload 'my-forward-seq "mylisps/t1-simple" "\
Sequential Forward Move. End of LINE, WINDOW, BUFFER. And return START-POINT.
Args:  4 = start point
       8 = end of line
      12 = end of window
      16 = end of buffer

\(fn &optional ARGS)" t nil)

(autoload 'esc-comment-end-of-line "mylisps/t1-simple" "\
Skip backward comment when end-of-line" t nil)

(autoload 'seq-esc-comment-end-of-line "mylisps/t1-simple" "\
" t nil)

(autoload 'swap-screen "mylisps/t1-simple" "\
Swap two screen,leaving cursor at current window." t nil)

(autoload 'swap-screen-with-cursor "mylisps/t1-simple" "\
Swap two screen,with cursor in same buffer." t nil)

(autoload 'scroll-window-to-top "mylisps/t1-simple" "\
Scroll window up to top.
POINT: 

\(fn POINT)" t nil)

(autoload 'text-scale-decrease "mylisps/t1-simple" "\
Zoom out." t nil)

(autoload 'text-scale-enlarge "mylisps/t1-simple" "\
Zoom up." t nil)

(autoload 'text-scale-default "mylisps/t1-simple" "\
Reset zoom in or out." t nil)

(autoload 'return-on-line "mylisps/t1-simple" nil t nil)

(autoload 'beginning-of-line-or-indentation "mylisps/t1-simple" nil t nil)

(autoload 'backward-kill-line "mylisps/t1-simple" "\
Delete characters beginning of line from point.
ARG:
If pointer set beginning of line then join line.
If set prefix <C-u> then delete string to yank.

\(fn ARG)" t nil)

(autoload 'delete-word "mylisps/t1-simple" "\
Delete characters forward until encountering the end of a word.
ARG:
With argument, do this that many times.

\(fn ARG)" t nil)

(autoload 'backward-delete-word "mylisps/t1-simple" "\
Delete characters backward until encountering the end of a word.
ARG:
With argument, do this that many times.

\(fn ARG)" t nil)

(autoload 'delete-trailing-blank-lines "mylisps/t1-simple" "\
Deletes all blank lines at the end of the file." t nil)

(autoload 'my-backward-delete-word "mylisps/t1-simple" "\
Delete backward word.
ARG:

\(fn ARG)" t nil)

(autoload 't1-kill-line "mylisps/t1-simple" "\
If line is blank, delete all surrounding blank lines, leaving just one.
ARG:
On isolated blank line, delete that one.
On nonblank line, kill whole line.

\(fn ARG)" t nil)

(autoload 'copy-whole-line "mylisps/t1-simple" "\
Copy current line.
ARG:

\(fn &optional ARG)" t nil)

(autoload 'move-text-internal "mylisps/t1-simple" "\
Move text internal function.
ARG:

\(fn ARG)" nil nil)

(autoload 'move-text-down "mylisps/t1-simple" "\
Move region (transient-mark-mode active) or current line.
ARG lines down.

\(fn ARG)" t nil)

(autoload 'move-text-up "mylisps/t1-simple" "\
Move region (transient-mark-mode active) or current line.
ARG lines up.

\(fn ARG)" t nil)

(autoload 'blank-line-p "mylisps/t1-simple" "\
Return non-nil if and only if current line is blank." nil nil)

(autoload 'my-forward-whitespace "mylisps/t1-simple" "\


\(fn ARG)" t nil)

(autoload 'my-backward-whitespace "mylisps/t1-simple" "\


\(fn ARG)" t nil)

(autoload 'backward-whitespace "mylisps/t1-simple" "\
Move back to whitespace.

\(fn ARG)" t nil)

(autoload 'just-one-blank-line "mylisps/t1-simple" "\
On blank line, delete all surrounding blank lines, leaving just one." t nil)

(autoload 'indent-and-next "mylisps/t1-simple" "\
Indent and forward line.
ARGS: dotimes number.

\(fn ARGS)" t nil)

(autoload 't1-parence "mylisps/t1-simple" "\
" t nil)

(autoload 'forward-skip-string-regexp "mylisps/t1-simple" "\
" t nil)

(autoload 'backward-skip-string-regexp "mylisps/t1-simple" "\
" t nil)

(autoload 't1-forward-thing "mylisps/t1-simple" "\
ARG

\(fn ARG)" t nil)

(autoload 't1-backward-thing "mylisps/t1-simple" "\
ARG

\(fn ARG)" t nil)

(autoload 'clear-overlays "mylisps/t1-simple" nil t nil)

(autoload 'open-line-indent "mylisps/t1-simple" "\


\(fn N)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/t1-simple" '("dolist-member" "seq-start-point" "skip-fontlocks" "what-face-at-point")))

;;;***

;;;### (autoloads nil "mylisps/t1macro" "mylisps/t1macro.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from mylisps/t1macro.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/t1macro" '("append-to-list" "define-many-keys" "defvar-local" "run-hooks-after-load" "save-")))

;;;***

;;;### (autoloads nil "mylisps/timestamp-insert" "mylisps/timestamp-insert.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/timestamp-insert.el

(autoload 'timestamp-insert "mylisps/timestamp-insert" "\
timestamp insert from popup menu" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/timestamp-insert" '("time-format-list")))

;;;***

;;;### (autoloads nil "mylisps/user-loaddefs" "mylisps/user-loaddefs.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/user-loaddefs.el

(autoload 'user-generate-loaddefs "mylisps/user-loaddefs" "\
NAME
DIR

\(fn NAME TOP-DIR)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/user-loaddefs" '("loaddefs-name" "user-loaddefs-recursive-directory-candidates")))

;;;***

;;;### (autoloads nil "mylisps/windmove-or-split" "mylisps/windmove-or-split.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from mylisps/windmove-or-split.el

(autoload 'windmove-or-splitmove "mylisps/windmove-or-split" "\
Try window move. If not exist window then split it.
もし前回呼ばれた時間の差が`windmove-max-elapse-time'よりも短ければ
`windmove-wrap-around' をnil にする。
MVCMD set `windmove-right', `windmove-left', `windmove-up', `windmove-down'
NOSPLIT non-nil is no split.

\(fn MVCMD SPLITCMD &optional NOSPLIT)" nil nil)

(autoload 'windmove-down-or-splitmove "mylisps/windmove-or-split" "\
Try window move down. If not exist window then split it vertically

\(fn &optional ARGS)" t nil)

(autoload 'windmove-up-or-splitmove "mylisps/windmove-or-split" "\
Try window move up. If not exist window then split it vertically

\(fn &optional ARGS)" t nil)

(autoload 'windmove-left-or-splitmove "mylisps/windmove-or-split" "\
Try window move left. If not exist window then split it horizontally

\(fn &optional ARGS)" t nil)

(autoload 'windmove-right-or-splitmove "mylisps/windmove-or-split" "\
Try window move right. If not exist window then split it horizontally

\(fn &optional ARGS)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "mylisps/windmove-or-split" '("windmove-")))

;;;***

;;;### (autoloads nil "pydoc-info" "pydoc-info.el" (0 0 0 0))
;;; Generated autoloads from pydoc-info.el

(require 'info-look)

(autoload 'pydoc-info-add-help "pydoc-info" "\
Add help specifications for a list of Info FILES.

The added specifications are tailored for use with Info files
generated from Sphinx documents.

MORE-SPECS are additional or overriding values passed to
`info-lookup-add-help'.

\(fn FILES &rest MORE-SPECS)" nil nil)

(pydoc-info-add-help '("python"))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pydoc-info" '("pydoc-info-")))

;;;***

;;;### (autoloads nil "pylit" "pylit.el" (0 0 0 0))
;;; Generated autoloads from pylit.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pylit" '("pylit-")))

;;;***

;;;### (autoloads nil "pymacs" "pymacs.el" (0 0 0 0))
;;; Generated autoloads from pymacs.el

(autoload 'pymacs-load "pymacs" "\
Import the Python module named MODULE into Emacs.
Each function in the Python module is made available as an Emacs function.
The Lisp name of each function is the concatenation of PREFIX with
the Python name, in which underlines are replaced by dashes.  If PREFIX is
not given, it defaults to MODULE followed by a dash.
If NOERROR is not nil, do not raise error when the module is not found.

\(fn MODULE &optional PREFIX NOERROR)" t nil)

(autoload 'pymacs-autoload "pymacs" "\
Pymacs's equivalent of the standard emacs facility `autoload'.
Define FUNCTION to autoload from Python MODULE using PREFIX.
If PREFIX is not given, it defaults to MODULE followed by a dash.
Optional DOCSTRING documents FUNCTION until it gets loaded.
INTERACTIVE is normally the argument to the function `interactive',
t means `interactive' without arguments, nil means not interactive,
which is the default.

\(fn FUNCTION MODULE &optional PREFIX DOCSTRING INTERACTIVE)" nil nil)

(autoload 'pymacs-eval "pymacs" "\
Compile TEXT as a Python expression, and return its value.

\(fn TEXT)" t nil)

(autoload 'pymacs-exec "pymacs" "\
Compile and execute TEXT as a sequence of Python statements.
This functionality is experimental, and does not appear to be useful.

\(fn TEXT)" t nil)

(autoload 'pymacs-call "pymacs" "\
Return the result of calling a Python function FUNCTION over ARGUMENTS.
FUNCTION is a string denoting the Python function, ARGUMENTS are separate
Lisp expressions, one per argument.  Immutable Lisp constants are converted
to Python equivalents, other structures are converted into Lisp handles.

\(fn FUNCTION &rest ARGUMENTS)" nil nil)

(autoload 'pymacs-apply "pymacs" "\
Return the result of calling a Python function FUNCTION over ARGUMENTS.
FUNCTION is a string denoting the Python function, ARGUMENTS is a list of
Lisp expressions.  Immutable Lisp constants are converted to Python
equivalents, other structures are converted into Lisp handles.

\(fn FUNCTION ARGUMENTS)" nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "pymacs" '("pymacs-")))

;;;***

;;;### (autoloads nil "python-pylint" "python-pylint.el" (0 0 0 0))
;;; Generated autoloads from python-pylint.el

(autoload 'python-pylint "python-pylint" "\
Run PYLINT, and collect output in a buffer.
While pylint runs asynchronously, you can use \\[next-error] (M-x next-error),
or \\<python-pylint-mode-map>\\[compile-goto-error] in the grep output buffer, to go to the lines where pylint found matches." t nil)

(defalias 'pylint 'python-pylint)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "python-pylint" '("python-pylint-")))

;;;***

;;;### (autoloads nil "sdic/sdic" "sdic/sdic.el" (0 0 0 0))
;;; Generated autoloads from sdic/sdic.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sdic/sdic" '("sdic")))

;;;***

;;;### (autoloads nil "sdic/sdic-compat" "sdic/sdic-compat.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from sdic/sdic-compat.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sdic/sdic-compat" '("sdic-compat-")))

;;;***

;;;### (autoloads nil "sdic/sdic-gene" "sdic/sdic-gene.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from sdic/sdic-gene.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sdic/sdic-gene" '("sdic-gene-")))

;;;***

;;;### (autoloads nil "sdic/sdicf" "sdic/sdicf.el" (0 0 0 0))
;;; Generated autoloads from sdic/sdicf.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sdic/sdicf" '("sdicf-")))

;;;***

;;;### (autoloads nil "sdic/sdicf-client" "sdic/sdicf-client.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from sdic/sdicf-client.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sdic/sdicf-client" '("sdicf-client-")))

;;;***

;;;### (autoloads nil "sdic/stem" "sdic/stem.el" (0 0 0 0))
;;; Generated autoloads from sdic/stem.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sdic/stem" '("stem")))

;;;***

;;;### (autoloads nil "sequential-command-config" "sequential-command-config.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from sequential-command-config.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "sequential-command-config" '("seq")))

;;;***

;;;### (autoloads nil "systemd-company" "systemd-company.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from systemd-company.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "systemd-company" '("systemd-company-")))

;;;***

;;;### (autoloads nil "text-adjust" "text-adjust.el" (0 0 0 0))
;;; Generated autoloads from text-adjust.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "text-adjust" '("text-adjust")))

;;;***

;;;### (autoloads nil "toggle-let-astah" "toggle-let-astah.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from toggle-let-astah.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "toggle-let-astah" '("toggle-let-astah")))

;;;***

;;;### (autoloads nil "trash-settings" "trash-settings.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from trash-settings.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "trash-settings" '("call-process-discard-output" "file-excluded-from-system-trash-p" "string-begins-with-p" "system-" "trash-or-rm")))

;;;***

;;;### (autoloads nil "xmodmap-mode" "xmodmap-mode.el" (0 0 0 0))
;;; Generated autoloads from xmodmap-mode.el

(autoload 'xmodmap-mode "xmodmap-mode" "\
Major mode for editing ~/.xmodmaprc" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xmodmap-mode" '("xmodmap-")))

;;;***

;;;### (autoloads nil "yama-find-file-binary" "yama-find-file-binary.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from yama-find-file-binary.el

(defvar YAMA-file-not-binary-extensions '("el" "ahk") "\
バイナリと見なさないファイルの拡張子を
    (\"txt\") のようにリストで指定する
    ただしすべて小文字で指定する")

(defvar YAMA-file-not-binary-files '("tags" "gsyms" "gpath" "grtags" "gsyms" "gtags" "el") "\
バイナリとみなされないファイル名を指定する。
     ただし、すべて小文字で指定のこと")

(autoload 'YAMA-file-binary-p "yama-find-file-binary" "\
Return t if FILE contains binary data.  If optional FULL is non-nil,
  check for the whole contents of FILE, otherwise check for the first
    1000-byte.

\(fn FILE &optional FULL)" nil nil)

;;;***

;;;### (autoloads nil "yasnippet-config" "yasnippet-config.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from yasnippet-config.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "yasnippet-config" '("flymake-is-active-flag" "yas")))

;;;***

;;;### (autoloads nil nil ("mylisps/linux-face.el" "mylisps/settings/Info-mode-setup.el"
;;;;;;  "mylisps/settings/__python__-operator-setup.el" "mylisps/settings/__python__-setup.el"
;;;;;;  "mylisps/settings/align-setup.el" "mylisps/settings/annotation-setup.el"
;;;;;;  "mylisps/settings/apropos-setup.el" "mylisps/settings/ascii-setup.el"
;;;;;;  "mylisps/settings/asm-mode-setup.el" "mylisps/settings/auto-async-byte-compile-setup.el"
;;;;;;  "mylisps/settings/auto-insert-setup.el" "mylisps/settings/auto-install-setup.el"
;;;;;;  "mylisps/settings/auto-yasnippet-setup.el" "mylisps/settings/autorevert-setup.el"
;;;;;;  "mylisps/settings/bat-mode-setup.el" "mylisps/settings/binding-setup.el"
;;;;;;  "mylisps/settings/check-misspell-setup.el" "mylisps/settings/col-highlight-setup.el"
;;;;;;  "mylisps/settings/column-highlight-setup.el" "mylisps/settings/crontab-mode-setup.el"
;;;;;;  "mylisps/settings/csv-mode-setup.el" "mylisps/settings/cua-base-setup.el"
;;;;;;  "mylisps/settings/cus-edit-setup.el" "mylisps/settings/dmacro-setup.el"
;;;;;;  "mylisps/settings/doctest-mode-setup.el" "mylisps/settings/duplicate-line-setup.el"
;;;;;;  "mylisps/settings/edebug-setup.el" "mylisps/settings/edit-list-setup.el"
;;;;;;  "mylisps/settings/elisp-mode-bind-key-setup.el" "mylisps/settings/elisp-setup.el"
;;;;;;  "mylisps/settings/elisp-util-setup.el" "mylisps/settings/filecache-setup.el"
;;;;;;  "mylisps/settings/flymake-setup.el" "mylisps/settings/fold-dwim-setup.el"
;;;;;;  "mylisps/settings/gnu-art-setup.el" "mylisps/settings/gnus-cite-setup.el"
;;;;;;  "mylisps/settings/gnus-setup.el" "mylisps/settings/grep-setup.el"
;;;;;;  "mylisps/settings/help-mode-setup.el" "mylisps/settings/hideif-setup.el"
;;;;;;  "mylisps/settings/hideshow-setup.el" "mylisps/settings/hl-line-setup.el"
;;;;;;  "mylisps/settings/host-bishop-setup.el" "mylisps/settings/hotstring-setup.el"
;;;;;;  "mylisps/settings/icomplete-setup.el" "mylisps/settings/image-mode-setup.el"
;;;;;;  "mylisps/settings/ispell-setup.el" "mylisps/settings/javascript-mode-setup.el"
;;;;;;  "mylisps/settings/jedi-setup.el" "mylisps/settings/kmacro-setup.el"
;;;;;;  "mylisps/settings/linum-setup.el" "mylisps/settings/linux-face-setup.el"
;;;;;;  "mylisps/settings/linux-setup.el" "mylisps/settings/load-path-setup.el"
;;;;;;  "mylisps/settings/log-edit-setup.el" "mylisps/settings/mac-setup.el"
;;;;;;  "mylisps/settings/magit-setup.el" "mylisps/settings/message-setup.el"
;;;;;;  "mylisps/settings/midnight-setup.el" "mylisps/settings/minibuffer-setup.el"
;;;;;;  "mylisps/settings/moccur-setup.el" "mylisps/settings/mule-cmds-setup.el"
;;;;;;  "mylisps/settings/mysimple-setup.el" "mylisps/settings/org-setup.el"
;;;;;;  "mylisps/settings/paren-setup.el" "mylisps/settings/php-mode-setup.el"
;;;;;;  "mylisps/settings/point-stack-setup.el" "mylisps/settings/point-undo-setup.el"
;;;;;;  "mylisps/settings/popup-setup.el" "mylisps/settings/pylookup-setup.el"
;;;;;;  "mylisps/settings/python-clonedigger-setup.el" "mylisps/settings/python-debug-setup.el"
;;;;;;  "mylisps/settings/python-mode-bind-key-setup.el" "mylisps/settings/python-pep8-setup.el"
;;;;;;  "mylisps/settings/python-pylint-setup.el" "mylisps/settings/python-setup.el"
;;;;;;  "mylisps/settings/python-snippet-helper-setup.el" "mylisps/settings/python-test-generator-setup.el"
;;;;;;  "mylisps/settings/python-untabify-setup.el" "mylisps/settings/quickrun-setup.el"
;;;;;;  "mylisps/settings/recentf-setup.el" "mylisps/settings/recover-last-killed-file-setup.el"
;;;;;;  "mylisps/settings/rename-old-del-setup.el" "mylisps/settings/s-setup.el"
;;;;;;  "mylisps/settings/savehist-setup.el" "mylisps/settings/savekill-setup.el"
;;;;;;  "mylisps/settings/saveplace-setup.el" "mylisps/settings/scratch-ext-setup.el"
;;;;;;  "mylisps/settings/server-setup.el" "mylisps/settings/sh-script-mode-setup.el"
;;;;;;  "mylisps/settings/smartparens-setup.el" "mylisps/settings/smartrep-setup.el"
;;;;;;  "mylisps/settings/sudo-ext-setup.el" "mylisps/settings/switch-buffer-setup.el"
;;;;;;  "mylisps/settings/syslog-mode-setup.el" "mylisps/settings/systemd-mode-setup.el"
;;;;;;  "mylisps/settings/t1-bind-key-setup.el" "mylisps/settings/tabbar-setup.el"
;;;;;;  "mylisps/settings/test-setup.el" "mylisps/settings/text-mode-setup.el"
;;;;;;  "mylisps/settings/thumbs-setup.el" "mylisps/settings/timestamp-insert-setup.el"
;;;;;;  "mylisps/settings/toggle-let-astah-setup.el" "mylisps/settings/tramp-setup.el"
;;;;;;  "mylisps/settings/undo-tree-setup.el" "mylisps/settings/uniquify-setup.el"
;;;;;;  "mylisps/settings/usage-memo-setup.el" "mylisps/settings/use-package-setup.el"
;;;;;;  "mylisps/settings/web-mode-setup.el" "mylisps/settings/whitespace-setup.el"
;;;;;;  "mylisps/settings/wid-edit-setup.el" "mylisps/settings/windmove-or-split-setup.el"
;;;;;;  "mylisps/settings/window-setup.el" "mylisps/settings/windows-ahk-mode-setup.el"
;;;;;;  "mylisps/settings/windows-everything-setup.el" "mylisps/settings/windows-face-setup.el"
;;;;;;  "mylisps/settings/windows-setup.el" "mylisps/settings/woman-setup.el"
;;;;;;  "mylisps/settings/x-win-setup.el" "mylisps/settings/xmodmap-mode-setup.el"
;;;;;;  "mylisps/settings/yama-find-binary-setup.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8;; End:
;;; .loaddefs.el ends here
