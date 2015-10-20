;;; jedi-setup.el ---   setting for jedi
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 05:06:17 (+0900)
;; Last-Updated:2015/10/21 00:30:04 (+0900)
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
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'python "python" 'noerr)
  (require 'use-package "use-package" 'noerr)
  (require 'package "package" 'noerr)
  (package-initialize)
  )

(use-package jedi
  ;; :disabled
  :defer
  :ensure t
  :commands jedi:setup
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  :config
  (message "Loading \"jedi\"")
  (custom-set-variables
   '(jedi:complete-on-dot t)
   '(jedi:tooltip-method 'nil)
   '(jedi:get-in-function-call-delay 300)
   '(jedi:key-goto-definition (kbd "C-c C-f"))
   '(jedi:key-show-doc (kbd "C-c C-x"))
   )
  (set-face-attribute 'jedi:highlight-function-argument nil :foreground "yellow")
  )

(use-package jedi-core
  ;; :disabled
  :defer
  :commands jedi:goto-definition jedi:show-doc
  :init
  :config
  (message "Loading \"jedi-core\"")
  (bind-keys :map python-mode-map
             ("C-c f" . jedi:goto-definition)
             ("C-c C-f" . jedi:goto-definition)
             ))



(provide 'jedi-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; jedi-setup.el ends here
