;;; __python__.el --- python mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/09/28 04:25:07 (+0900)
;; Last-Updated: 2015/10/06 12:56:41 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This file is part of Emacs.
;;
;; This file is free software: you can redistribute it and/or modify it under
;; the terms of the GNU General Public License as published by the Free
;; Software Foundation, either version 3 of the License, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful, but WITHOUT
;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
;; FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
;; more details.
;;
;; You should have received a copy of the GNU General Public License along
;; with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;; Features that might be required by this library:
;;
;;   Required feature `__python__' was not provided.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;; 2014/03/08    Atami
;;    Modified: `py:-:' insert ',' when in curly brackets.
;;
;; 2014/02/25    Atami
;;    Added: `py:in-parameter-p' predicate in parameters
;;
;;
;;; Code:


(eval-when-compile
  (require 'cl)
  (require 'rx))

(require 'syntax nil 'noerror)

;;;; REGEXP ;;;;
;;;; specific
(defconst py:word-operators '("is" "not" "or" "and" "in") "List of word operators.")

(defconst py:operator-re
  (rx (or "+" "-" "/" "&" "^" "~" "|" "*" "<" ">" "=" "%" "**" "//" "<<"
          ">>" "<=" "!=" "==" ">=" "is" "not" "or" "and" "in"))
  "Regexp for match operator.")

(defconst py:simple-operator-re
  (rx (any "+" "-" "/" "&" "^" "~" "|" "*" "<" ">"
           "=" "%" "**" "//" "<<" ">>" "<=" "!=" "==" ">="))
  "Regexp for match simple operator.")

(defconst py:not-simple-operator-re
  (rx (not (any ?+ ?- ?/ ?& ?^ ?~ ?| ?* ?< ?> ?= ?%)))
  "Regexp for match not simple operator regexp.")

(defconst py:assignment-operator-re
  (rx (or "=" "+=" "-=" "*=" "/=" "//=" "%=" "**=" ">>=" "<<=" "&=" "^=" "|="))
  "Regexp for match assignment operator.")

(defconst py:left-assignment-re
  (rx symbol-start (group (any "_" lower upper) (* (any "_" "." lower upper)))
      symbol-end (* blank) (or "=" "+=" "-=" "*=" "/=" "//=" "%=" "**="
                               ">>=" "<<=" "&=" "^=" "|="))
  "Regexp for match left assignment.")

(defconst py:open-paren-re
  (rx (or "{" "[" "("))
  "Regexp for match open parentheses.")

(defconst py:close-paren-re
  (rx (or "}" "]" ")"))
  "Regexp for match close parentheses.")

;; from python.el
(defconst py:decorator-re
  (rx line-start (* (any " \t")) (group "@" (1+ (or word ?_))
                                        (0+ "." (1+ (or word ?_)))))
  "Regexp for match decorator.")

;;;; Header Regexp
;;
(defconst py:shebang-re
  (rx "#!" (? blank) (group (+ (not-char "\t" "\n" " "))) (* blank)
      (group (+ (any "b" "i" "p" "t" "j")) "ython"
             (* (not-char " " "\t" "\n"))))
  "Regexp for match string of python shebang.
Like this `#!/usr/bin/env python'")

