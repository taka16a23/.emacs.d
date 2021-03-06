;;; moccur-setup.el ---   Setting for moccur
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 01:25:50 2012 (+0900)
;; Last-Updated:2015/10/19 16:56:30 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  (require 'bind-key "bind-key" 'noerr)
  (require 'color-moccur "color-moccur" 'noerr)
  (require 'moccur-edit "moccur-edit" 'noerr)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function t1-ctl-x-bind-keys "t1-bind-key")
  (defvar moccur-edit-mode-map nil))

(require 't1-bind-key "t1-bind-key" 'noerr)
(require 'bind-key "bind-key" 'noerr)

(use-package color-moccur
  ;; :disabled
  :defer
  :commands
  (moccur-grep
   moccur-grep-find
   isearch-moccur
   isearch-moccur-all
   occur-by-moccur
   moccur
   dmoccur
   dired-do-moccur
   Buffer-menu-moccur
   moccur-narrow-down
   grep-buffers
   search-buffers
   moccur-edit-mode-in
   )
  :init
  (t1-ctl-x-bind-keys '(("o" . moccur)
                        ("M-o" . dmoccur)))
  :config
  (message "Loading \"color-moccur\"")
  (bind-keys :map moccur-mode-map
             ("C-k" . moccur-prev)
             ("w" . moccur-edit-mode-in))
  (custom-set-variables
   '(moccur-split-word t)
   '(kill-buffer-after-dired-do-moccur t)
   '(dmoccur-list '(("inits" (my-inits-dir-get) ("\\.el$") nil)
                    ("joined" (my-var-dir-get) (joinone-file-name) nil)
                    ("code" (my-data-dir-join (concat "code" (".*")) nil))
                    ("kill-ring" (my-data-dir-join "log")
                     ("kill-ring-log.*") nil)))
   '(*moccur-buffer-name-exclusion-list*
     '(".+TAGS.+" "*Completions*" "*Messages*"))
   )
  (use-package moccur-edit
    ;; :disabled
    :defer
    :commands
    (moccur-edit-finish-edit
     moccur-edit-remove-change
     moccur-edit-kill-all-change
     moccur-edit-mode-in)
    :init
    :config
    (message "Loading \"moccur-edit\"")
    (bind-keys :map moccur-edit-mode-map
               ("C-s" . moccur-edit-finish-edit)
               ("C-c C-c" . moccur-edit-finish-edit)
               ("C-c C-q" . moccur-edit-remove-change)
               ("C-c C-k" . moccur-edit-kill-all-change))
    )
  )



(provide 'moccur-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; moccur-setup.el ends here
