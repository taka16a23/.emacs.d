;;; switch-buffer-setup.el ---    key bind setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:06 2012 (+0900)
;; Last-Updated:2015/10/17 02:30:55 (+0900)
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
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 't1-bind-key "t1-bind-key" 'noerr))

(use-package switch-buffer
  ;; :disabled
  :defer
  :commands
  (launch-or-switch-term
   switch-scratch
   switch-test_start
   t1-switch-04_bindings_start
   switch-message
   switch-allinone
   previous-buffer
   find-file-conf
   switch-dired
   switch-junk
   switch-start-dir
   switch-hotstring
   switch-ipython
   switch-hotstring
   )
  :init
  (t1-switch-bind-keys
   '(("_" . launch-or-switch-term)
     ("!" . launch-or-switch-term)
     ("\"" . launch-or-switch-term)
     ("#" . launch-or-switch-term)
     ("$" . launch-or-switch-term)
     ("%" . launch-or-switch-term)
     ("&" . launch-or-switch-term)
     ("'" . launch-or-switch-term)
     ("(" . launch-or-switch-term)
     (")" . launch-or-switch-term)
     ("1" . launch-or-switch-term)
     ("2" . launch-or-switch-term)
     ("3" . launch-or-switch-term)
     ("4" . launch-or-switch-term)
     ("5" . launch-or-switch-term)
     ("6" . launch-or-switch-term)
     ("7" . launch-or-switch-term)
     ("8" . launch-or-switch-term)
     ("9" . launch-or-switch-term)
     ;;
     ("C-s" . switch-scratch)
     ("C-t" . switch-test_start)
     ("C-b" . t1-switch-04_bindings_start)
     ("b" . t1-switch-04_bindings_start)
     ("m" . switch-message)
     ("a" . switch-allinone)
     ("C-a" . switch-allinone)
     ;; ("C-b" . next-buffer)
     ;; ("C-f" . previous-buffer)
     ("@" . find-file-conf)
     ("C-@" . find-file-conf)
     ("d" . switch-dired)
     ("C-x" . switch-dired)
     ("C-j" . switch-junk)
     ("j" . switch-junk)
     ("C-p" . switch-snippets)
     ("p" . switch-snippets)
     ("C-u" . register-buffer)
     ("C-e" . register-buffer)
     ("i" . switch-ipython)
     ("I" . switch-ipython)
     ("C-i" . switch-ipython)
     ("M-s" . switch-start-dir)
     ("C-h" . switch-hotstring)
     ("h" . switch-hotstring)
     ("H" . switch-hotstring)
     ))
  :config
  (message "Loading \"switch-buffer\"")
  )



(provide 'switch-buffer-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; switch-buffer-setup.el ends here
