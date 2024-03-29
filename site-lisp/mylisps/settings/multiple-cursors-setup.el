;;; multiple-cursors-setup.el ---   Setting for multiple-cursors
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.1
;; Created:      Thu Dec 13 00:18:38 2012 (+0900)
;; Last-Updated:2015/10/19 15:36:15 (+0900)
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
;;  installation: git clone https://github.com/magnars/multiple-cursors.el.git
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;; 1.1 2015/09/19    Atami
;;    Added: el-get bundle
;;
;; 1.0 2012/12/13    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'multiple-cursor "multiple-cursor" 'noerr)
  (declare-function my-data-dir-join "environment-setup")
  )

(declare-function package-bundle "package-setup.el")
(when (require 'package-setup "package-setup" 'noerr)
  (ignore-errors (package-bundle 'multiple-cursors)))

(defun my-mc/next-line ()
  "For multiple-cursors `next-line'."
  (interactive)
  (forward-line 1))

(defun my-mc/previous-line ()
  "For multiple-cursors `previous-line'."
  (interactive)
  (forward-line -1))

(defun my-mc/forward-char ()
  "For multiple-cursors `forward-char'."
  (interactive)
  (forward-char))

(defun my-mc/backward-char ()
  "For multiple-cursors `backward-char'."
  (interactive)
  (backward-char))

(use-package multiple-cursors-core
  ;; :disabled
  :defer
  :init
  (setq mc/list-file (my-data-dir-join "multi-cursor-list.el"))
  :config
  (message "Loading \"multiple-cursors\"")
  (require 'environment-setup "environment-setup" 'noerr)
  (setq mc/cmds-to-run-once
        (append '(my-mc/next-line
                  my-mc/previous-line
                  my-mc/forward-char
                  my-mc/backward-char)
                mc/cmds-to-run-once))
  (bind-keys :map mc/keymap
             ("C-M-n" . my-mc/next-line)
             ("C-M-k" . my-mc/previous-line)
             ("C-M-l" . my-mc/forward-char)
             ("C-M-j" . my-mc/backward-char))
  )

(use-package mc-mark-more
  ;; :disabled
  :defer
  ;; :commands
  :init
  :config
  (message "Loading \"mc-mark-more\"")
  :bind
  (("M-@" . mc/mark-next-like-this)
   ("M-<mouse-1>" . mc/add-cursor-on-click)
   ("M-`" . mc/mark-previous-like-this)
   ))

(use-package mc-edit-lines
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"mc-edit-lines\"")
  :bind
  (("s-s" . mc/edit-lines)
   ))



(provide 'multiple-cursors-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; multiple-cursors-setup.el ends here
