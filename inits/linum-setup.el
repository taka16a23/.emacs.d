;;; linum-setup.el ---   lines number
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:22 2012 (+0900)
;; Last-Updated:2015/10/19 15:23:19 (+0900)
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
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function t1-ctl-x-bind-keys "t1-bind-key"))

(use-package linum
  ;; :disabled
  :defer
  :commands
  (linum-mode)
  :init
  (t1-ctl-x-bind-keys
   '(("C-l" . linum-mode)))
  :config
  (message "Loading \"linum\"")
  (custom-set-variables
   '(linum-format "%3d ")
   '(linum-delay  t))
  (use-package linum-off
    ;; :disabled
    ;; :defer
    :init
    :config
    (message "Loading \"linum-off\"")
    (add-to-list 'linum-disabled-modes-list 'image-mode)
    (add-to-list 'linum-disabled-modes-list 'w3m-mode)
    )
  )



(provide 'linum-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; linum-setup.el ends here
