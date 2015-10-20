;;; rotate-text-setup.el ---   setting for rotate-text
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/01/15 21:12:31 (+0900)
;; Last-Updated:2015/10/19 15:38:15 (+0900)
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
;; 2013/01/15    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function t1-edit-bind-keys "t1-bind-key")
  (require 'rotate-text "rotate-text" 'noerr))

(defun rotate-text-emacs-lisp-mode-hook () ;[2015/10/18]
  ""
  (dolist (el '(("t" "nil")
                ("message" "princ")
                ("forward" "backward")
                ("add" "remove")
                ("defvar" "setq")
                ("car" "cdr")))
    (add-to-list 'rotate-text-rotations el))
  )

(use-package rotate-text
  ;; :disabled
  :defer
  :commands
  (rotate-word-at-point)
  :init
  (add-hook 'emacs-lisp-mode-hook 'rotate-text-emacs-lisp-mode-hook)
  (t1-edit-bind-keys
   '(("C-r" . rotate-word-at-point)))
  :config
  (message "Loading \"rotate-text\"")
  )



(provide 'rotate-text-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; rotate-text-setup.el ends here