(defconst py:encoding-string-re
  (rx line-start (* blank) "#" (* blank) "-*-" (* blank) "coding:"
      (+ not-newline) "-*-")
  "Regexp for match string of encoding string.
Like this `# -*- coding: utf-8 -*-'")


;;;; Footer Regexp
;;
(defconst py:if-name-main-re
  (rx line-start "if" (+ space) "__name__" (+ space) "==" (+ space)
      (any ?' ?\") "__main__" (any ?' ?\") (* space) ?:)
  "Regexp for match string of main program execute.
Like this `if name == __main__:'")


;;;; Blank or Comment Regexp
;;
(defconst py:blank-line-re
  (rx line-start (* blank) line-end)
  "Regexp for match empty line.") ;alternative "\\s-*$"

(defconst py:blank|comment-re
  (rx (* blank) (group (or line-end ?#)))
  "Regexp for match blank or comment.")


;;;; Document Regexp
;;
(defconst py:delimiter-re
  (rx (and
       ;; Match even number of backslashes.
       (or (not (any ?\\ ?\' ?\")) point
           ;; Quotes might be preceded by a escaped quote.
           (and (or (not (any ?\\)) point) ?\\
                (* ?\\ ?\\) (any ?\' ?\")))
       (* ?\\ ?\\)
       ;; Match single or triple quotes of any kind.
       (group (or  "\"" "\"\"\"" "'" "'''"))))
  "Regexp for match delimiter regexp.")

(defconst py:single3-file-doc-re
  (rx line-start (? (any "B" "U" "b" "u")) (? (any "R" "r")) "'''" (? "\\")
      (* (not-char "'")) "'''")
  "Regexp for match single3 document as file __doc__
Like this ''' this is document. '''")

(defconst py:double3-file-doc-re
  (rx line-start (? (any "B" "U" "b" "u")) (? (any "R" "r")) "\"\"\"" (? "\\")
      (* (not-char "\"")) "\"\"\"")
  "Regexp for match double3 document as file __doc__.
Like this \"\"\" this is document. \"\"\"")

(defconst py:filedoc-re
  (macroexpand `(rx (or (regexp ,py:single3-file-doc-re)
                        (regexp ,py:double3-file-doc-re))))
  "Regexp for match document strings as file __doc__.
Single3 or Double3 documment.")

;; TODO: (Atami) [2013/10/01]
;; rename more better name
(defconst py:single3doc-class|def-re
  (rx line-start (+ blank) (? (any "B" "U" "b" "u"))
      (? (any "R" "r")) (group "'''" (? "\\") (* (not-char "'"))
                               (* blank) "'''") (* blank) line-end)
  "Regexp for match single3 class or def document.
Like this \"\"\" this is document. \"\"\"")

(defconst py:double3doc-class|def-re
  (rx line-start (+ blank) (? (any "B" "U" "b" "u")) (? (any "R" "r"))
      (group "\"\"\"" (? "\\") (* (not-char "\"")) (* blank) "\"\"\"")
      (* blank) line-end)
  "Regexp for match double3 class or def document.
Like this \"\"\" this is document. \"\"\"")

(defconst py:doc-class|def-re
  (rx line-start (+ blank) (? (any "B" "U" "b" "u")) (? (any "R" "r"))
      (group (or (sequence "'''" (? "\\")
                           (* (not-char "'")) (* blank) "'''")
                 (sequence "\"\"\"" (? "\\")
                           (* (not-char "\"")) (* blank) "\"\"\"")))
      (* blank) line-end)
  "Regexp for match class or def document.")

(defconst py:doc-re
  (macroexpand `(rx (group (or (regexp ,py:single3-file-doc-re)
                               (regexp ,py:double3-file-doc-re)
                               (regexp ,py:single3doc-class|def-re)
                               (regexp ,py:double3doc-class|def-re)))))
  "Regexp for match document.")

;;;; import Regexp
;;
(defconst py:import-re
  (rx symbol-start "import" symbol-end)
  "Regexp for match import causes.")

(defconst py:from-re
  (rx symbol-start "from" symbol-end)
  "Regexp for match from causes.")

(defconst py:from|import-re
  (rx symbol-start (or "import" "from") symbol-end)
  "Regexp for match from or import causes.")

(defconst py:import-line-re
  (rx line-start (* blank) symbol-start (group (or "import" "from"))
      symbol-end (* not-newline))
  "Regexp for match import or from line.")


;;;; Block Regexp
;;
(defconst py:block-re
  (rx (* blank) symbol-start
      (group (or "class" "def" "for" "if" "try" "while" "with"))
      symbol-end (any ":" " " "\n" "\t"))
  "Regexp for match beginning block.")

(defconst py:block-start-re
  (rx symbol-start (group
                    (or "def" "class" "if" "elif" "else" "try"
                        "except" "finally" "for" "while" "with")) symbol-end)
  "Regexp for match start blocks.")

(defconst py:block-closing-keywords-re
  (rx (* blank) symbol-start
      (group (or "return" "raise" "break" "continue" "pass")) symbol-end
      (char "/n" "\t" " "))
  "Regexp for match block closing keyword.")

(defconst py:minor-block-re
  (rx (* blank) symbol-start (group (or "for" "if" "try" "with"))
      symbol-end (any ":" " " "\n" "\t"))
  "Regexp for match beginning of an `for', `if', `try' or `with' block.")

(defconst py:def|clause-re
  (rx (* blank) symbol-start
      (group (or "def" "class" "if" "else" "elif" "while"
                 "for" "try" "except" "finally" "with"))
      symbol-end (any ":" " " "\n" "\t"))
  "Regexp for match beginning of a compound statement.")

(defconst py:class-re
  (rx (* blank) symbol-start (group "class") symbol-end (any " " "\n" "\t"))
  "Regexp for match beginning of a class definition.")

(defconst py:def-re
  (rx (* blank) symbol-start (group "def") symbol-end (any " " "\n" "\t"))
  "Regexp for match beginning of a def.")

(defconst py:class|def-re
  (rx (* blank) symbol-start (group (or "class" "def")) symbol-end
      (any " " "\n" "\t"))
  "Regexp for match beginning of a def or class.")

(defun py:make-class-name--re (name)
  "NAME"
  (macroexpand `(rx symbol-start "class" (1+ space)
                    symbol-start (group ,name) symbol-end)))

(defun py:make-def-name--re (name)
  "NAME"
  (macroexpand `(rx symbol-start "def" (1+ space)
                    symbol-start (group ,name) symbol-end)))

;; from python.el
(defconst py:class-name-re
  (rx symbol-start "class" (1+ space) (group (1+ (or word ?_))))
  "Regexp for match class name.")

;; from python.el
(defconst py:def-name-re
  (rx symbol-start "def" (1+ space) (group (1+ (or word ?_))))
  "Regexp for match def name.")

(defconst py:class-param-start-re
  (rx symbol-start "class" (1+ space) (1+ (or word ?_)) (* blank) ?\()
  "Regexp for match class start paramerter.")

(defconst py:def-param-start-re
  (rx symbol-start "def" (1+ space) (1+ (or word ?_)) (* blank) ?\()
  "Regexp for match def start paramerter.")

(defconst py:class|def-name-re
  (rx symbol-start (or "def" "class") (1+ space) (group (1+ (or word ?_))))
  "Regexp for match def or class name.")

;;;; minor nest block
;;
(defconst py:while-re
  (rx (* blank) symbol-start (group "while" symbol-end (* blank)))
  "Regexp for matches the beginning of a compound statement saying `while'.")

(defconst py:for-re
  (rx (* blank) symbol-start (group "for") symbol-end (* blank))
  "Regexp for matches the beginning of a compound statement saying `for'.")

(defconst py:if-re
  (rx (* blank) symbol-start (group "if") symbol-end (any " " "\n" "\t"))
  "Regexp for matches the beginning of a compound statement saying `if'.")

(defconst py:elif-re
  (rx (* blank) symbol-start (group "elif") symbol-end (* blank))
  "Regexp for matches the beginning of a compound statement saying `elif'.")

(defconst py:try-re
  (rx (* blank) symbol-start (group "try") symbol-end (any ":" " " "\n" "\t"))
  "Regexp for match the beginning of a compound statement saying `try'." )

(defconst py:with-re
  (rx (* blank) symbol-start (group "with") symbol-end (* blank))
  "Regexp for matches the beginning of a compound statement saying `with'.")

;;;; Clause Regexp
;;
(defmacro py:make-closing--re (keyword)
  "Internal use Define const regexp for closing keywords .
KEYWORD: closing keyword"
  `(rx (* blank) symbol-start (group ,keyword) symbol-end
       (char " " ":" "\t" "\n")))

(defconst py:finally-re
  (py:make-closing--re "finally")
  "Regexp for match finally keyword.")

(defconst py:except-re
  (py:make-closing--re "except")
  "Regexp for match except keyword.")

(defconst py:else-re
  (py:make-closing--re "else")
  "Regexp for match keyword.")

(defconst py:return-re
  (rx (* not-newline) (? ":") (* blank) symbol-start (group "return")
      symbol-end (char " " "\t" "\n"))
  "Regexp for match return keyword.")

(defconst py:yield-re
  (rx (* not-newline) (? ":") (* blank) symbol-start (group "yield") symbol-end
      (char " " "\t" "\n"))
  "Regexp for match yield keyword.")

(defconst py:if-clause-re
  (rx (* blank) symbol-start (group (or "else" "elif"))
      symbol-end (any ":" "\n" " " "\t"))
  "Regexp for match the beginning of a compound statement's clause.")

(defconst py:try-clause-re
  (rx (* blank) symbol-start (group (or "else" "elif" "except" "finally"))
      symbol-end (any ":" "\n" " " "\t"))
  "Regexp for match the beginning of a compound statement's clause.")

(defconst py:no-outdent-re "\\(try:\\|except\\(\\s +.*\\)?:\\|while\\s +.*:\\|for\\s +.*:\\|if\\s +.*:\\|elif\\s +.*:\\)\\([ 	]*\\_<\\(return\\|raise\\|break\\|continue\\|pass\\)\\_>[ 	\n]\\)"
  "Python outdent regexp.")

;;;; other
;;
(defconst py:__all__-re "\\_<__all__\\_>[[:blank:]]*=[[:blank:]]*\\s("
  "Python __all__ statement regexp.")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; at predicate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defsubst py:at-blank-line-p ()
  "Return non-nil, if current line is blank."
  (save-excursion
    (beginning-of-line)
    (looking-at "\\s-*$")))

(defsubst py:at-string|comment-p ()
  "Return non-nil, if point is in a Python literal (a comment or string)."
  (nth 8 (syntax-ppss)))

(defsubst py:at-beginning-of-class-p ()
  "Return non-nil, if point at beginning of class."
  (looking-at py:class-re))

(defsubst py:at-beginning-of-def-p ()
  "Return non-nil, if point at beginning of def."
  (looking-at py:def-re))

(defsubst py:at-beginning-of-if-p ()
  "Return non-nil, if point at beginning of if."
  (looking-at py:if-re))

(defsubst py:at-beginning-of-elif-p ()
  "Return non-nil, if point at beginning of elif."
  (looking-at py:elif-re))

(defsubst py:at-beginning-of-if-clause-p ()
  "Return non-nil, if point at beginning of if clause."
  (looking-at py:if-clause-re))

(defsubst py:at-beginning-of-try-p ()
  "Return non-nil, if point at beginning of try."
  (looking-at py:try-re))

(defsubst py:at-beginning-of-else-p ()
  "Return non-nil, if point at beginning of else."
  (looking-at py:else-re))

(defsubst py:at-beginning-of-except-p ()
  "Return non-nil, if point at beginning of except."
  (looking-at py:except-re))

(defsubst py:at-beginning-of-finally-p ()
  "Return non-nil, if point at beginning of finally."
  (looking-at py:finally-re))

(defsubst py:at-beginning-of-try-clause-p ()
  "Return non-nil, if point at beginning of try clause."
  (looking-at py:try-clause-re))

(defsubst py:at-beginning-of-for-p ()
  "Return non-nil, if point at beginning of for."
  (looking-at py:for-re))

(defsubst py:at-beginning-of-with-p ()
  "Return non-nil, if point at beginning of with."
  (looking-at py:with-re))

(defsubst py:at-beginning-of-while-p ()
  (looking-at py:while-re))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; at tail predicate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:at-tail--predicate (regexp &optional minor-iftry)
  "Internal function that predicate at tail.
REGEXP: regular expression"
  (save-excursion
    (let ((orig (point)))
      (and (py:forward-beginning--base regexp 'prev)
           (py:from-beg-to-end-block--internal nil minor-iftry)
           (eq orig (point))))))

(defun py:at-tail-of-class-p ()
  "Return non-nil, if point at tail of class."
  (py:at-tail--predicate py:class-re))

(defun py:at-tail-of-def-p ()
  "Return non-nil, if point at tail of def."
  (py:at-tail--predicate py:def-re))

(defun py:at-tail-of-if-p ()
  "Return non-nil, if point at tail of if."
  (py:at-tail--predicate py:if-re))

(defun py:at-tail-of-if-block-p ()
  "Return non-nil, if point at tail of if block."
  (py:at-tail--predicate py:if-re 'minor-iftry))

(defun py:at-tail-of-if-clause-p ()
  "Return non-nil, if point at tail of if clause."
  (py:at-tail--predicate py:if-clause-re))

(defun py:at-tail-of-elif-p ()
  "Return non-nil, if point at tail of elif."
  (py:at-tail--predicate py:elif-re))

(defun py:at-tail-of-try-p ()
  "Return non-nil, if point at tail of try."
  (py:at-tail--predicate py:try-re))

(defun py:at-tail-of-try-block-p ()
  "Return non-nil, if point at tail of try block."
  (py:at-tail--predicate py:try-re 'minor-iftry))

(defun py:at-tail-of-try-clause-p ()
  "Return non-nil, if point at tail of try clause."
  (py:at-tail--predicate py:try-clause-re))

(defun py:at-tail-of-else-p ()
  "Return non-nil, if point at tail of else."
  (py:at-tail--predicate py:else-re))

(defun py:at-tail-of-except-p ()
  "Return non-nil, if point at tail of except."
  (py:at-tail--predicate py:except-re))

(defun py:at-tail-of-finally-p ()
  "Return non-nil, if point at tail of finally."
  (py:at-tail--predicate py:finally-re))

(defun py:at-tail-of-for-p ()
  "Return non-nil, if point at tail of for."
  (py:at-tail--predicate py:for-re))

(defun py:at-tail-of-with-p ()
  "Return non-nil, if point at tail of with."
  (py:at-tail--predicate py:with-re))

(defun py:at-tail-of-while-p ()
  ""
  (py:at-tail--predicate py:while-re))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; in predicate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:in-block--predicate (regexp &optional with-tail minor-iftry)
  "Internal function that predicate in block.
REGEXP: regular expression
WITH-TAIL: include tail of blank if non-nil."
  (save-excursion
    (let ((orig (point))
          (beg (progn (end-of-line) ;skip target word
                      (py:forward-beginning--internal regexp -1)))
          (end (py:from-beg-to-end-block--internal with-tail minor-iftry)))
      (ignore-errors
        (and (< beg orig)
             (< orig end))))))

(defun py:in-class-p (&optional with-tail)
  "Return non-nil, if point in class block.
WITH-TAIL: If non-nil, include tail of blank."
  (py:in-block--predicate py:class-re with-tail))

(defun py:in-def-p (&optional with-tail)
  "Return non-nil, if point in def block.
WITH-TAIL: If non-nil, include tail of blank."
  (py:in-block--predicate py:def-re with-tail))

(defun py:in-method-p (&optional with-tail)
  "Return non-nil, if point in method block.
WITH-TAIL: If non-nil, include tail of blank."
  (and (py:in-block--predicate py:class-re)
       (py:in-block--predicate py:def-re with-tail)))

(defun py:in-if-p (&optional with-tail)
  "Return non-nil, if point in if block.
WITH-TAIL: If non-nil, include tail of blank."
  (py:in-block--predicate py:if-re with-tail))

(defun py:in-elif-p (&optional with-tail)
  "Return non-nil, if point in elif block.
WITH-TAIL: If non-nil, include tail of blank."
  (py:in-block--predicate py:elif-re with-tail))

(defun py:in-if-block-p (&optional with-tail)
  "Return non-nil, if point in if block.
WITH-TAIL: If non-nil, include tail of blank."
  (py:in-block--predicate py:if-re with-tail 'minor-iftry))

(defun py:in-try-p (&optional with-tail)
  "Return non-nil, if point in try block.
WITH-TAIL: If non-nil, include tail of blank."
  (py:in-block--predicate py:try-re with-tail))

(defun py:in-try-clause-p (&optional with-tail)
  "Return non-nil, if point in try clause block.
WITH-TAIL: If non-nil, include tail of blank."
  (py:in-block--predicate py:try-clause-re with-tail))

(defun py:in-else-p (&optional with-tail)
  "Return non-nil, if point in else block.
WITH-TAIL: If non-nil, include tail of blank."
  (py:in-block--predicate py:else-re with-tail))

(defun py:in-except-p (&optional with-tail)
  "Return non-nil, if point in except block.
WITH-TAIL: If non-nil, include tail of blank."
  (py:in-block--predicate py:except-re with-tail))

(defun py:in-finally-p (&optional with-tail)
  "Return non-nil, if point in finally block.
WITH-TAIL: If non-nil, include tail of blank."
  (py:in-block--predicate py:finally-re with-tail))

(defun py:in-try-block-p (&optional with-tail)
  "Return non-nil, if point in try block.
WITH-TAIL: If non-nil, include tail of blank."
  (py:in-block--predicate py:try-re with-tail 'minor-iftry))

(defun py:in-while-p (&optional with-tail)
  "WITH-TAIL"
  (py:in-block--predicate py:while-re with-tail))

(defun py:in--brackets (&optional left right contract)
  "Internal function that return non-nil if predicate in brackets.
If LEFT and RIGHT is nil, predicate any brackets.
LEFT: open paren like these (, [, {
RIGHT: close paren like these ), ], }
CONTRACT: If non-nil, contract to region internal paren."
  (let ((orig (point))
        (region (py:region-brackets left right contract)))
    (and region
         (< (car region) orig)
         (< orig (cdr region)))))

(defun py:in-brackets-p (&optional contract)
  "Return non-nil, if point in any brackets.
CONTRACT: If non-nil, contract to region internal paren."
  (py:in--brackets nil nil contract))

(defun py:in-round-p (&optional contract)
  "Return non-nil, if point in round brackets.
CONTRACT: If non-nil, contract to region internal paren."
  (py:in--brackets "(" ")" contract))

(defun py:in-square-p (&optional contract)
  "Return non-nil, if point in square brackets.
CONTRACT: If non-nil, contract to region internal paren."
  (py:in--brackets "\\[" "\\]" contract))

(defun py:in-curly-p (&optional contract)
  "Return non-nil, if point in curly brackets.
CONTRACT: If non-nil, contract to region internal paren."
  (py:in--brackets "{" "}" contract))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; exists
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:exists-in-buffer--predicate (regexp)
  "Internal function that predicate exists in buffer.
REGEXP: regular expressions"
  (save-excursion
      (goto-char (point-min))
      (let ((done nil))
        (while (and (not done) (not (eobp)))
          (and (re-search-forward regexp nil 'noerror)
               (not (py:at-string|comment-p))
               (setq done t)))
        done)))

;; TODO: (Atami) [2013/10/04]
;; dufun => defsubst
(defun py:exists-class-p ()
  "Return non-nil if class exists in buffer."
  (py:exists-in-buffer--predicate py:class-re))

(defun py:exists-def-p ()
  "Return non-nil if def exists in buffer."
  (py:exists-in-buffer--predicate py:def-re))

(defun py:exists-imports ()
  "Return non-nil if imports exists in buffer."
  )

(defun py:exists-ifmain-p ()
  "Return non-nil if 'if name == __main__:' exists in buffer."
  (py:exists-in-buffer--predicate py:if-name-main-re))

;;;;; next
(defun py:exists-next--predicate (regexp)
  "Internal function that predicate next.
REGEXP: regular expressions"
  (save-excursion
    (when (looking-at regexp) (forward-line 1))
    (let ((done nil))
        (while (and (not done) (not (eobp)))
          (and (re-search-forward regexp nil 'noerror)
               (not (py:at-string|comment-p))
               (setq done t)))
        done)))

;; TODO: (Atami) [2013/10/04]
;; dufun => defsubst
(defun py:exists-next-class-p ()
  "Return non-nil if exists next class from current point."
  (py:exists-next--predicate py:class-re))

;; TODO: (Atami) [2013/10/04]
;; dufun => defsubst
(defun py:exists-next-def-p ()
  "Return non-nil if exists next def from current point."
  (py:exists-next--predicate py:def-re))

(defun py:exists-next-if-p ()
  "Return non-nil if exists next if block from current point."
  (py:exists-next--predicate py:if-re))

(defun py:exists-next-elif-p ()
  "Return non-nil if exists next elif from current point."
  (py:exists-next--predicate py:elif-re))

(defun py:exists-next-try-p ()
  "Return non-nil if exists next try from current point."
  (py:exists-next--predicate py:try-re))

(defun py:exists-next-else-p ()
  "Return non-nil if exists next else from current point."
  (py:exists-next--predicate py:else-re))

(defun py:exists-next-except-p ()
  "Return non-nil if exists next except from current point."
  (py:exists-next--predicate py:except-re))

(defun py:exists-next-finally-p ()
  "Return non-nil if exists next finally from current point."
  (py:exists-next--predicate py:finally-re))

(defun py:exists-next-try-clause-p ()
  "Return non-nil if exists next try clause from current point."
  (py:exists-next--predicate py:try-clause-re))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; exists-prev
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:exists-prev--predicate (regexp)
  "Internal function that predicate previous.
REGEXP: regular expressions"
  (save-excursion
    (if (py:in-block--predicate regexp 'with-tail)
        ;; 2 times call and return boolean
        (and (py:forward-beginning--base regexp 'prev)
             (py:forward-beginning--base regexp 'prev))
      (when (py:forward-beginning--base regexp 'prev)
        t))))

(defun py:exists-prev-class-p ()
  "Return non-nil if exists previous class from current point."
  (py:exists-prev--predicate py:class-re))

(defun py:exists-prev-def-p ()
  "Return non-nil if exists previous def from current point."
  (py:exists-prev--predicate py:def-re))

(defun py:exists-prev-if-p ()
  "Return non-nil if exists previous if from current point."
  (py:exists-prev--predicate py:if-re))

(defun py:exists-prev-elif-p ()
  "Return non-nil if exists previous elif from current point."
  (py:exists-prev--predicate py:elif-re))

(defun py:exists-prev-try-p ()
  "Return non-nil if exists previous try from current point."
  (py:exists-prev--predicate py:try-re))

(defun py:exists-prev-else-p ()
  "Return non-nil if exists previous else from current point."
  (py:exists-prev--predicate py:try-re))

(defun py:exists-prev-except-p ()
  "Return non-nil if exists previous except from current point."
  (py:exists-prev--predicate py:except-re))

(defun py:exists-prev-finally-p ()
  "Return non-nil if exists previous finally from current point."
  (py:exists-prev--predicate py:finally-re))

(defun py:exists-prev-try-clause-p ()
  "Return non-nil if exists previous try clause from current point."
  (py:exists-prev--predicate py:try-clause-re))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; has
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:has-doc-in-class-p (&optional names)
  "Return non-nil if class block has document strings.
NAMES: class names"
  (save-excursion
    (save-restriction
      (and (py:narrow-to-class names)
           (goto-char (point-min))
           (re-search-forward py:doc-class|def-re nil 'noerror)
           (not (py:in-def-p))))))

(defun py:has-doc-in-def-p (&optional names)
  "Return non-nil if def block has document string.
NAMES: def names"
  (save-excursion
    (save-restriction
      (and (py:narrow-to-def names)
           (goto-char (point-min))
           (re-search-forward py:doc-class|def-re nil 'noerror)))))

(defsubst py:what-face-at ()
  (get-char-property (point) 'face))

;;;; beginning
(defun py:forward-beginning--internal (regexp n)
  "N"
  (or (integerp n) (error "N must be integer"))
  (let ((action (if (< 0 n)
                    'next
                  (setq n (- n))
                  'prev))
        point)
    ;; main
    (while (and (not (zerop n))
                (setq point (py:forward-beginning--base regexp action)))
      (decf n))
    point))

(defun py:forward-beginning--base (regexp &optional action orig)
  ""
  (let ((orig (or orig (point)))
        (re-search-fnc (cond ((eq action 'prev)
                              ;; fix point for move prev
                              (and (not (looking-at regexp))
                                   (end-of-line))
                              #'re-search-backward)
                             (t
                              ;; fix point for move next
                              (and (looking-at regexp)
                                   (goto-char (match-end 0)))
                              #'re-search-forward)))
        matched)
    (if (funcall re-search-fnc regexp nil 'noerror)
        (progn
          (setq matched (match-beginning 1))
          (if (or (py:at-string|comment-p)
                  (py:in-brackets-p 'contract))
              ;; recursive call
              (py:forward-beginning--base regexp action orig)
            (goto-char matched)))
      ;; beginning or end class in buffer
      (goto-char orig)
      nil)))

(defun py:from-beg-to-end-block--internal (&optional with-tail minor-iftry)
  "WITH-TAIL"
  (let ((indent (current-indentation))
        (regexp (cond ((not minor-iftry) nil)
                      ((looking-at py:try-re) py:try-clause-re)
                      ((looking-at py:if-re) py:if-clause-re)
                      (t nil))))
    (forward-line 1)
    (while (and (not (eobp))
                (or (< indent (current-indentation))
                    (py:at-blank-line-p)
                    (progn (skip-chars-forward (rx (or blank ?#)))
                           (or (py:at-string|comment-p)
                               (and (eq indent (current-indentation))
                                    (and regexp
                                         (looking-at regexp)))))))
      (forward-line 1))
    (if with-tail
        (progn (skip-chars-backward " \t")
               (looking-at "^")
               (forward-char -1))
      (while (or (not (eq (skip-chars-backward " \t\n") 0))
                 ;;skip backward str or comment and calc point
                 (not (eq (let ((orig (point)))
                            (py:skip-back-string|comment)
                            (- (point) orig)) 0)))))
    (point)))

(defun py:end-of-next--internal (regexp &optional with-tail minor-iftry)
  ""
  (cond ((and (looking-at regexp)
              (not (py:at-string|comment-p)))
         (py:from-beg-to-end-block--internal with-tail minor-iftry))
        ;; beginning of regexp and calc end if in block
        ((py:in-block--predicate regexp nil minor-iftry)
         (py:forward-beginning--internal regexp -1)
         (py:from-beg-to-end-block--internal with-tail minor-iftry))
        ;; beginning of next regexp and calc end if not in block
        ((py:exists-next--predicate regexp)
         (py:forward-beginning--internal regexp 1)
         (py:from-beg-to-end-block--internal with-tail minor-iftry))
        ;; not exists next will return nil
        (t nil)))

(defun py:end-of-prev--internal (regexp &optional with-tail minor-iftry)
  ""
  (let ((orig (point)))
    (cond (;; in class or at tail
           (and (or (py:in-block--predicate regexp nil)
                    (py:at-tail--predicate regexp))
                (py:exists-prev--predicate regexp))
           (py:forward-beginning--internal regexp -2)
           (py:from-beg-to-end-block--internal with-tail minor-iftry))
          ;; not in class
          ((and (not (py:in-block--predicate regexp nil))
                (save-excursion
                  (py:forward-beginning--base regexp 'prev)))
           (py:forward-beginning--base regexp 'prev)
           (py:from-beg-to-end-block--internal with-tail minor-iftry)))
    (if (eq orig (point))
        nil
      (point))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; forward-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:forward-end--internal (regexp n &optional with-tail minor-iftry)
  "N"
  (interactive "p")
  (or (integerp n) (error "N must be integer"))
  (let* ((action (if (< 0 n)
                     #'py:end-of-next--internal
                   (setq n (- n))
                   #'py:end-of-prev--internal))
         point)
    ;; main
    (while (and (not (zerop n))
                (setq point (funcall action regexp with-tail minor-iftry)))
      (decf n))
    point))

(defun py:forward-class|def (n)
  "N"
  (interactive "p")
  (py:forward-beginning--internal py:class|def-re n))

(defun py:forward-class (n)
  "N"
  (interactive "p")
  (py:forward-beginning--internal py:class-re n))

(defun py:forward-method (n)
  "N"
  (interactive "p")
  (let ((orig (point)))
    (save-restriction
      (py:narrow-to-class nil 'indent 'with-tail)
      (py:forward-def n))
    (if (looking-at py:def-re)
        (point)
      (goto-char orig)
      nil)))

(defun py:forward-def (n)
  "N"
  (interactive "p")
  (py:forward-beginning--internal py:def-re n))

(defun py:forward-block-start (n)
  "N"
  (interactive "p")
  (py:forward-beginning--internal py:block-start-re n))

(defun py:forward-if (n)
  ""
  (interactive "p")
  (py:forward-beginning--internal py:if-re n))

(defun py:forward-elif (n)
  ""
  (interactive "p")
  (py:forward-beginning--internal py:elif-re n))

(defun py:forward-try (n)
  "N"
  (interactive "p")
  (py:forward-beginning--internal py:try-re n))

(defun py:forward-try-clause (n)
  ""
  (interactive "p")
  (py:forward-beginning--internal py:try-clause-re n))

(defun py:forward-else (n)
  ""
  (interactive "p")
  (py:forward-beginning--internal py:else-re n))

(defun py:forward-except (n)
  ""
  (interactive "p")
  (py:forward-beginning--internal py:except-re n))

(defun py:forward-finally (n)
  ""
  (interactive "p")
  (py:forward-beginning--internal py:finally-re n))

(defun py:forward-while (n)
  "N"
  (interactive "p")
  (py:forward-beginning--internal py:while-re n))

(defun py:forward-colon-delimiter (n)
  "N"
  (interactive "p")
  (or n (setq n 1))
  (or (integerp n) (error "N must be integer"))
  (let* ((action (if (< 0 n)
                     'next
                   (setq n (- n))
                   'prev))
         point)
    ;; main
    (while (and (not (zerop n))
                (setq point (py:colon-delimiter-next/prev--internal action)))
      (decf n))
    point))

(defun py:forward-list (n &optional left right)
  "Move point N list forward in brackets (backward if N is negative).
N: integer as positive or negative and not acceptable 0
If LEFT and RIGHT is nil, move point in current paren.
LEFT: left operand like these (, [, {
RIGHT: right operand like these ), ], } "
  (interactive "p")
  (and (zerop n) (error "Value Error 0"))
  (save-restriction
    (when (py:narrow--internal (py:region-brackets left right 'contract))
      (let ((orig (point))
            (re-search-func (if (< 0 n)
                                #'re-search-forward
                              (setq n (- n))
                              #'re-search-backward)))
        (while (and (not (zerop n))
                    (funcall re-search-func "," nil 'noerroe))
          (or (py:at-string|comment-p)
              (py:in-brackets-p)
              (decf n)))
        ;; for return
        (and (not (eq orig (point)))
             (point))))))

(defun py:forward-round-list (n)
  "Move point N list forward in round brackets (backward if N is negative)
N: integer as positive or negative and not acceptable 0"
  (interactive "p")
  (py:forward-list n "(" ")"))

(defun py:forward-square-list (n)
  "Move point N list forward in square brackets (backward if N is negative)
N: integer as positive or negative and not acceptable 0"
  (interactive "p")
  (py:forward-list n "\\[" "\\]"))

(defun py:forward-curly-list (n)
  "Move point N list forward in curly brackets (backward if N is negative)
N: integer as positive or negative and not acceptable 0"
  (interactive "p")
  (py:forward-list n "{" "}"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; backward-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:backward-method (n)
  "N"
  (interactive "p")
  (py:forward-method (- n)))

(defun py:backward-list (n)
  "Move point N list backward in brackets (forward if N is negative)
N: integer as positive or negative and not acceptable 0"
  (interactive "p")
  (py:forward-list (- n)))

(defun py:backward-round-list (n)
  "Move point N list backward in round brackets (forward if N is negative)
N: integer as positive or negative and not acceptable 0"
  (interactive "p")
  (py:forward-round-list (- n)))

(defun py:backward-square-list (n)
  "Move point N list backward in square brackets (forward if N is negative)
N: integer as positive or negative and not acceptable 0"
  (interactive "p")
  (py:forward-square-list (- n)))

(defun py:backward-curly-list (n)
  "Move point N list backward in curly brackets (forward if N is negative)
N: integer as positive or negative and not acceptable 0"
  (interactive "p")
  (py:forward-curly-list (- n)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; beginning-of-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:beginning-import-statement (&optional bound)
  ""
  (save-restriction
    (narrow-to-region (py:goto-start-coding-point) (or (py:goto-first-class|def)
                                                       (point-max)))
    (goto-char (point-min))
    (let ((bound (or bound (min (save-excursion
                                  (forward-line 100) (point))
                                (or (save-excursion
                                      (py:forward-class|def 1))
                                    (point-max)))))
          start)
      (while (and (setq start (re-search-forward py:import-line-re bound 'noerror))
                  (py:at-string|comment-p)))
      (if (not (eq start nil))
          (goto-char (match-beginning 0))
        ;; no exists import statement
        ;; FIXME: (Atami) [2013/10/10]
        ;; save-excursion
        (or (and (py:end-of-filedoc) (forward-line 1) (point))
            (and (py:forward-class|def 1)
                 (skip-chars-backward " \t\n") (forward-line 1) (point))
            (py:goto-start-coding-point))))))

(defun py:beginning-of-filedoc ()
  ""
  (let ((region (py:region-doc-file)))
    (when (not (eq region nil))
      (goto-char (car region)))))

(defun py:beginning-of-class|def (n)
  "N"
  (interactive "p")
  (py:forward-class|def (- n)))

(defun py:beginning-of-class (n)
  "Move N classes forward (backward if N is negative)."
  (interactive "p")
  (py:forward-class (- n)))

(defun py:beginning-of-def (n)
  "N"
  (interactive "p")
  (py:forward-def (- n)))

(defun py:beginning-of-next-class|def (n)
  "N"
  (interactive "p")
  (py:forward-class|def n))

(defun py:beginning-of-next-class (n)
  "N"
  (interactive "p")
  (py:forward-class n))

(defun py:beginning-of-next-def (n)
  "N"
  (interactive "p")
  (py:forward-def n))

(defun py:beginning-of-if (n)
  "N"
  (interactive "p")
  (py:forward-if (- n)))

(defun py:beginning-of-elif (n)
  "N"
  (interactive "p")
  (py:forward-elif (- n)))

(defun py:beginning-of-try (n)
  "N"
  (interactive "p")
  (py:forward-try (- n)))

(defun py:beginning-of-next-try (n)
  "N"
  (interactive "p")
  (py:forward-try n))

(defun py:beginning-of-else (n)
  "N"
  (interactive "p")
  (py:forward-else (- n)))

(defun py:beginning-of-except (n)
  "N"
  (interactive "p")
  (py:forward-except (- n)))

(defun py:beginning-of-finally (n)
  "N"
  (interactive "p")
  (py:forward-finally (- n)))

(defun py:beginning-of-try-clause (n)
  "N"
  (interactive "p")
  (py:forward-try-clause (- n)))

(defun py:beginning-of-block (n)
  "N"
  (interactive "p")
  (py:forward-block-start (- n)))

(defun py:beginning-of-next-block (n)
  "N"
  (interactive "p")
  (py:forward-block-start n))

(defun py:beginning-of-brackets (&optional left right contract)
  "Move point beginning of pair balanced brackets.
And Return point or nil.
If LEFT and RIGHT is nil, move point beginning of current paren.
LEFT: left operand like these (, [, {
RIGHT: right operand like these ), ], }
CONTRACT: If non-nil, contract to internal paren."
  (let* ((orig (point))
         (round 0)
         (square 0)
         (curly 0)
         (regexp (or (and left right (concat left "\\|" right)) "[]()[{}]"))
         (bound-re "\\_<\\(\\(?:class\\|def\\|return\\|w\\(?:hile\\|ith\\)\\)\\)\\_>")
         (bound (save-excursion ;beginning or end of block or point min
                  (while (and (re-search-backward bound-re nil 'noerror)
                              (py:at-string|comment-p)))
                  (point))))
    (while (and (<= round 0)
                (<= square 0)
                (<= curly 0)
                (re-search-backward regexp bound 'noerror))
      (cond ((py:at-string|comment-p) (py:skip-back-string|comment))
            ((looking-at "(") (incf round))
            ((looking-at ")") (decf round))
            ((looking-at "\\[") (incf square))
            ((looking-at "\\]") (decf square))
            ((looking-at "{") (incf curly))
            ((looking-at "}") (decf curly))))
    (if (eq bound (point))
        (progn (goto-char orig) nil)
      (and contract (forward-char 1))
      (point))))

(defun py:beginning-of-round (&optional contract)
  "Move point beginning of round '(' balanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:beginning-of-brackets "(" ")" contract))

(defun py:beginning-of-square (&optional contract)
  "Move point beginning of square '[' balanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:beginning-of-brackets "\\[" "\\]" contract))

(defun py:beginning-of-curly (&optional contract)
  "Move point beginning of curly '{' balanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:beginning-of-brackets "{" "}" contract))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; end-of-
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:end-of-filedoc ()
  ""
  (let ((region (py:region-doc-file)))
    (when (not (eq region nil))
      (goto-char (cdr region)))))

(defun py:end-import-statement ()
  ""
  (save-restriction
    (narrow-to-region (py:goto-start-coding-point)
                      (or (py:goto-first-class|def)
                          (point-max)))
    (goto-char (point-max))
    (let (end)
      (while (and (setq end (re-search-backward py:import-line-re nil 'noerror))
                  (py:at-string|comment-p)))
      (if (not (eq end nil))
          (if (py:in-try-block-p)
              (py:end-of-try-block 1)
            (progn (end-of-line) (point)))
        (point-min)
        ))))

(defun py:beg|end-of-class|def (n)
  "N"
  (interactive "p")
  (cond ((py:at-beginning-of-class-p)
         (unless (py:forward-method n)
           (py:end-of-class|def n)))
        ((or (py:in-def-p)
             (py:at-beginning-of-def-p))
         (py:end-of-class|def n))
        (t (py:forward-class|def n))))

(defun py:end-of-class|def (n &optional with-tail)
  "N"
  (interactive "p")
  (cond ((and (or (py:in-class-p) (py:at-beginning-of-class-p))
              (not (py:in-def-p))
              (not (py:at-beginning-of-def-p))
              (not (py:at-tail-of-def-p)))
         (if (py:forward-method 1)
             (py:end-of-def 1 with-tail)
           (py:forward-end--internal py:class|def-re n with-tail)))
        ((py:at-tail-of-class-p)
         (py:forward-class|def n)
         ;; recursive call
         (py:end-of-class|def n with-tail))
        (t
         (py:forward-end--internal py:class|def-re n with-tail))))

(defun py:end-of-class (n &optional with-tail)
  "N"
  (interactive "p")
  (py:forward-end--internal py:class-re n with-tail))

(defun py:end-of-prev-class (n &optional with-tail)
  "N"
  (interactive "p")
  (py:forward-end--internal py:class-re (- n) with-tail))

(defun py:end-of-def (n &optional with-tail)
  "N"
  (interactive "p")
  (py:forward-end--internal py:def-re n with-tail))

(defun py:end-of-prev-def (n &optional with-tail)
  "N"
  (interactive "p")
  (py:forward-end--internal py:def-re (- n) with-tail))

(defun py:end-of-if-block (n &optional with-tail)
  ""
  (interactive "p")
  (py:forward-end--internal py:if-re n with-tail 'minor-iftry))

(defun py:end-of-try (n &optional with-tail)
  "N"
  (interactive "p")
  (py:forward-end--internal py:try-re n with-tail))

(defun py:end-of-try-block (n &optional with-tail)
  ""
  (interactive "p")
  (py:forward-end--internal py:try-re n with-tail 'minor-iftry))

(defun py:end-of-while (n &optional with-tail)
  "N
WITH-TAIL"
  (interactive "p")
  (py:forward-end--internal py:while-re n with-tail))

(defun py:end-of-block (n &optional with-tail)
  "
N
WITH-TAIL"
  (interactive "p")
  (py:forward-end--internal py:block-start-re n with-tail))

(defun py:end-of-brackets (&optional left right contract)
  "Move point end of pair balanced brackets.
And Return point or nil.
If LEFT and RIGHT is nil, move point end of current paren.
LEFT: left operand like these (, [, {
RIGHT: right operand like these ), ], }
CONTRACT: If non-nil, contract to internal paren."
  (let* ((orig (point))
         (round 0)
         (square 0)
         (curly 0)
         (regexp (or (and left right (concat left "\\|" right)) "[]()[{}]"))
         (bound-re "\\_<\\(\\(?:class\\|def\\|return\\|w\\(?:hile\\|ith\\)\\)\\)\\_>")
         (bound (save-excursion ;beginning or end of block or point max
                  (while (and (re-search-forward bound-re nil 'noerror)
                              (py:at-string|comment-p)))
                  (point))))
    (while (and (<= 0 round)
                (<= 0 square)
                (<= 0 curly)
                (re-search-forward regexp bound 'noerror))
      (cond ((py:at-string|comment-p) (py:skip-string|comment))
            ((looking-back "(") (incf round))
            ((looking-back ")") (decf round))
            ((looking-back "\\[") (incf square))
            ((looking-back "\\]") (decf square))
            ((looking-back "{") (incf curly))
            ((looking-back "}") (decf curly))))
    (if (eq bound (point))
        (progn (goto-char orig) nil)
      (and contract (forward-char -1))
      (point))))

(defun py:end-of-round (&optional contract)
  "Move point end of round ')' balanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:end-of-brackets "(" ")" contract))

(defun py:end-of-square (&optional contract)
  "Move point end of square ']' balanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:end-of-brackets "\\[" "\\]" contract))

(defun py:end-of-curly (&optional contract)
  "Move point end of curly '}' balanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:end-of-brackets "{" "}" contract))

(defun py:end-of-method (n)
  "N"
  (interactive "p")
  (if (py:at-tail-of-class-p)
      nil
    (let ((orig (point)))
      (save-restriction
        (py:narrow-to-class)
        (py:forward-end--internal py:def-re n))
      (if (py:at-tail-of-def-p)
          (point)
        (goto-char orig)
        nil))))

(defun py:before-end-of-method (n)
  "N"
  (interactive "p")
  (py:end-of-method (- n)))

(defvar py:off-set 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; goto
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:goto-start-coding-point ()
  ""
  (goto-char (point-min))
  (while (or (looking-at py:shebang-re)
             (looking-at py:encoding-string-re))
    (forward-line 1))
  (point))

(defun py:goto--internal (regexp &optional match-num)
  "REGEXP
MATCH-NUM: match-beginning number, default 0."
  (let ((orig (point))
        (match-num (or match-num 0)))
    (goto-char (point-min))
    (if (not (eq (re-search-forward regexp nil 'noerror) nil))
        (goto-char (match-beginning match-num))
      (goto-char orig)
      nil)))

(defun py:goto-class-name (name)
  "NAME"
  (interactive "sclass name: ")
  (py:goto--internal (py:make-class-name--re name) 0))

(defun py:goto-def-name (name)
  "NAME"
  (interactive "sfunctions name: ")
  (py:goto--internal (py:make-def-name--re name) 0))

(defun py:goto-first-class|def ()
  ""
  (interactive)
  (let ((orig (point))
        start)
    (goto-char (point-min))
    (setq start (py:forward-class|def 1))
    (if (not (eq start nil))
        start
      (goto-char orig)
      nil)))

;; TODO: (Atami) [2013/10/08]
;; rename to better
(defun py:goto-writable-point-in-def (&optional names skip-doc)
  "NAME
SKIP-DOC"
  (save-restriction
    (when (not (eq (py:narrow-to-def names) nil))
      (goto-char (point-min))
      (let* ((orig-point (point))
             (orig-line (count-lines 1 orig-point))
             (orig-indent (current-indentation)))
        (when (py:forward-colon-delimiter 1)
          ;; skip string or blank
          (while (or (not (eq (skip-chars-forward " \t\n") 0))
                     (py:skip-string|comment)))
          ;; skip doc if required
          (and skip-doc
               (save-excursion (beginning-of-line)
                               (looking-at py:doc-class|def-re))
               (goto-char (match-end 1))
               (forward-to-indentation 1))
          ;; fix indent
          (and (< orig-line (count-lines 1 (point)))
               (eq orig-indent (current-indentation))
               (insert (make-string py:off-set 32))))
        (point)))))

(defun py:goto-class-parameter (&optional names)
  "NAMES"
  (interactive "sclass name: ")
  (save-restriction
    (when (not (eq (py:narrow-to-class names) nil))
      (goto-char (point-min))
      (skip-chars-forward " \t")
      (when (looking-at py:class-param-start-re)
        (goto-char (match-end 0))))))

(defun py:goto-class-end-parameter ()
  ""
  (interactive)
  (when (py:goto-class-parameter)
    (py:end-of-round)))

(defun py:goto-beginning-class-doc (&optional names)
  "NAMES"
  (interactive "sclass name: ")
  (let ((region (py:region-doc-class)))
    (when (not (eq region nil))
      (goto-char (car region)))))

(defun py:goto-end-class-doc (&optional names)
  "NAMES"
  (interactive "sclass name: ")
  (let ((region (py:region-doc-class)))
    (when (not (eq region nil))
      (goto-char (cdr region)))))

(defun py:goto-def-parameter (&optional names)
  ""
  (interactive "sfunctions name: ")
  (save-restriction
    (when (not (eq (py:narrow-to-def names) nil))
      (goto-char (point-min))
      (skip-chars-forward " \t")
      (when (looking-at py:def-param-start-re)
        (goto-char (match-end 0))))))

(defun py:goto-def-end-parameter ()
  ""
  (interactive)
  (when (py:goto-def-parameter)
    (py:end-of-round)))

(defun py:goto-beginning-def-doc (&optional names)
  "NAMES"
  (interactive "sfunctions name: ")
  (let ((region (py:region-doc-def)))
    (when (not (eq region nil))
      (goto-char (car region)))))

(defun py:goto-end-def-doc (&optional names)
  "NAMES"
  (interactive "sfunctions name: ")
  (let ((region (py:region-doc-def)))
    (when (not (eq region nil))
      (goto-char (cdr region)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; skip
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:skip-string|comment ()
  ""
  (interactive)
  (while (and (not (eobp))
              (py:at-string|comment-p))
    (forward-char 1)))

(defun py:skip-back-string|comment ()
  ""
  (interactive)
  (while (and (not (eobp))
              (py:at-string|comment-p))
    (forward-char -1)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; region
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:region--internal (regexp &optional indent with-tail minor-iftry)
  ""
  (save-excursion
    (when (or (save-excursion (beginning-of-line) (looking-at regexp))
              (py:in-block--predicate regexp with-tail minor-iftry))
      (let ((start (if (save-excursion
                         (skip-chars-backward " \t") (looking-at regexp))
                       (if indent
                           (match-beginning 0)
                         (match-beginning 1))
                     (py:forward-beginning--internal regexp -1)
                     (and indent (beginning-of-line))
                     (point)))
            (end (progn
                   (py:from-beg-to-end-block--internal with-tail minor-iftry)
                   (point))))
        (and start end (cons start end))))))

(defun py:region-imports ()
  ""
  (save-excursion
    (let ((start (py:beginning-import-statement))
          (end (py:end-import-statement)))
      (and start end (cons start end)))))

(defun py:region-class (&optional names indent with-tail)
  "NAMES"
  (save-excursion
    (if (eq names nil)
        (py:region-class--current indent with-tail)
      (py:region-class--name names indent with-tail))))

(defun py:region-class--name (names &optional indent with-tail)
  "NAME"
  (save-excursion
    (let ((start (py:goto-class-name names))
          end)
      (if (not start)
          nil
        (or indent (setq start (save-excursion (beginning-of-line) (point))))
        (setq end (py:from-beg-to-end-block--internal with-tail))
        (and start end (cons start end))))))

(defun py:region-class--current (&optional indent with-tail)
  ""
  (py:region--internal py:class-re indent with-tail))

; TODO: (Atami) [2013/10/10]
; include decorator region
(defun py:region-def (&optional names indent with-tail)
  "NAME"
  (if (eq names nil)
      (py:region-def--current indent with-tail)
    (py:region-def--name names indent with-tail)))

; TODO: (Atami) [2013/10/10]
; include decorator region
(defun py:region-def--name (names &optional indent with-tail)
  "NAME"
  (save-excursion
    (let ((start (py:goto-def-name names))
          end)
      (when start
        (or indent (setq start (save-excursion (beginning-of-line) (point))))
        (setq end (py:from-beg-to-end-block--internal with-tail))
        (and start end (cons start end))))))

; TODO: (Atami) [2013/10/10]
; include decorator region
(defun py:region-def--current (&optional indent with-tail)
  ""
  (py:region--internal py:def-re indent with-tail))

(defun py:region-if (&optional indent with-tail)
  ""
  (py:region--internal py:if-re indent with-tail))

(defun py:region-if-block (&optional indent with-tail)
  ""
  (py:region--internal py:if-re indent with-tail 'minor-iftry))

(defun py:region-try (&optional indent with-tail)
  ""
  (py:region--internal py:try-re indent with-tail))

(defun py:region-try-block (&optional indent with-tail)
  "WITH-TAIL"
  (py:region--internal py:try-re indent with-tail 'minor-iftry))

(defun py:region-elif (&optional indent with-tail)
  ""
  (py:region--internal py:elif-re indent with-tail))

(defun py:region-else (&optional indent with-tail)
  ""
  (py:region--internal py:else-re indent with-tail))

(defun py:region-except (&optional indent with-tail)
  ""
  (py:region--internal py:except-re indent with-tail))

(defun py:region-finally (&optional indent with-tail)
  ""
  (py:region--internal py:finally-re indent with-tail))

(defun py:region-for (&optional indent with-tail)
  "INDENT
WITH-TAIL"
  (py:region--internal py:for-re indent with-tail))

(defun py:region-with (&optional indent with-tail)
  "INDENT
WITH-TAIL"
  (py:region--internal py:with-re indent with-tail))

(defun py:region-while (&optional indent with-tail)
  "INDENT
WITH-TAIL"
  (py:region--internal py:while-re indent with-tail))

(defun py:region-block (&optional indent with-tail)
  "INDENT
WITH-TAIL"
  (py:region--internal py:block-start-re indent with-tail))

(defun py:region-doc (&optional what names indent contract)
  "WHAT
NAMES"
  (save-excursion
    (or (py:at-beginning-of-class-p)
        (py:at-beginning-of-def-p)
        (py:forward-class|def -1)
        ;; no exists class or def from before current point
        (py:region-doc-file contract))
    (cond ((eq what 'class)
           (py:region-doc-class names indent contract))
          ((eq what 'def)
           (py:region-doc-def names indent contract))
          ((eq what 'file)
           (py:region-doc-file contract))
          ((py:at-beginning-of-class-p)
           (py:region-doc-class names indent contract))
          ((py:at-beginning-of-def-p)
           (py:region-doc-def names indent contract)))))

(defun py:region-doc--contract (region)
  "REGION"
  (let ((start (progn
                 (goto-char (car region))
                 (skip-chars-forward " BUbuRr")
                 (skip-chars-forward "'\""
                                     (save-excursion
                                       (forward-char 3) (point)))
                 (point)))
        (end (progn
               (goto-char (cdr region))
               (skip-chars-backward "'\""
                                    (save-excursion
                                      (backward-char 3) (point)))
               (point))))
    (and start end (cons start end))))

(defun py:region-doc-file (&optional contract)
  ""
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward py:filedoc-re nil 'noerror)
      (let ((region (cons (match-beginning 0) (match-end 0))))
        (if contract
            (py:region-doc--contract region)
          (and (car region) (cdr region) region))))))

(defun py:region-doc-class (&optional names indent contract)
  "NAME"
  (save-excursion
    (save-restriction
      (py:narrow-to-class names)
      (goto-char (point-min))
      (let ((match-num (if indent 0 1))
            region)
        (when (and (re-search-forward py:doc-class|def-re nil 'noerror)
                   (setq region (cons (match-beginning match-num)
                                      (match-end match-num)))
                   (not (py:in-def-p)))
          (if contract
              (py:region-doc--contract region)
            (and (car region) (cdr region) region)))))))

(defun py:region-doc-def (&optional names indent contract)
  "NAME"
  (save-excursion
    (save-restriction
      (py:narrow-to-def names)
      (goto-char (point-min))
      (when (re-search-forward py:doc-class|def-re nil 'noerror)
        (let* ((match-num (if indent 0 1))
               (region (cons (match-beginning match-num) (match-end match-num)))
               )
          (if contract
              (py:region-doc--contract region)
            (and (car region) (cdr region) region)))))))

(defun py:region-parameter (&optional what)
  "WHAT"
  )

(defun py:region-def-parameter ()
  ""
  (save-excursion
    (py:goto-def-parameter)
    (let ((start (save-excursion (skip-chars-backward "(") (point)))
          (end (py:end-of-round)))
      (and start end (cons start end)))))

(defun py:region-if-name-main ()
  ""
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward py:if-name-main-re nil 'noerror)
      (goto-char (match-beginning 0))
      (let ((start (point))
            (end (py:from-beg-to-end-block--internal nil)))
        (and start end (cons start end))))))

(defun py:region-brackets (&optional left right contract)
  "Get region that pair balanced brackets.
And Return cons region or nil.
If LEFT and RIGHT is nil, region of current paren.
LEFT: left operand like these (, [, {
RIGHT: right operand like these ), ], }
CONTRACT: If non-nil, contract to internal paren."
  (let ((start (save-excursion (py:beginning-of-brackets left right contract)))
        (end (save-excursion (py:end-of-brackets left right contract))))
    (and start end (cons start end))))

(defun py:region-round (&optional contract)
  "Get region that round '()' balanced brackets.
And Return cons region or nil.
CONTRACT: If non-nil, contract to internal paren."
  (py:region-brackets "(" ")" contract))

(defun py:region-square (&optional contract)
  "Get region that square '[]' balanced brackets.
And Return cons region or nil.
CONTRACT: If non-nil, contract to internal paren."
  (py:region-brackets "\\[" "\\]" contract))

(defun py:region-curly (&optional contract)
  "Get region that curly '{}' balanced brackets.
And Return cons region or nil.
CONTRACT: If non-nil, contract to internal paren."
  (py:region-brackets "{" "}" contract))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; narrow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:narrow--internal (region)
  "FUNC"
  (when region
    (narrow-to-region (car region) (cdr region))
    region))

(defun py:narrow-to-class (&optional names indent with-tail)
  ""
  (py:narrow--internal (py:region-class names (not indent) (not with-tail))))

(defun py:narrow-to-def (&optional names indent with-tail)
  "NAMES"
  (py:narrow--internal (py:region-def names (not indent) (not with-tail))))

(defun py:narrow-to-if (&optional indent with-tail)
  ""
  (py:narrow--internal (py:region-if (not indent) (not with-tail))))

(defun py:narrow-to-if-block (&optional indent with-tail)
  ""
  (py:narrow--internal (py:region-if-block (not indent) (not with-tail))))

(defun py:narrow-to-else (&optional indent with-tail)
  ""
  (py:narrow--internal (py:region-else (not indent) (not with-tail))))

(defun py:narrow-to-elif (&optional indent with-tail)
  ""
  (py:narrow--internal (py:region-elif (not indent) (not with-tail))))

(defun py:narrow-to-try (&optional indent with-tail)
  ""
  (py:narrow--internal (py:region-try (not indent) (not with-tail))))

(defun py:narrow-to-except (&optional indent with-tail)
  ""
  (py:narrow--internal (py:region-except (not indent) (not with-tail))))

(defun py:narrow-to-finally (&optional indent with-tail)
  ""
  (py:narrow--internal (py:region-finally (not indent) (not with-tail))))

(defun py:narrow-to-try-block (&optional indent with-tail)
  ""
  (py:narrow--internal (py:region-try-block (not indent) (not with-tail))))

(defun py:narrow-to-for (&optional indent with-tail)
  "INDENT
WITH-TAIL"
  (py:narrow--internal (py:region-for (not indent) (not with-tail))))

(defun py:narrow-to-with (&optional indent with-tail)
  "INDENT
WITH-TAIL"
  (py:narrow--internal (py:region-with (not indent) (not with-tail))))

(defun py:narrow-to-while (&optional indent with-tail)
  "INDENT
WITH-TAIL"
  (py:narrow--internal (py:region-while (not indent) (not with-tail))))

(defun py:narrow-to-if-name-main ()
  ""
  (py:narrow--internal (py:region-if-name-main)))

(defun py:narrow-to-doc (&optional what names indent contract)
  ""
  (py:narrow--internal (py:region-doc what names indent contract)))

(defun py:narrow-to-doc--class (&optional names indent contract)
  ""
  (py:narrow-to-doc 'class names indent contract))

(defun py:narrow-to-doc--def (&optional names indent contract)
  ""
  (py:narrow-to-doc 'def names indent contract))

(defun py:narrow-to-doc--file (&optional contract)
  ""
  (py:narrow-to-doc 'file nil nil contract))

(defun py:narrow-to-imports ()
  ""
  (py:narrow--internal (py:region-imports)))

(defun py:narrow-to-brackets (&optional contract)
  "Norrow to pair balanced brackets.
And Return cons region or nil.
CONTRACT: If non-nil, contract to internal paren."
  (py:narrow--internal (py:region-brackets nil nil contract)))

(defun py:narrow-to-round (&optional contract)
  "Narrow to round '()' balanced brackets.
And Return cons region or nil.
CONTRACT: If non-nil, contract to internal paren."
  (py:narrow--internal (py:region-round contract)))

(defun py:narrow-to-square (&optional contract)
  "Narrow to square '[]' balanced brackets.
And Return cons region or nil.
CONTRACT: If non-nil, contract to internal paren."
  (py:narrow--internal (py:region-square contract)))

(defun py:narrow-to-curly (&optional contract)
  "Narrow to curly '{}' balanced brackets.
And Return cons region or nil.
CONTRACT: If non-nil, contract to internal paren."
  (py:narrow--internal (py:region-curly contract)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; mark
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:mark--internal (region)
  "REGION"
  (when region
    (goto-char (car region))
    (push-mark (cdr region) t t)
    region))

(defun py:mark-imports ()
  ""
  (interactive)
  (py:mark--internal (py:region-imports)))

(defun py:mark-class (&optional names indent with-tail)
  ""
  (interactive)
  (py:mark--internal (py:region-class names indent with-tail)))

(defun py:mark-def (&optional names indent with-tail)
  "NAMES"
  (interactive)
  (py:mark--internal (py:region-def names indent with-tail)))

(defun py:mark-if (&optional indent with-tail)
  ""
  (interactive)
  (py:mark--internal (py:region-if indent with-tail)))

(defun py:mark-if-block (&optional indent with-tail)
  ""
  (interactive)
  (py:mark--internal (py:region-if-block indent with-tail)))

(defun py:mark-try (&optional indent with-tail)
  ""
  (interactive)
  (py:mark--internal (py:region-try indent with-tail)))

(defun py:mark-try-block (&optional indent with-tail)
  ""
  (interactive)
  (py:mark--internal (py:region-try-block indent with-tail)))

(defun py:mark-elif (&optional indent with-tail)
  ""
  (interactive)
  (py:mark--internal (py:region-elif indent with-tail)))

(defun py:mark-else (&optional indent with-tail)
  ""
  (interactive)
  (py:mark--internal (py:region-else indent with-tail)))

(defun py:mark-except (&optional indent with-tail)
  ""
  (interactive)
  (py:mark--internal (py:region-except indent with-tail)))

(defun py:mark-finally (&optional indent with-tail)
  ""
  (interactive)
  (py:mark--internal (py:region-finally indent with-tail)))

(defun py:mark-for (&optional indent with-tail)
  "INDENT
WITH-TAIL"
  (interactive)
  (py:mark--internal (py:region-for indent with-tail)))

(defun py:mark-with (&optional indent with-tail)
  "INDENT
WITH-TAIL"
  (interactive)
  (py:mark--internal (py:region-with indent with-tail)))

(defun py:mark-while (&optional indent with-tail)
  "INDENT
WITH-TAIL"
  (interactive)
  (py:mark--internal (py:region-while indent with-tail)))

(defun py:mark-doc (&optional what names)
  ""
  (interactive)
  (py:mark--internal (py:region-doc what names)))

(defun py:mark-parameter ()
  ""
  (interactive)
  (py:mark--internal (py:region-parameter)))

(defun py:mark-if-name-main ()
  ""
  (interactive)
  (py:mark--internal (py:region-if-name-main)))

(defun py:mark-brackets (&optional contract)
  "Mark to pair balanced brackets.
And Return cons region or nil.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:mark--internal (py:region-brackets nil nil contract)))

(defun py:mark-round (&optional contract)
  "Mark to round '()' balanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:mark--internal (py:region-round contract)))

(defun py:mark-square (&optional contract)
  "Mark to square '[]' balanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:mark--internal (py:region-square contract)))

(defun py:mark-curly (&optional contract)
  "Mark to curly '{}' balanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:mark--internal (py:region-curly contract)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; kill
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:kill--internal (region)
  "REGION"
  (when region
    (kill-region (car region) (cdr region))))

(defun py:kill-imports ()
  ""
  (interactive "*")
  (py:kill--internal (py:region-imports)))

(defun py:kill-class (&optional names indent with-tail)
  ""
  (interactive "*")
  (py:kill--internal (py:region-class names indent with-tail)))

(defun py:kill-def (&optional names indent with-tail)
  "NAMES"
  (interactive "*")
  (py:kill--internal (py:region-def names indent with-tail)))

(defun py:kill-if (&optional indent with-tail)
  ""
  (interactive "*")
  (py:kill--internal (py:region-if indent with-tail)))

(defun py:kill-if-block (&optional indent with-tail)
  ""
  (interactive "*")
  (py:kill--internal (py:region-if-block indent with-tail)))

(defun py:kill-try (&optional indent with-tail)
  ""
  (interactive "*")
  (py:kill--internal (py:region-try indent with-tail)))

(defun py:kill-try-block (&optional indent with-tail)
  ""
  (interactive "*")
  (py:kill--internal (py:region-try-block indent with-tail)))

(defun py:kill-elif (&optional indent with-tail)
  ""
  (interactive "*")
  (py:kill--internal (py:region-elif indent with-tail)))

(defun py:kill-else (&optional indent with-tail)
  ""
  (interactive "*")
  (py:kill--internal (py:region-else indent with-tail)))

(defun py:kill-except (&optional indent with-tail)
  ""
  (interactive "*")
  (py:kill--internal (py:region-except indent with-tail)))

(defun py:kill-finally (&optional indent with-tail)
  ""
  (interactive "*")
  (py:kill--internal (py:region-finally indent with-tail)))

(defun py:kill-doc (&optional what names)
  ""
  (interactive "*")
  (py:kill--internal (py:region-doc what names)))

(defun py:kill-parameter ()
  ""
  (interactive "*")
  (py:kill--internal (py:region-parameter)))

(defun py:kill-if-name-main ()
  ""
  (interactive "*")
  (py:kill--internal (py:region-if-name-main)))

(defun py:kill-brackets (&optional contract)
  "Kill pair blanced brackets region.
CONTRACT: If non-nil, contract to internal paren."
  (interactive "*")
  (py:kill--internal (py:region-brackets nil nil contract)))

(defun py:kill-round (&optional contract)
  "Kill round '()' blanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive "*")
  (py:kill--internal (py:region-round contract)))

(defun py:kill-square (&optional contract)
  "Kill square '[]' blanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive "*")
  (py:kill--internal (py:region-square contract)))

(defun py:kill-curly (&optional contract)
  "Kill curly '{}' blanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive "*")
  (py:kill--internal (py:region-curly contract)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; copy
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:copy--internal (region)
  "REGION"
  (when region
    (copy-region-as-kill (car region) (cdr region))
    region))

(defun py:copy-imports ()
  ""
  (interactive)
  (py:copy--internal (py:region-imports)))

(defun py:copy-class (&optional names indent with-tail)
  ""
  (interactive)
  (py:copy--internal (py:region-class names indent with-tail)))

(defun py:copy-def (&optional names indent with-tail)
  "NAMES"
  (interactive)
  (py:copy--internal (py:region-def names indent with-tail)))

(defun py:copy-if (&optional indent with-tail)
  ""
  (interactive)
  (py:copy--internal (py:region-if indent with-tail)))

(defun py:copy-if-block (&optional indent with-tail)
  ""
  (interactive)
  (py:copy--internal (py:region-if-block indent with-tail)))

(defun py:copy-try (&optional indent with-tail)
  ""
  (interactive)
  (py:copy--internal (py:region-try indent with-tail)))

(defun py:copy-try-block (&optional indent with-tail)
  ""
  (interactive)
  (py:copy--internal (py:region-try-block indent with-tail)))

(defun py:copy-elif (&optional indent with-tail)
  ""
  (interactive)
  (py:copy--internal (py:region-elif indent with-tail)))

(defun py:copy-else (&optional indent with-tail)
  ""
  (interactive)
  (py:copy--internal (py:region-else indent with-tail)))

(defun py:copy-except (&optional indent with-tail)
  ""
  (interactive)
  (py:copy--internal (py:region-except indent with-tail)))

(defun py:copy-finally (&optional indent with-tail)
  ""
  (interactive)
  (py:copy--internal (py:region-finally indent with-tail)))

(defun py:copy-doc (&optional what names)
  ""
  (interactive)
  (py:copy--internal (py:region-doc what names)))

(defun py:copy-parameter ()
  ""
  (interactive)
  (py:copy--internal (py:region-parameter)))

(defun py:copy-if-name-main ()
  ""
  (interactive)
  (py:copy--internal (py:region-if-name-main)))

(defun py:copy-brackets (&optional contract)
  "Copy pair blanced brackets region.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:copy--internal (py:region-brackets nil nil contract)))

(defun py:copy-round (&optional contract)
  "Copy round '()' blanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:copy--internal (py:region-round contract)))

(defun py:copy-square (&optional contract)
  "Copy square '[]' blanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:copy--internal (py:region-square contract)))

(defun py:copy-curly (&optional contract)
  "Copy curly '{}' blanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive)
  (py:copy--internal (py:region-curly contract)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; comment
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:comment--internal (region)
  "REGION"
  (when region
    (comment-or-uncomment-region (car region) (cdr region))))

(defun py:comment-imports ()
  ""
  (interactive "*")
  (py:comment--internal (py:region-imports)))

(defun py:comment-class (&optional names)
  ""
  (interactive "*")
  (py:comment--internal (py:region-class names)))

(defun py:comment-def (&optional names)
  "NAMES"
  (interactive "*")
  (py:comment--internal (py:region-def names)))

(defun py:comment-if ()
  ""
  (interactive "*")
  (py:comment--internal (py:region-if)))

(defun py:comment-if-block ()
  ""
  (interactive "*")
  (py:comment--internal (py:region-if-block)))

(defun py:comment-try ()
  ""
  (interactive "*")
  (py:comment--internal (py:region-try)))

(defun py:comment-try-block ()
  ""
  (interactive "*")
  (py:comment--internal (py:region-try-block)))

(defun py:comment-elif ()
  ""
  (interactive "*")
  (py:comment--internal (py:region-elif)))

(defun py:comment-else ()
  ""
  (interactive "*")
  (py:comment--internal (py:region-else)))

(defun py:comment-except ()
  ""
  (interactive "*")
  (py:comment--internal (py:region-except)))

(defun py:comment-finally ()
  ""
  (interactive "*")
  (py:comment--internal (py:region-finally)))

(defun py:comment-if-name-main ()
  ""
  (interactive "*")
  (py:comment--internal (py:region-if-name-main)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; delete
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:delete--internal (region)
  "REGION"
  (when region
    (delete-and-extract-region (car region) (cdr region))))

(defun py:delete-imports ()
  ""
  (interactive "*")
  (py:delete--internal (py:region-imports)))

(defun py:delete-class (&optional names indent with-tail)
  ""
  (interactive "*")
  (py:delete--internal (py:region-class names indent with-tail)))

(defun py:delete-def (&optional names indent with-tail)
  "NAMES"
  (interactive "*")
  (py:delete--internal (py:region-def names indent with-tail)))

(defun py:delete-if (&optional indent with-tail)
  ""
  (interactive "*")
  (py:delete--internal (py:region-if indent with-tail)))

(defun py:delete-if-block (&optional indent with-tail)
  ""
  (interactive "*")
  (py:delete--internal (py:region-if-block indent with-tail)))

(defun py:delete-try (&optional indent with-tail)
  ""
  (interactive "*")
  (py:delete--internal (py:region-try indent with-tail)))

(defun py:delete-try-block (&optional indent with-tail)
  ""
  (interactive "*")
  (py:delete--internal (py:region-try-block indent with-tail )))

(defun py:delete-elif (&optional indent with-tail)
  ""
  (interactive "*")
  (py:delete--internal (py:region-elif indent with-tail)))

(defun py:delete-else (&optional indent with-tail)
  ""
  (interactive "*")
  (py:delete--internal (py:region-else indent with-tail)))

(defun py:delete-except (&optional indent with-tail)
  ""
  (interactive "*")
  (py:delete--internal (py:region-except indent with-tail)))

(defun py:delete-finally (&optional indent with-tail)
  ""
  (interactive "*")
  (py:delete--internal (py:region-finally indent with-tail)))

(defun py:delete-doc (&optional what names indent)
  ""
  (interactive "*")
  (py:delete--internal (py:region-doc what names indent)))

(defun py:delete-parameter ()
  ""
  (interactive "*")
  (py:delete--internal (py:region-parameter)))

(defun py:delete-if-name-main ()
  ""
  (interactive "*")
  (py:delete--internal (py:region-if-name-main)))

(defun py:delete-blank-line ()
  ""
  (interactive "*")
  (while (and (py:at-blank-line-p)
              (not (eobp)))
    (delete-blank-lines)))

(defun py:delete-brackets (&optional contract)
  "Delete pair blanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive "*")
  (py:delete--internal (py:region-brackets nil nil contract)))

(defun py:delete-round (&optional contract)
  "Delete round '()' blanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive "*")
  (py:delete--internal (py:region-round contract)))

(defun py:delete-square (&optional contract)
  "Delete square '[]' blanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive "*")
  (py:delete--internal (py:delete-square contract)))

(defun py:delete-curly (&optional contract)
  "Delete curly '{}' blanced brackets.
CONTRACT: If non-nil, contract to internal paren."
  (interactive "*")
  (py:delete--internal (py:region-curly contract)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; alias
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defalias 'py:in-list-p 'py:in-square-p)
(defalias 'py:in-dic-p 'py:in-curly-p)
(defalias 'py:beginning-of-list 'py:beginning-of-square)
(defalias 'py:beginning-of-dic 'py:beginning-of-curly)
(defalias 'py:end-of-list 'py:end-of-square)
(defalias 'py:end-of-dic 'py:end-of-curly)
(defalias 'py:region-list 'py:region-square)
(defalias 'py:region-dic 'py:region-curly)
(defalias 'py:narrow-list 'py:narrow-to-square)
(defalias 'py:narrow-dic 'py:narrow-to-curly)
(defalias 'py:mark-list 'py:mark-square)
(defalias 'py:mark-dic 'py:mark-curly)
(defalias 'py:kill-list 'py:kill-square)
(defalias 'py:kill-dic 'py:kill-curly)
(defalias 'py:copy-list 'py:copy-square)
(defalias 'py:copy-dic 'py:copy-curly)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; move
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:move-up-class ()
  ""
  (interactive "*")
  (when (and (or (py:at-beginning-of-class-p) (py:in-class-p))
             (py:exists-prev-class-p))
    (py:refact-class-tail-blank) ;target class
    (let ((text (py:delete-class))
          (orig-column (current-column))
          (moved-point (py:beginning-of-class 1)))
      (insert text)
      (py:refact-class-tail-blank) ;pole class
      ;; fix point and column
      (goto-char moved-point)
      (line-move-to-column orig-column)
      )))

(defun py:move-down-class ()
  ""
  (interactive "*")
  (when (and (or (py:at-beginning-of-class-p) (py:in-class-p))
             (py:exists-next-class-p))
    (py:refact-class-tail-blank)
    (let ((text (py:delete-class))
          (orig-column (current-column)))
      (py:refact-class-tail-blank) ; pole class
      (py:end-of-class 1 'with-tail)
      (insert text)
      (py:beginning-of-class 1)
      )))

(defun py:move-up-method ()
  ""
  (interactive "*")
  (save-restriction
    (when (and (py:in-class-p)
               (or (py:at-beginning-of-def-p) (py:in-def-p))
               (py:narrow-to-class)
               (py:exists-next-def-p))
      (unless (py:at-beginning-of-def-p) (py:beginning-of-def 1))
      (let ((text (py:delete-def nil 'indent 'with-tail))
            start)
        (py:beginning-of-def 1) ;prev def
        (py:refact-def-tail-blank)
        (beginning-of-line)
        ;; for bug fix
        ;; cannot move with py:beginning-of-def
        (setq start (point))
        (insert text "\n")
        (goto-char start)
        (skip-chars-forward " \t")
        (py:refact-def-tail-blank)
        ))))

(defun py:move-down-method ()
  ""
  (interactive "*")
  (save-restriction
    (when (and (py:in-class-p)
               (or (py:in-def-p)
                   (py:at-beginning-of-def-p))
               (py:narrow-to-class)
               (py:exists-next-def-p))
      (let ((text (py:delete-def nil 'indent 'with-tail)))
        (py:delete-blank-line)
        (insert "\n")
        ;; just one blank line on existed point
        (py:end-of-def 1 nil)
        ;; just one blank line on new point
        (insert "\n")
        (py:delete-blank-line)
        (insert "\n")
        ;; insert text
        (insert text)
        ;; just one or two blank line on tail of inserted
        (insert "\n\n") ;dummy for text has not tail of blank line
        (forward-line -1)
        (py:delete-blank-line)
        (insert "\n")
        (and (not (py:exists-next-def-p))
             (py:refact-class-tail-blank))
        ;; back beginning def
        (py:beginning-of-def 1)
        ;; for bug fix that cannot return def position
        (or (looking-at "\\_<def\\_>") (py:beginning-of-def 1))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;; refact
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun py:list-method-in-class (&optional names)
  "NAMES"
  (save-excursion
    (save-restriction
      (py:narrow-to-class names)
      (goto-char (point-min))
      (let (namelist tmpname)
        (while (and (re-search-forward py:def-name-re nil 'noerror)
                    (setq tmpname (buffer-substring (match-beginning 1)
                                                    (match-end 1)))
                    (not (py:at-string|comment-p)))
          (push tmpname namelist))
        (reverse namelist)))))

(defun py:refact-class-tail-blank ()
  ""
  (when (or (py:in-class-p 'with-tail)
            (py:at-beginning-of-class-p))
    (save-excursion
      (py:end-of-class 1 'with-tail)
      (py:delete-blank-line)
      (insert "\n\n")
      )))

(defun py:refact-def-tail-blank ()
  ""
  (when (or (py:in-def-p)
            (py:at-beginning-of-def-p))
    (save-excursion
      (py:end-of-def 1)
      (forward-line 1)
      (py:delete-blank-line)
      (insert "\n"))))

(defun py:refact-def-to-method ()
  ""
  )

(defun py:list-parameter ()
  ""
  (when (py:in-round-p)
    (save-excursion
      (save-restriction
        (py:narrow-to-round 'contract)
        (let* (param-start param-list)
          (goto-char (point-min))
          ;; before into while
          (skip-chars-forward " \t")
          (setq param-start (point))
          (while (not (eobp))
            (re-search-forward "," nil 'noerror)
            (when (not (or (py:at-string|comment-p)
                           (py:in-brackets-p)))
              (setq param-list
                    (nconc param-list
                           (list (buffer-substring
                                  param-start
                                  (save-excursion
                                    (skip-chars-backward " \t,")
                                    (point))))))
              ;; for next
              (skip-chars-forward " \t\n")
              (setq param-start (point))))
          param-list)))))

(defun py:refact-param--= (list)
  "LIST"
  (defun refact-= (txt)
    "X"
    (let* ((regexp "[[:blank:]]*=[[:blank:]]*")
           (replace "=")
           (prop 'font-lock-string)
           matched-num)
      (and (setq matched-num (string-match regexp txt))
           (not (eq (get-text-property (+ matched-num 1) txt) prop))
           (setq txt (replace-regexp-in-string regexp replace txt))))
    txt)
  (mapcar 'refact-= list))

(defun py:refact-param--sort (list)
  "LIST"
  (let ((prop 'font-lock-string)
        ;; def sample(required, optional=True, *positional, **keyword):
        1required 2optional 3positional 4keyword
        match-num)
    (dolist (txt list)
      (cond (;; for like "name='joe'"
             (and
              (setq match-num (string-match "[[:blank:]]*=[[:blank:]]*" txt))
              (not (eq (get-text-property (1+ match-num) txt) prop)))
             (setq 2optional (nconc 2optional (list txt))))
            ;; for **args
            ((string-match "^\\*\\*" txt)
             (setq 4keyword (nconc 4keyword (list txt))))
            ;; for *args
            ((string-match "^\\*" txt)
             (setq 3positional (nconc 3positional (list txt))))
            ;; normal like "name"
            (t
             (setq 1required (nconc 1required (list txt))))))
    (nconc 1required 2optional 3positional 4keyword)))

(defun py:refact-param--align ()
  ""
  )

(defun py:join-param-list (list)
  ""
  (py:join list ", "))

;; TODO: (Atami) [2013/10/13]
;; defun => subst
(defun py:join (sequence separator)
  "LIST"
  (mapconcat 'identity sequence separator))

(defun py:add-param (add)
  "Add word to current def paramerter.
ADD"
  (interactive
   (if mark-active
       (list (buffer-substring-no-properties (region-beginning) (region-end)))
     (list (thing-at-point 'symbol))))
  (save-excursion
    (py:goto-def-parameter)
    (py:refact-param (list add))))

(defun py:refact-param (&optional addlist)
  "Refactoring paramerter."
  (interactive)
  (and addlist (or (listp addlist) (error "Error add-list must be list")))
  (when (py:in-round-p)
    (let* ((param-list (py:list-parameter))
           (param-list (nconc param-list addlist)))
      (when param-list
        (setq param-list (py:refact-param--= param-list))
        (setq param-list (py:refact-param--sort param-list))
        (py:delete-round 'contract)
        (insert (py:join-param-list param-list))))))

(defun py:get-doc-str (&optional what names)
  "WHAT
NAMES"
  (let ((region (py:region-doc what names nil 'contract)))
    (buffer-substring (car region) (cdr region))))

(defun py:parse-doc (&optional names)
  ""
  (let* ((list (mapcar (lambda (txt)
                         (replace-regexp-in-string "^[[:blank:]]+" "" txt))
                       (split-string (py:get-doc-str 'def names) "\n")))
         (summary (pop list))
         (arguments '())
         returns others line)
    (while (setq line (pop list))
      (cond ((string-match "@Arguments:" line)
             ;; parse @Arguments statement
             (while (and (setq line (pop list))
                         (not (string= line "")))
               (let* ((arglis (split-string line "`"))
                      (name (nth 1 arglis))
                      (text (replace-regexp-in-string "^[[:blank:]]*:[[:blank:]]*" ""
                                                      (nth 2 arglis))))
                 (add-to-list 'arguments (cons name text)))))
            ((string-match "@Return:" line)
             ;; parse @Return statement
             (while (and (setq line (pop list))
                         (not (string= line "")))
               (setq returns (append returns (list line)))))
            (t
             (setq others (append others (list line))))))
    (list (cons "summary" summary)
          (cons "arguments" arguments)
          (cons "returns" returns)
          (cons "others" others))))

(defun py:refact-doc (&optional names)
  "NAMES"
  (interactive)
  (save-excursion
    (save-restriction
      (py:goto-writable-point-in-def names nil)
      (let ((indent-str (make-string (current-indentation) 32)))
        (unless (py:has-doc-in-def-p names)
          (insert (make-string 3 34) (read-string "summary: " "SUMMARY" nil)
                  (make-string 3 34) "\n" indent-str)) ;like """"""\n[indent]
        (let* ((sourp (py:parse-doc names))
               (summary (assoc "summary" sourp))
               (argalis (assoc "arguments" sourp))
               (returns (assoc "returns" sourp))
               (others (assoc "others" sourp))
               (params (delete "self" (progn
                                        (py:goto-def-parameter names)
                                        (py:refact-param--=
                                         (py:list-parameter))))))

          (py:narrow-to-doc 'def names nil t)
          (delete-region (point-min) (point-max))

          (when (cdr summary)
            (insert (cdr summary)))

          (if (not (or (cdr argalis)
                       (cdr returns)
                       (cdr others)
                       params))
              nil ;no insert
            (insert "\n\n")
            ;; insert arguments
            (when params
              (insert indent-str "@Arguments:\n"))
            (dolist (p params)
              (let* ((p (car (split-string p "=")))
                     (keyvalue (assoc p argalis))
                     (value (if keyvalue (cdr keyvalue) "")))
                (insert indent-str (format "- `%s`: " p) value "\n")))
            (insert "\n" indent-str "@Return:\n")

            (dolist (v (cdr returns))
              (insert indent-str v "\n"))
            (insert "\n")
            (dolist (v (cdr others))
              (insert indent-str v "\n"))
            ;; just one line
            (goto-char (point-min))
            (while (not (eobp))
              (forward-sentence 1)
              (forward-line 1)
              (just-one-blank-line))
            (insert indent-str)))))))

(defun py:indirect-import ()
  "Indirect import region."
  (interactive)
  (if (wlf:select (e2wm:pst-get-wm) 'upsub) ;determine showing upsub
      (wlf:hide (e2wm:pst-get-wm) 'upsub)
    (let ((region (py:region-imports)))
      (when region
        (wlf:show (e2wm:pst-get-wm) 'upsub)
        (goto-char (car region))))))

(defun py:refact-imports-colon ()
  ""
  (interactive "*")
  (save-restriction
    (when (looking-at (rx line-start (* blank) "import" (+ blank) (+ any) ","))
      (let* ((indent (current-indentation))
             (import (concat "\n" (make-string indent 32) "import ")))
        (save-restriction
          (narrow-to-region (line-beginning-position) (line-end-position))
          (beginning-of-line)
          (while (re-search-forward ",[[:blank:]]*" nil 'noerror)
            (delete-region (match-beginning 0) (match-end 0))
            (insert import)))))))


(defun py:refact-list-flat (&optional nospace)
  ""
  (interactive "*")
  ;; narrowing
  (save-excursion
    (save-restriction
      (when (py:narrow--internal (py:region-brackets nil nil 'contract))
        (goto-char (point-min))
        (while (re-search-forward "," nil 'noerror)
          (when (and (not (py:at-string|comment-p))
                     (not (py:in-brackets-p))
                     )
            (py:delete-horizontal-space-line nospace)))))))

(defun py:refact-list-vertical ()
  ""
  (interactive "*")
  (save-excursion
    (save-restriction
      (when (py:beginning-of-brackets nil nil 'contract)
        (py:refact-list-flat)
        (let* ((beg-column (current-column))
               (indent (concat "\n" (make-string beg-column 32))))
          (py:narrow--internal (py:region-brackets nil nil 'contract))
          (goto-char (point-min))
          (while (re-search-forward "," nil 'noerror)
            (when (and (not (py:at-string|comment-p))
                       (not (py:in-brackets-p)))
              (delete-horizontal-space)
              (insert indent)))
          (delete-horizontal-space))))))

(defun py:refact-list-horizontal (&optional maxlen)
  "
MAXLEN: Maximum line length, default 80 by PEP8."
  (interactive "*")
  (setq maxlen (or maxlen 80))
  (save-excursion
    (save-restriction
      (when (py:beginning-of-brackets nil nil 'contract)
        (py:refact-list-flat)
        (let* ((beg-column (current-column))
               (indent (concat "\n" (make-string beg-column 32))))
          (py:narrow--internal (py:region-brackets nil nil 'contract))
          (goto-char (point-min))
          (while (not (eobp))
            (re-search-forward "," nil 'noerror)
            (when (and (not (py:at-string|comment-p))
                       (not (py:in-brackets-p))
                       (< maxlen (+ beg-column (current-column))))
              (setq beg-column 0)
              ;; back to list
              (skip-chars-backward ",")
              (while (and (re-search-backward "," nil 'noerror)
                          (py:at-string|comment-p)
                          (py:in-brackets-p)
                          (not (bobp))))
              (skip-chars-forward ",")
              (delete-horizontal-space)
              (insert indent))))))))

(defvar py:refact-list-last-command)
(defun py:refact-list-toggle (ARGS)
  "ARGS"
  (interactive "p*")
  (cond ((eq ARGS 4) (py:refact-list-horizontal))
        ((eq ARGS 8) (py:refact-list-vertical))
        ((eq ARGS 12) (py:refact-list-flat))
        ((eq last-command this-command)
         (cond ((eq py:refact-list-last-command 'py:refact-list-horizontal)
                (setq py:refact-list-last-command 'py:refact-list-vertical)
                (py:refact-list-vertical))
               ((eq py:refact-list-last-command 'py:refact-list-vertical)
                (setq py:refact-list-last-command 'py:refact-list-flat)
                (py:refact-list-flat))
               (t
                (setq py:refact-list-last-command 'py:refact-list-horizontal)
                (py:refact-list-horizontal))))
        (t (py:refact-list-flat)
           (setq py:refact-list-last-command 'py:refact-list-flat))))


(defun py:delete-horizontal-space-line (&optional nospace)
  "JUST-ONE-SPACE"
  (let (done)
    (while (not done)
      (cond ((looking-at "[[:blank:]]") (delete-horizontal-space))
            ((looking-at "\n") (delete-char 1))
            (t (setq done t))))
    (unless nospace
      (just-one-space))))

(defun py:quote|double-toggle ()
  "Toggle quote <=> double quotes or wrap symbol by quote."
  (interactive)
  (if (eq (py:what-face-at) 'font-lock-string-face)
      (progn
        (when (save-excursion
                (backward-skip-string-regexp) (looking-at "\"\"\""))
          (error "Not support triple qoutes"))
        ;; tail first
        ;; if replace head quote at first, will fontify end of buffer.
        (save-excursion
          (forward-skip-string-regexp)
          (cond ((eq ?\' (char-before (point))) (delete-char -1) (insert "\""))
                ((eq ?\" (char-before (point))) (delete-char -1) (insert "\'"))))
        ;; do not remove this. escape match errors.
        ;; head quoute
        (sit-for 0)
        (save-excursion
          (backward-skip-string-regexp)
          (cond ((eq ?\' (char-after (+ (point) 1)))
                 (forward-char) (delete-char 1) (insert "\""))
                ((eq ?\" (char-after (+ (point) 1)))
                 (forward-char) (delete-char 1) (insert "'")))))
    (py:wrap-byquote)))

(defun py:wrap-byquote ()
  "Wrap symbol by quote."
  (interactive "*")
  (when (looking-at "[ \t]")
    (error "Do not on space or tab"))
  (save-excursion
    (let ((re-start (rx symbol-start))
          (re-end (rx symbol-end))
          (str "'"))
      (unless (looking-at re-start)
        (re-search-backward re-start nil 'noerror))
      (when (looking-at str)
        (setq str "\""))
      (insert str)
      (re-search-forward re-end nil 'noerror)
      (insert str)
      )))

(defun py:wrap-brackets () ;[2013/11/04]
  ""
  )

(defun py:yas/format ()
  ""
  (interactive "*")
  (insert "strformat")
  (yas/expand))

(defun py:string-cmd ()
  ""
  (interactive "*")
  (cond ((eq (py:what-face-at) 'font-lock-string-face)
         (py:quote|double-toggle))
        ((looking-at "[ \t]") (py:yas/format))
        (t (py:wrap-byquote))))

;;; merge functions
;;
;; TODO: (Atami) [2013/10/26]
;; inprement not string face and not in bracket command
(defun py:usable-next (n)
  "ARGS"
  (interactive "p")
  (if (eq (py:what-face-at) (or 'font-lock-string-face
                                'font-lock-regexp-grouping-backslash
                                'font-lock-regexp-grouping-construct))
      (forward-skip-string-regexp)
    (py:forward-list n)))

(defun py:usable-prev (n)
  "ARGS"
  (interactive "p")
  (if (and (eq (py:what-face-at)
               (or 'font-lock-string-face
                   'font-lock-regexp-grouping-backslash
                   'font-lock-regexp-grouping-construct))
           (eq (save-excursion (backward-char 1) (py:what-face-at))
               (or 'font-lock-string-face
                   'font-lock-regexp-grouping-backslash
                   'font-lock-regexp-grouping-construct)))
      (progn (backward-skip-string-regexp) (forward-char 1))
    (py:backward-list n)))

(defun py:colon-delimiter-next/prev--internal (&optional action orig)
  "ARGS"
  (let ((orig (or orig (point)))
        (re-search-fnc (cond ((eq action 'next) #'re-search-forward)
                             ((eq action 'prev) #'re-search-backward)
                             (t #'re-search-forward))))
    (if (funcall re-search-fnc ":" nil 'noerror)
        (if (or (py:at-string|comment-p)
                (py:in-brackets-p))
            ;; recursive call
            (py:colon-delimiter-next/prev--internal action orig)
          (point))
      (goto-char orig)
      nil)))

(defun py:colon-delimiter-next (n)
  "N"
  (interactive "p")
  (py:forward-colon-delimiter n))

(defun py:colon-delimiter-prev (n)
  "N"
  (interactive "p")
  (py:forward-colon-delimiter (- n)))

(defun py:what-in-block ()
  ""
  (let ((orig (point))
        (indent (current-indentation))
        done symbol in)
    (save-excursion
      (while (and (not done)
                  (not in)
                  (py:forward-beginning--internal py:block-start-re -1))
        (when (and (eq (current-indentation) 0)
                   (not (looking-at "\\(?:e\\(?:l\\(?:if\\|se\\)\\|xcept\\)\\|finally\\)")))
          (setq done t))
        (when (not (or (py:at-string|comment-p)
                       (py:in-brackets-p)))
          (setq symbol (thing-at-point 'symbol))
          (and (< (point) orig)
               (< orig (save-excursion
                         (py:from-beg-to-end-block--internal nil t)))
               (setq in t))))
      (when in
        symbol))))


;; TODO: (Atami) [2013/10/31]
(defvar py:seq-point)
(defvar py:seq-count 0)
(defvar py:seq-marked-block nil)

(defun py:seq-count ()
  ""
  (if (eq last-command this-command)
      (incf py:seq-count)
    (setq py:seq-point (point))
    (setq py:seq-marked-block nil)
    (setq py:seq-count 0)))

(defun py:seq-mark (args)
  "ARGS"
  (interactive "p")
  (let ((count (py:seq-count))
        )
    (cond ((eq count 0)
           (cua-set-mark))
          ((eq count 1)
           (mark-sexp))
          ((and (eq count 2)
                (py:in-brackets-p))
           (py:mark-brackets 'contract))
          ((and (eq count 3)
                (py:in-brackets-p))
           (setq py:seq-count 1)
           (py:mark-brackets nil))
          (t (let ((curr-indent (current-indentation))
                   (re "\\(?:e\\(?:l\\(?:if\\|se\\)\\|xcept\\)\\|finally\\)")
                   done)
               (if (and py:seq-marked-block
                        (eq 0 (current-indentation))
                        (not (looking-at re)))
                   (progn (goto-char py:seq-point)
                          (setq py:seq-count 0)
                          (pop-mark))
                 ;; (when py:seq-marked-block
                 ;; (while (not done)
                 ;; (py:forward-block-start -1)
                 ;; (when (<= (current-indentation) curr-indent)
                 ;; (setq done t)))
                 ;; (end-of-line))
                 (let ((whatin (py:what-in-block)))
                   (cond ((string= "elif" whatin)
                          (py:mark-elif))
                         ((string= "else" whatin)
                          (py:mark-else)
                          (setq py:seq-marked-block t))
                         ((string= "except" whatin)
                          (py:mark-except )
                          (setq py:seq-marked-block t))
                         ((string= "finally" whatin)
                          (py:mark-finally )
                          (setq py:seq-marked-block t))
                         ((string= "if" whatin)
                          (py:mark-if-block)
                          (setq py:seq-marked-block t))
                         ((string= "try" whatin)
                          (py:mark-try-block)
                          (setq py:seq-marked-block t))
                         ((string= "for" whatin)
                          (py:mark-for )
                          (setq py:seq-marked-block t))
                         ((string= "while" whatin)
                          (py:mark-while )
                          (setq py:seq-marked-block t))
                         ((string= "with" whatin)
                          (py:mark-with )
                          (setq py:seq-marked-block t))
                         ((string= "def" whatin)
                          (py:mark-def nil )
                          (setq py:seq-marked-block t))
                         ((string= "class" whatin)
                          (py:mark-class nil)
                          (setq py:seq-marked-block t))
                         (t (goto-char py:seq-point)
                            (setq py:seq-count 0)
                            (setq py:seq-marked-block nil)
                            (pop-mark)))
                   )))))))



(defun py:edit-parm-in-minibuffer ()
  ""
  (interactive))


(defmacro line-column ()
  "Return line end point column."
  `(save-excursion
     (end-of-line)
     (skip-chars-backward " \t")
     (current-column)))

;; FIXME: (Atami) [2013/11/12]
;; if in bracket no insert (, )
(defun py:refact-split-string () ;[2013/11/03]
  ""
  (interactive "*")
  (when (member (what-face-at-point) '(font-lock-string-face
                                       font-lock-regexp-grouping-backslash
                                       font-lock-regexp-grouping-construct))
    (let* ((line-column (+ 5 (line-column))) ;calc after splited column
           (char (char-to-string (char-before
                                  (save-excursion
                                    (forward-skip-string-regexp)))))
           indent)
      (if (< line-column 79)
          (insert char " + " char)
        ;; if line over 80 split line and wrap parentheses.
        (save-excursion
          (backward-skip-string-regexp)
          (forward-char 1)
          (setq indent (+ 1 (current-column)))
          (insert "("))
        (save-excursion
          (forward-skip-string-regexp)
          (insert ")"))
        (insert char "\n" (make-string indent 32) char)
        ))))


(defun py:extract-variable (varname start end) ;[2013/11/03]
  "VARNAME"
  (interactive "MVariables name: \nr")
  (unless mark-active (error "Must mark active region"))
  (when (string-match "^[0-9]+" varname)
    (message "Not acceptable numeric char on the head.\nReplaced \"%s\" => \"%s\""
             varname
             (setq varname (replace-regexp-in-string "^[0-9]+" "_" varname))))
  (save-excursion
    (let* ((case-replace nil)
           (case-fold-search nil)
           (assignment (delete-and-extract-region start end))
           (indent (make-string (current-indentation) 32))
           (statement (concat varname " = " assignment "\n")))
      (deactivate-mark)
      (insert varname)
      (if (equal (upcase varname) varname)
          ;; global
          (cond ((py:in-class-p)
                 (py:beginning-of-class 1)
                 (insert statement "\n"))
                ((py:in-def-p)
                 (py:beginning-of-def 1)
                 (beginning-of-line)
                 (insert statement "\n"))
                (t
                 (beginning-of-line)
                 (insert indent statement)))
        (beginning-of-line)
        (insert indent statement))
      (when (and (save-excursion (search-forward assignment nil 'noerr))
                 (y-or-n-p (concat "replace " assignment " => " varname)))
        (query-replace assignment varname)))))



(defun py:is-acceptable-varname (names) ;[2013/11/04]
  "NAMES"
  )

(defun py:is-pep8-varname (names) ;[2013/11/04]
  "NAMES"
  )

(defun py:is-acceptable-defname (names) ;[2013/11/04]
  "NAMES"
  )

(defun py:is-pep8-defname (names) ;[2013/11/04]
  "NAMES"
  )

(defun py:convert-varname (names) ;[2013/11/04]
  "NAMES"
  )

(defun py:convert-defname (names) ;[2013/11/04]
  "NAMES"
  )

(defun py:convert-classname (names) ;[2013/11/04]
  "NAMES"
  )

(defun py:convert- (ARGS) ;[2013/11/04]
  "ARGS"
  )

(defun py:auto-colon-return-on-line ()
  "Auto insert ':' and newline at end of lines."
  (interactive "*")
  (py:auto-colon)
  (py:return-on-line))

(defun py:return-on-line()
  (interactive "*")
  (end-of-line)
  (newline-and-indent))

(defun py:newline ()
  "Auto insert ':' and newline."
  (interactive)
  (cond ((looking-at "\\([ \t]+$\\|\n\\)")
         (py:auto-colon)
         (end-of-line)
         ;; (py-newline-and-indent)
         (newline-and-indent)
         )
        (t (newline-and-indent)
           ;; (py-newline-and-indent)
           )))


(defun py:refact-join-multi-assign () ;[2013/11/27]
  ""
  (interactive "*")
  (beginning-of-line)
  (join-line)
  (insert ", ")
  (save-restriction
    (narrow-to-region (save-excursion (back-to-indentation) (point))
                      (line-end-position))
    ;; delete all holizontal space
    (save-excursion
      (beginning-of-line)
      (delete-horizontal-space)
      (while (re-search-forward "[[:blank:]]" nil 'noerror)
        (when (not (py:at-string|comment-p))
          (delete-horizontal-space))))

    (let ((start (point))
          (end (progn (re-search-forward "=" nil 'noerror)
                      (while (looking-back "=")
                        (delete-char -1))
                      (point)))
          string)
      (setq string (delete-and-extract-region start end))
      (re-search-backward "=" nil 'noerr)
      (unless (looking-back ",")
        (insert ","))
      (insert string))
    (beginning-of-line)
    (save-excursion
      (while (re-search-forward "," nil 'noerror)
        (unless (or (py:at-string|comment-p)
                    (looking-at "[[:blank:]]"))
          (insert " "))))
    (save-excursion
      (while (re-search-forward "=" nil 'noerror)
        (unless (or (py:at-string|comment-p)
                    (looking-at "[[:blank:]]"))
          (when (looking-back "=") ;for replace
            (replace-match " = ")))))))


;;;; TEST
;;;;
(defun py:in-parameter-p () ;[2014/02/25]
  ""
  (save-excursion
    (let ((orig (point))
          (region (py:region-def-parameter)))
      (and region
           (< (car region) orig)
           (< orig (cdr region))))))



(provide '__python__)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; __python__.el ends here
