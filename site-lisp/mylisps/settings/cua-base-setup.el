;;; cua-base-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/14 12:03:44 (+0900)
;; Last-Updated:2015/10/18 17:44:51 (+0900)
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
  (require 'edebug "edebug" 'noerr)
  (declare-function cua-base "cua-base"))

(use-package cua-base
  ;; :disabled
  :defer 1
  :commands
  (cua--prefix-override-handler)
  :init
  (common-view-map-many-register
   '(("b" . cua-scroll-up)
     ("p" . cua-scroll-down)
     ("e" . cua-scroll-down)
     ("C-M-n" . cua-scroll-up)
     ("C-M-k" . cua-scroll-down)))
  :config
  (message "Loading \"cua-base\"")
  (custom-set-variables
   '(cua-mode t nil (cua-base)))
  (define-key cua-global-keymap [C-return] 'open-line-indent)
  :bind
  (([(control meta ?\s)] . cua-set-rectangle-mark))
  )

(defun open-line-indent (n)
  (interactive "*p")
  (open-line n)
  (when (member major-mode '(emacs-lisp-mode
                             lisp-mode lisp-interaction-mode
                             clojure-mode    scheme-mode
                             haskell-mode    ruby-mode
                             rspec-mode      ;python-mode
                             c-mode          c++-mode
                             objc-mode       latex-mode
                             ;; plain-tex-mode
                             ))
    (save-excursion
      (forward-line n)
      (indent-for-tab-command))))



(provide 'cua-base-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; cua-base-setup.el ends here
