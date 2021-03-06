;;; elisp-mode-bind-key-setup.el ---    Setting for Emacs Lisp mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Last-Updated:2015/10/18 21:59:39 (+0900)
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


(require 'bind-key "bind-key" 'noerr)

(bind-keys :map emacs-lisp-mode-map
           ("C-p" . beginning-of-defun)
           ("C-b" . end-of-defun)
           ("M-." . end-of-defun)
           ("M-," . beginning-of-defun)
           ("C-m" . default-indent-new-line)
           ([C-return] . open-line-indent)
           ;; Document
           ("C-c h" . describe-function)
           ("C-c C-h" . describe-function)
           ("C-c d" . describe-function)
           ("C-c C-x" . describe-function)
           ("C-c C-v" . describe-variable)
           ;; Go definitions
           ("C-c f" . find-function-at-point)
           ("C-c C-f" . find-function-at-point)
           ("C-c v" . find-variable-at-point)
           ;; Comment
           ;; Other
           ("C-c C-e C-e" . eval-last-sexp)
           ("C-c C-e C-r" . eval-region)
           ("C-c C-e C-b" . eval-buffer)
           )

(bind-keys :map lisp-interaction-mode-map
           ([(meta return)] . eval-print-last-sexp)
           ("C-j" . backward-char)
           ("C-m" . newline-and-indent)
           ([C-return] . open-line-indent)
           ("C-c d" . find-function-at-point)
           ("C-c C-x" . find-function-at-point)
           ("C-c f" . find-function-at-point)
           ("C-c C-f" . find-function-at-point)
           ("C-c v" . find-variable-at-point)
           ("C-c C-v" . describe-variable)
           (")" . right-parentheses-indent))



(provide 'elisp-mode-bind-key-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; elisp-mode-bind-key-setup.el ends here
