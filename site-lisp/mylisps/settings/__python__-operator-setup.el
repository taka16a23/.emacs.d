;;; __python__-operator-setup.el ---    setting for org mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Last-Updated:2015/10/21 03:15:08 (+0900)
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
  (require 'python "python" 'noerr))

(require 'bind-key "bind-key" 'noerr)

(use-package __python__operator
  ;; :disabled
  :defer
  :commands
  py:= py:+ py:* py:- py:> py:< py:/ py:& py:% py:\, py:| py:? py:: py:transpose-ope
  :init
  :config
  (message "Loading \"__python__operator\"")
  (bind-keys :map python-mode-map
             ("=" . py:=)
             ("+" . py:+)
             ("*" . py:*)
             ("-" . py:-)
             (">" . py:>)
             ("<" . py:<)
             ("/" . py:/)
             ("&" . py:&)
             ("%" . py:%)
             ("," . py:\,)
             ("|" . py:|)
             ("?" . py:?)
             (":" . py::)
             ("C-e C-t" . py:transpose-ope)
             ("C-e t" . py:transpose-ope)
             )
  )



(provide '__python__-operator-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; __python__-operator-setup.el ends here