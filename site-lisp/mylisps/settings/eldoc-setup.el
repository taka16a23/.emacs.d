;;; eldoc-setup.el ---   Setting for eldoc
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:27:04 2012 (+0900)
;; Last-Updated:2015/10/18 17:06:56 (+0900)
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
  (require 'use-package "use-package" 'noerr))

(defun eldoc-emacs-lisp-mode-hook () ;[2015/10/18]
  ""
  (unless during-init-p
    (ignore-errors (eldoc-mode 1))))

(use-package eldoc
  ;; :disabled
  :defer 2
  :commands
  (eldoc-mode)
  :init
  (add-hook 'emacs-lisp-mode-hook 'eldoc-emacs-lisp-mode-hook)
  (add-hook 'lisp-interaction-mode-hook 'eldoc-mode)
  :config
  (message "Loading \"eldoc\"")
  (custom-set-variables
   '(eldoc-idle-delay 0.7)
   '(eldoc-echo-area-use-multiline-p t))
  (custom-set-faces
   '(eldoc-highlight-function-argument ((t (:foreground "yellow" :weight bold)))))
  )



(provide 'eldoc-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; eldoc-setup.el ends here
