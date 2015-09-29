;;; grep_plugin_start.el --- functions for grep
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 16:33:47 2012 (+0900)
;; Last-Updated: 2014/01/07 08:44:37 (+0900)
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
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require 'grep "grep" 'noerr))

;;;###autoload
(defun grep-mode-custom-predefine ()
  "For `eval-after-load' grep customize."
  (message "eval-after-load: \"grep\" customizing..")
  (setq grep-host-defaults-alist nil)
  (custom-set-variables
   '(grep-find-command
     "find . -type f '!' -wholename '*/.svn/*' -print0 | xargs -0 -e grep -nH -e ")
   '(grep-edit-change-readonly-file t))
  )

;;;###autoload
(defun grep-mode-predefine ()
  "For `eval-after-load' grep function."
  (message "eval-after-load: \"grep\" setting..")
  (require 'grep-edit)
  )

;;;###autoload
(defun grep-mode-map-predefine ()
  "For grep key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"grep\" keymaping.."))
  (define-many-keys grep-mode-map
    ("\C-c\C-c" 'grep-edit-finish-save      )
    ("\C-s"     'grep-edit-finish-save      )
    ("\C-c\C-r" 'grep-edit-remove-change    )
    ("\C-c\C-a" 'grep-edit-remove-all-change)
    ("n"        'next-line)
    ("v"        'next-line)
    ("k"        'previous-line)
    ("d"        'previous-line)
    ))

;;;###autoload
(defun grep-edit-mode-predefine ()
  "For `eval-after-load' grep-edit function."
  (message "Loading grep-edit..")
  )



(provide 'grep_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; grep_plugin_start.el ends here
