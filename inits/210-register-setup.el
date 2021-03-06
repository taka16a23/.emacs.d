;;; register-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/15 04:52:05 (+0900)
;; Last-Updated:2015/10/20 02:20:58 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(eval-when-compile
  (require 'bind-key "bind-key" 'noerr)
  (require 'use-package "use-package" 'noerr)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function t1-edit-bind-keys "t1-bind-key")
  (declare-function t1-ctl-x-bind-keys "t1-bind-key")
  )

(defun insert-register-disable-exchange (register) ;[2014/06/12]
  "REGISTER"
  (interactive "*cInsert register: ")
  (insert-register register t)
  )

(use-package register
  ;; :disabled
  ;; :defer 1
  :commands
  (copy-to-register insert-register-disable-exchange)
  :init
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (t1-edit-bind-keys
   '(("C-c" . copy-to-register)
     ("c" . copy-to-register)
     ("C-v" . insert-register-disable-exchange)
     ("v" . insert-register-disable-exchange)))
  (t1-ctl-x-bind-keys
   '(("C-SPC" . point-to-register)
     ("M-SPC" . jump-to-register)
     ))
  :config
  (message "Loading \"register\"")
  )



(provide 'register-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; register-setup.el ends here
