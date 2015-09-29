;;; moccur_plugin_start.el --- functions for moccur
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 01:30:12 2012 (+0900)
;; Last-Updated: 2013/11/01 23:43:16 (+0900)
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
;; 2012/12/11    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require 'moccur-edit "moccur-edit" 'noerr))

;;;###autoload
(defun color-moccur-mode-custom-predefine ()
  "For `eval-after-load' color-moccur customize."
  (message "eval-after-load: \"color-moccur\" customizing..")
  (custom-set-variables
   '(moccur-split-word t)
   '(kill-buffer-after-dired-do-moccur t)
   '(dmoccur-list '(("start.d" my-start-dir ("\\.el$") nil)
                    ("joined" my-var-dir (joinone-file-name) nil)
                    ("code" (concat my-data-dir "code") (".*") nil)
                    ("kill-ring" (concat my-data-dir "log")
                     ("kill-ring-log.*") nil))))
  '(*moccur-buffer-name-exclusion-list*
    '(".+TAGS.+" "*Completions*" "*Messages*")))

;;;###autoload
(defun color-moccur-mode-predefine ()
  "For `eval-after-load' color-moccur function."
  (message "eval-after-load: \"color-moccur\" setting..")
  )

;;;###autoload
(defun color-moccur-mode-map-predefine ()
  "For color-moccur key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"color-moccur\" keymaping.."))
  (define-many-keys moccur-mode-map
    ("\C-k" 'moccur-prev)
    ("w" 'moccur-edit-mode-in)))

;;;###autoload
(defun moccur-edit-mode-custom-predefine ()
  "For `eval-after-load' moccur-edit customize."
  (message "eval-after-load: \"moccur-edit\" customizing..")
  ;; (custom-set-variables
  ;;  '())
  )

;;;###autoload
(defun moccur-edit-mode-predefine ()
  "For `eval-after-load' moccur-edit function."
  (message "eval-after-load: \"moccur-edit\" setting..")
  )

;;;###autoload
(defun moccur-edit-mode-map-predefine ()
  "For moccur-edit key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"moccur-edit\" keymaping.."))
  (define-many-keys moccur-edit-mode-map
    ("\C-s"     'moccur-edit-finish-edit)
    ("\C-c\C-c" 'moccur-edit-finish-edit)
    ("\C-c\C-q" 'moccur-edit-remove-change)
    ("\C-c\C-k" 'moccur-edit-kill-all-change)))



(provide 'moccur_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; moccur_plugin_start.el ends here
