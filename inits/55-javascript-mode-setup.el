;;; javascript-mode-setup.el ---   javascript mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:22 2012 (+0900)
;; Last-Updated:2021/03/20 09:29:45 (+0900)
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
  (require 'll-debug "ll-debug" 'noerr)
  )

(use-package javascript
  ;; :disabled
  :defer
  :commands javascript-mode
  :mode (("\\.js\\'" . javascript-mode)
         ("\\.as\\'" . javascript-mode)
         ("\\.json\\'" . javascript-mode)
         ("\\.jsn\\'" . javascript-mode))
  :init
  (require 'll-debug "ll-debug" 'noerr)
  (ll-debug-register-mode 'javascript-mode
                          "console.log(" ")"
                          '(nil "\"" (ll-debug-create-next-debug-string) "\"")
                          '(nil "\"" (ll-debug-create-next-debug-string) "\""
                                ("Variable name: ""\"  " str "\"" str)))
  (ll-debug-register-mode 'js-mode
                          "console.log(" ")"
                          '(nil "\"" (ll-debug-create-next-debug-string) "\"")
                          '(nil "\"" (ll-debug-create-next-debug-string) "\""
                                ("Variable name: ""\"  " str "\"" str)))
  :config
  (message "Loading \"javascript\"")
  (custom-set-variables
   '(js-indent-level 2))
  )



(provide 'javascript-mode-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; javascript-mode-setup.el ends here
