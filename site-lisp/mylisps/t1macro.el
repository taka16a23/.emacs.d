;;; t1macro.el --- my macro
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/10/26 23:44:25 (+0900)
;; Last-Updated: 2013/11/13 10:32:35 (+0900)
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
;; 2013/11/13    Atami
;;    Added: `save-beginning-buffer'
;;
;; 2013/10/26    Atami
;;    initialize
;;
;;
;;; Code:


(defmacro define-many-keys (mode-map &rest body)
  "In KEYMAP, define a lot of key.
MODE-MAP:
BODY:
ex.. (define-many-keys global-map (\"n\" 'next-line) (\"p\" 'previous-line))"
  `(progn
     ,@(mapcar #'(lambda (arg)
                   `(define-key ,mode-map ,@arg)) body)))

(defmacro run-hooks-after-load (file hook)
  "Run hooks `eval-after-load'.
FILE: file name.
HOOK: variable as hooks."
  `(eval-after-load ,file
     '(progn
        (when (boundp ,hook)
          (run-hooks ,hook))
        )))

(defmacro save-excursion-restriction (&rest body)
  "Macro as `save-excursion' and `save-restriction'.
BODY:"
  `(save-excursion
     (save-restriction
       ,@body)))

(defmacro save-beginning-buffer (&rest body)
  "Macro as `save-excursion' and `save-restriction'.
`widen', `goto-char' to `point-min'.
BODY:"
  `(save-excursion
     (save-restriction
       (widen)
       (goto-char (point-min))
       ,@body)))

(defmacro append-to-list (to lst)
  "More `add-to-list'.
TO: variable
LST: list"
  `(setq ,to (append ,lst ,to)))

(defmacro defvar-local (var val &optional docstring)
  "Define VAR as a buffer-local variable with default value VAL.
Like `defvar' but additionally marks the variable as being automatically
buffer-local wherever it is set."
  (declare (debug defvar) (doc-string 3))
  `(progn
     (defvar ,var ,val ,docstring)
     (make-variable-buffer-local ',var)))



(provide 't1macro)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; t1macro.el ends here
