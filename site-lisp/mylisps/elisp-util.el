;;; elisp-util.el ---    Setting for Emacs Lisp mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Last-Updated:2015/10/18 21:58:08 (+0900)
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


;;;###autoload
(defun t1-elisp-find-tag ()
  "In Emacs Lisp mode, one of these functions is called:
`find-library', `find-variable', `find-face-definition',
`find-function' and `find-tag'."
  (interactive)
  (call-interactively
   (let ((symbol (variable-at-point t))
         (variable (variable-at-point))
         (function (function-called-at-point)))
     (cond
      ((or (eq function 'require)
           (eq function 'featurep))
       'find-library)
      ((and (symbolp variable)
            (boundp variable))
       'find-variable)
      ((and (symbolp symbol)
            (facep symbol))
       'find-face-definition)
      ((and (fboundp function)
            (eq symbol function))
       'find-function)
      (t
       'find-tag)))))

;;;; right parentheses and indent
;;;###autoload
(defun right-parentheses-indent (n)
  "Insert right-parentheses then indent.
N"
  (interactive "*p")
  (if mark-active
      (save-excursion
        (let ((start (region-beginning))
              (end (region-end)))
          (deactivate-mark)
          (goto-char end)
          (insert ")")
          (goto-char start)
          (insert "(")))
    (self-insert-command n)
    (indent-for-tab-command)
    ))



(provide 'elisp-util)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; elisp-util.el ends here
