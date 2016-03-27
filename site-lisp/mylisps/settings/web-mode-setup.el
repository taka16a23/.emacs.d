;;; web-mode-setup.el --- setting for web-mode.el
;;
;; Copyright (C) 2016 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2016/01/08 09:55:26 (+0900)
;; Last-Updated:2016/01/08 10:10:16 (+0900)
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
  (require 'use-package "use-package" 'noerr)
  (require 'bind-key "bind-key" 'noerr))

(use-package web-mode
  ;; :disabled
  :defer
  ;; :ensure t
  :commands
  :init
  :mode (
         ;; ("\\.js\\'" . web-mode)
         ("\\.html\\'" . web-mode)
         ;; ("\\.jsn\\'" . web-mode)
         ;; ("\\.css\\'" . web-mode)
         )
  :config
  (message "Loading \"web-mode\"")
  (custom-set-variables
   '(web-mode-markup-indent-offset 2)
   '(web-mode-code-indent-offset 2)
   '(web-mode-css-offset 2)
   '(web-mode-script-offset 2)
   '(web-mode-java-offset 2)
   )
  :bind
  )



(provide 'web-mode-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; web-mode-setup.el ends here
