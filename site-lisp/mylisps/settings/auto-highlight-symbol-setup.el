;;; auto-highlight-symbol-setup.el ---   setting for auto-highlight-symbol
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 16:07:41 (+0900)
;; Last-Updated:2015/10/21 03:30:12 (+0900)
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
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'bind-key "bind-key" 'noerr)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function t1-edit-bind-keys "t1-bind-key")
  (require 'auto-highlight-symbol "auto-highlight-symbol" 'noerr)
  (require 'package "package" 'noerr)
  (package-initialize)
  )

(defun py:def-start-point () ;[2015/07/25]
  ""
  (car (py:region-def)))

(defun py:def-end-point () ;[2015/07/25]
  ""
  (cdr (py:region-def)))

(defun py:class-start-point () ;[2015/07/25]
  ""
  (car (py:region-class)))

(defun py:class-end-point () ;[2015/07/25]
  ""
  (cdr (py:region-class)))

;;;###autoload
(defun ahs-edit-mode-tmp-whole-buffer () ;[2015/07/25]
  "ARG
%OPTIONAL
TEMPORARY"
  (interactive)
  (ahs-onekey-edit-function 'whole-buffer nil)
  )

;;;###autoload
(defun py:ahs-edit-mode-def-region () ;[2015/07/25]
  ""
  (interactive)
  (ahs-onekey-edit-function 'pythondef nil)
  )

;;;###autoload
(defun py:ahs-edit-mode-class-region () ;[2015/07/25]
  ""
  (interactive)
  (ahs-onekey-edit-function 'pythonclass nil))

(use-package auto-highlight-symbol
  ;; :disabled
  :defer 30
  :ensure t
  :commands
  (auto-highlight-symbol-mode
   global-auto-highlight-symbol-mode
   ahs-edit-mode
   ahs-change-range
   ahs-called-interactively-p
   ahs-idle-function
   ahs-onekey-edit-function)
  :init
  (t1-edit-bind-keys
   '(("h" . ahs-edit-mode)
     ("C-h" . ahs-edit-mode)
     ("H" . ahs-edit-mode-tmp-whole-buffer)))
  :config
  (message "Loading \"auto-highlight-symbol\"")
  (custom-set-variables
   '(ahs-log-echo-area-only t)
   '(ahs-decorate-log nil)
   '(ahs-select-invisible 'skip))
  (ahs-regist-range-plugin
   pythondef
   '((name    . "python def area")
     (lighter . "HS")
     (face    . ahs-plugin-defalt-face)
     (start   . py:def-start-point)
     (end     . py:def-end-point))
   "Python def area")
  (ahs-regist-range-plugin
   pythonclass
   '((name    . "python class area")
     (lighter . "HS")
     (face    . ahs-plugin-defalt-face)
     (start   . py:class-start-point)
     (end     . py:class-end-point))
   "Python class area")
  (define-key auto-highlight-symbol-mode-map (kbd "M--") 'my-forward-whitespace)
  (face-spec-set
   'ahs-plugin-defalt-face '((t (:forground "Black" :background "skyblue"))))
  (global-auto-highlight-symbol-mode 1)
  )



(provide 'auto-highlight-symbol-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-highlight-symbol-setup.el ends here
