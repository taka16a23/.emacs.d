;;; javascript-mode-setup.el ---   javascript mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:22 2012 (+0900)
;; Last-Updated:2022/03/06 03:33:23 (+0900)
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
;;    Moved: Moved functions to javascript_mode_start.el
;;    `javascript-mode-predefine', `javascript-mode-map-predefine'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'js "js" 'noerr)
  (require 'll-debug "ll-debug" 'noerr)
  (require 'hotstring "hotstring" 'noerr)
  )

(defun refactoring-js-mode-hook () ;[2021/08/10]
  ""
  (add-hook 'before-save-hook 'whitespace-cleanup 'append 'local)
  )

(use-package js
  ;; :disabled
  :defer
  :commands js-mode
  :mode (("\\.js\\'" . js-mode)
         ("\\.as\\'" . js-mode)
         ("\\.json\\'" . js-mode)
         ("\\.jsn\\'" . js-mode))
  :init
  :bind
  (("M-o" . ll-debug-insert)
   ("C-x M-o" . ll-debug-revert)
   )
  :config
  (message "Loading \"javascript\"")
  (custom-set-variables
   '(js-indent-level 2))
  ;; rotate-text
  (dolist (el '(("true"     "false")
                ))
    (add-to-list 'rotate-text-rotations el))
  ;; hook
  (add-hook 'js-mode-hook 'refactoring-python-mode-hook)
  (add-hook 'js-mode-hook 'hotstring-mode)
  )



(provide 'javascript-mode-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; javascript-mode-setup.el ends here
