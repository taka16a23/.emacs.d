;;; dsvn-setup.el ---   svn status mode setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:27:59 2012 (+0900)
;; Last-Updated:2015/10/19 13:35:07 (+0900)
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
;; 2012/12/10    Atami
;;    Moved: Moved functions to dsvn_mode_start.el
;;    `dsvn-mode-predefine', `dsvn-mode-map-predefine'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'package "package" 'noerr)
  (package-initialize)
  )

(use-package dsvn
  ;; :disabled
  :defer
  :ensure t
  :commands
  (svn-status svn-update)
  :init
  :config
  (message "Loading \"dsvn\"")
  (custom-set-variables
   '(svn-restore-windows t))
  (bind-keys :map svn-status-mode-map
             ("U" . svn-unmark-all)
             ("k" . svn-previous-file)
             ("C-c ?" . svn-?-mark-a-lot)
             ("C-c M" . svn-M-mark-a-lot)
             ("C-c A" . svn-A-mark-a-lot)
             ("C-c !" . svn-!-mark-a-lot))
  (defadvice svn-status
      (before before-delelte-other-window activate)
    (e2wm:stop-management)
    (delete-other-windows)
    )
  ;; (progn (ad-disable-advice 'svn-status 'before 'before-delelte-other-window) (ad-update 'svn-status))
  )

(defun svn--mark-a-lot (regexp)
  "Mark a lot line by regexp.
REGEXP: regular expression."
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward regexp nil 'noerror)
      (svn-set-mark (line-beginning-position) t))))

(defun svn-?-mark-a-lot ()
  "Mark all ? flags."
  (interactive)
  (svn--mark-a-lot "^[ \t].+\\?[ \t]"))

(defun svn-M-mark-a-lot ()
  "Mark all M flags."
  (interactive)
  (svn--mark-a-lot "^[ \t].+M[ \t]"))

(defun svn-A-mark-a-lot ()
  "Mark all A flags."
  (interactive)
  (svn--mark-a-lot "^[ \t].+A[ \t]"))

(defun svn-!-mark-a-lot ()
  "Mark all ! flags."
  (interactive)
  (svn--mark-a-lot "^[ \t].+\\![ \t]"))



(provide 'dsvn-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; dsvn-setup.el ends here
