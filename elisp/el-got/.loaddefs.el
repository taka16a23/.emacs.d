;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "dmacro/dmacro" "dmacro/dmacro.el" (22029 57720
;;;;;;  421050 935000))
;;; Generated autoloads from dmacro/dmacro.el

(autoload 'dmacro-build "dmacro-bld" "\
Interactively build a new dmacro." t nil)

(autoload 'dmacro-save "dmacro-sv" "\
Save all dmacros to FILE." t nil)

(defvar auto-dmacro-alist '(("." . masthead)) "\
*An alist of filename patterns and corresponding dmacro names.  Each
element looks like (REGEXP . DMACRO-SYMBOL) just like auto-mode-alist.
Visiting a new file whose name matches REGEXP causes the dmacro to be
inserted into the buffer.
  This facility is a functional super-duper-set of autoinsert.el.")

(defvar auto-dmacro-case-fold t "\
If non-nil, entries in auto-dmacro-alist [which see] will ignore case.
That is, \"\\\\.h$\" will match \"foo.h\" and \"foo.H\".  Set this to nil
if you want to have seperate entries for filenames that differ only in case.")

(defvar dmacro-prefix-char "~" "\
*The character searched for by dmacro-expand-region when looking for
text to modify.  The value of this variable must be a string containting
a single character.")

(defconst dmacro-month-names '("January" "February" "March" "April" "May" "June" "July" "August" "September" "October" "November" "December") "\
*Used by the macro ~(month). Change these to suit your language or tastes.")

(defvar dmacro-rank-in-initials nil "\
*If non-nil the ~(user-initials) macro will include (Jr, Sr, II, etc...)
when such a rank is present in the user's name.")

(defvar dmacro-prompt t "\
*When this variable is t, Dmacro prompts the user in the minibuffer
when expanding interactive dmacros (i.e. dmacros containing the
~(prompt) function.  If this variable is nil, it won't do anything
with the blanks until the user types the to-be-substituted text in the
buffer and invokes \\[dmacro-fill-in-blanks].
  If this variable is not t and not nil, Dmacro will grab the words
immediately preceding point.  So if you forget to type them before
invoking the dmacro, it will blindly use whatever it finds in the
buffer.")

(autoload 'dmacro-load "dmacro/dmacro" "\


\(fn FILENAME)" t nil)

(autoload 'insert-dmacro "dmacro/dmacro" "\
Insert the dmacro NAME.  It prompts for NAME.
When called from Lisp programs, NAME is a string; if NAME is not a valid
dmacro in the current buffer, then NAME itself is inserted.

\(fn NAME)" t nil)

(autoload 'dmacro-wrap-region "dmacro/dmacro" "\
Put the text between point and mark at the point location in DMACRO.
E.g., if the selected text is \"abc\" and the dmacro expands to \"{ <p> }\",
where <p> is the location of the cursor, the result would be \"{ abc }\".
With a prefix argument, put the text at a marker location instead of point.
The marker used is the number of the marker indicated by the prefix argument.
If there aren't that many markers in the dmacro, the first one is used.

\(fn DMACRO MARKER BEG END)" t nil)

(autoload 'dmacro-wrap-line "dmacro/dmacro" "\
Put the text on the current line at the point location in DMACRO.
E.g., if the line contains \"abc\" and the dmacro expands to \"{ <p> }\",
\(where <p> is the location of the cursor), the result would be \"{ abc }\".
With a prefix argument, put the text at a marker location instead of point.
The marker used is the number of the marker indicated by the prefix argument.
If there aren't that many markers in the dmacro, the first one is used.

\(fn DMACRO MARKER)" t nil)

;;;***

;;;### (autoloads nil "python-pep8/python-pep8" "python-pep8/python-pep8.el"
;;;;;;  (22029 58045 84043 149000))
;;; Generated autoloads from python-pep8/python-pep8.el

(autoload 'python-pep8 "python-pep8/python-pep8" "\
Run PEP8, and collect output in a buffer.
While pep8 runs asynchronously, you can use \\[next-error] (M-x next-error),
or \\<python-pep8-mode-map>\\[compile-goto-error] in the grep output buffer, to go to the lines where pep8 found matches.

\(fn)" t nil)

(defalias 'pep8 'python-pep8)

;;;***



;;;### (autoloads nil "smart-operator/smart-operator" "smart-operator/smart-operator.el"
;;;;;;  (22032 13745 113888 8000))
;;; Generated autoloads from smart-operator/smart-operator.el

(autoload 'smart-operator-mode "smart-operator/smart-operator" "\
Insert operators with surrounding spaces smartly.

\(fn &optional ARG)" t nil)

(autoload 'smart-operator-mode-on "smart-operator/smart-operator" "\
Turn on `smart-operator-mode'.

\(fn)" nil nil)

(autoload 'smart-operator-self-insert-command "smart-operator/smart-operator" "\
Insert the entered operator plus surrounding spaces.

\(fn ARG)" t nil)

;;;***



(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
