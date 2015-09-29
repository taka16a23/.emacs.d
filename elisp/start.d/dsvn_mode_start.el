;;; dsvn_mode_start.el --- functions for dsvn
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 18:33:01 2012 (+0900)
;; Last-Updated: 2013/11/03 01:44:26 (+0900)
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
;; 2013/09/14    Atami
;;    Added: `svn--mark-a-lot' mark a lot function by regexp.
;;    `svn-?-mark-a-lot', `svn-M-mark-a-lot', `svn-A-mark-a-lot', `svn-!-mark-a-lot'
;;
;; 2012/12/10    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require 'dsvn "dsvn" 'noerr))

;;;###autoload
(defun dsvn-mode-custom-predefine ()
  "For `eval-after-load' dsvn customize."
  (message "eval-after-load: \"dsvn\" customizing..")
  (custom-set-variables
   '(svn-restore-windows t))
  )

;;;###autoload
(defun dsvn-mode-predefine ()
  "For `eval-after-load' dsvn function."
  (message "eval-after-load: \"dsvn\" setting..")
  )

;;;###autoload
(defun dsvn-mode-map-predefine ()
  "For dsvn key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"dsvn\" keymaping.."))
  (define-many-keys svn-status-mode-map
    (    "U" 'svn-unmark-all)
    (    "k" 'svn-previous-file)
    ("\C-c?" 'svn-?-mark-a-lot)
    ("\C-cM" 'svn-M-mark-a-lot)
    ("\C-cA" 'svn-A-mark-a-lot)
    ("\C-c!" 'svn-!-mark-a-lot)
    ))

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


(provide 'dsvn_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; dsvn_mode_start.el ends here
