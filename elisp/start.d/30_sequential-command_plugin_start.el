;;; 30_sequential-command_plugin_start.el --- sequential command
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:06 2012 (+0900)
;; Last-Updated: 2013/11/01 22:57:11 (+0900)
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
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'sequential-command nil 'noerr))

(autoload 'seq-count "sequential-command")

;; seq-set-mark
(define-sequential-command
  seq-set-mark
  cua-set-mark mark-word mark-sexp
  ;; mark-line
  mark-defun mark-paragraph)

;; python
(define-sequential-command
  py-seq-set-mark
  cua-set-mark mark-word mark-sexp
  py-mark-line py-mark-def-or-class py-mark-block-or-clause)

(eval-after-load 'org
  '(progn
	 (require 'sequential-command-config)
	 (define-key org-mode-map "\C-h" 'org-seq-home)
	 (define-key org-mode-map "\C-_" 'org-seq-end)
	 ))


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 30_sequential-command_plugin_start.el ends here
