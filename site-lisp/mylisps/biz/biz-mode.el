;;; biz-mode.el --- For biz mode
;;
;; Copyright (C) 2017 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version: 1.0
;; Created: 2017/12/23 20:05:49 (+0900)
;; Last-Updated:2018/01/01 00:59:07 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(require 'generic "generic" 'noerr)


;;;; 定数
;;

(defconst line-start-curly-brace
  (rx line-start (* blank) symbol-start "{" symbol-end)
  "Regexp for match line start curly brace. ({)"
  )


;;;; 関数
;;
(defun refact-to-newline-curly-brace () ;[2018/01/01]
  "文字列の末尾にある波括弧を改行します"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "{" nil 'noerror)
      (when (and (not (member (what-face-at-point) '(font-lock-string-face)))
                 (not (looking-back line-start-curly-brace))
                 )
        (backward-char)
        (default-indent-new-line)
        (forward-char)
        ))))


(define-derived-mode biz-mode prog-mode "Biz")

(define-generic-mode biz-mode

  ;; comment
  '(("/*" . "*/"))

  ;; highlight keyword
  '("peekevent" "break" "case"
    "catch" "continue" "default" "delete"
    "do" "else" "finally" "for"
    "function" "if" "in" "instanceof"
    "new" "return" "switch" "this"
    "throw" "try" "typeof" "var"
    "void" "while" "with" "abstract"
    "as" "class" "const" "export"
    "extends" "false" "final" "implements"
    "import" "interface" "is" "namespace"
    "null" "package" "private" "public"
    "static" "super" "true" "use"
    "debugger" "enum" "goto" "native"
    "protected" "synchronized" "throws" "transient"
    "volatile"

    )

  ;; syntax color
  '(
    ("String" . font-lock-type-face)
    ("tes" . font-lock-type-face)
    )

  ;; file name for auto mode when open it
  '("\\.crs\\'")

  ;; hook function
  nil

  ;; Description mode
  "Major mode for biz designer"

  )

(provide 'biz-mode)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; biz-mode.el ends here
