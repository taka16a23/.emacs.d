;;; grep-setup.el ---   Setting for grep
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:18 2012 (+0900)
;; Last-Updated:2015/10/20 01:28:57 (+0900)
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
;;    Removed: Removed moccur
;;
;; 2012/12/10    Atami
;;    Moved: Moved functions to grep_plugin_start.el
;;    `color-moccur-mode-map-predefine', `color-moccur-mode-predefine'
;;    `moccur-edit-mode-predefine', `moccur-edit-mode-map-predefine'
;;    `grep-mode-predefine', `grep-mode-map-predefine'
;;    `grep-mode-hook-predefine'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'grep "grep" 'noerr)
  (require 'use-package "use-package" 'noerr))

(use-package grep
  ;; :disabled
  :defer
  :commands
  (find-grep grep-find)
  :init
  :config
  (message "Loading \"grep\"")
  (setq grep-host-defaults-alist nil)
  (custom-set-variables
   '(grep-find-command
     "find . -type f '!' -wholename '*/.svn/*' -print0 | xargs -0 -e grep -nH -e ")
   '(grep-edit-change-readonly-file t))
  (bind-keys :map grep-mode-map
             ("C-c C-c" . grep-edit-finish-save)
             ("C-c C-r" . grep-edit-remove-change)
             ("C-c C-a" . grep-edit-remove-all-change)
             ("n" . next-line)
             ("v" . next-line)
             ("k" . previous-line)
             ("d" . previous-line))
  (use-package grep-edit
    ;; :disabled
    ;; :defer
    :commands
    (grep-edit-finish-edit grep-edit-remove-change grep-edit-remove-all-change)
    :init
    (bind-keys :map grep-mode-map
               ("C-s" . grep-edit-finish-save))
    :config
    (message "Loading \"grep-edit\"")
    (defun grep-edit-finish-save (save) ;[2014/09/05]
      "SAVE"
      (interactive "p")
      (grep-edit-finish-edit)
      (when (or (= save 4) (y-or-n-p "Save some buffer? "))
        (let ((inhibit-read-only t))
          (save-some-buffers 'noquetion))))
    )
  )



(provide 'grep-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; grep-setup.el ends here
