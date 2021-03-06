;;; c-mode-setup.el ---   Setting for c mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:16 2012 (+0900)
;; Last-Updated:2015/10/15 02:34:08 (+0900)
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
;;    Moved: Moved functions to c_mode_start.el
;;    `flymake-cc-init', `c-mode-common-hook-predefine'
;;    `gtags-mode-predefine'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  )

(require 'init-loader "init-loader" 'noerr)
(require 'environment-setup "environment-setup" 'noerr)
(init-loader-load (my-inits-dir-join "c"))

(use-package cc-mode
  ;; :disabled
  :defer
  :init

  :config
  (message "Loading \"cc-mode\"")
  (custom-set-variables
   '(c-basic-offset 2)
   '(tab-width 2)
   '(indent-tabs-mode nil)
   '(fill-column      80))
  (cc-coding-style)
  (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode 'append)
  (add-hook 'c++-mode-hook 'hs-minor-mode 'append)
  (add-hook 'c++-mode-hook 'hide-ifdef-mode 'append)
  (add-hook 'c++-mode-hook 'gtags-mode 'append)
  (bind-keys :map c-mode-map
             ("C-M-h" . windmove-left)
             (" ." . ac-complete-gccsense) ;(kbd "C-c .")
             ("(" . t1-parence))
  (bind-keys :map c-mode-base-map
             ("C-c C-c" . nil)
             ("C-c C-q" . quickrun)
             ("C-cq" . quickrun)
             ("C-m" . reindent-then-newline-and-indent)
             ("#" . insert-include)
             ("C-d" . kill-region))
  (require 'flycheck "flycheck" 'noerr)
  (setq flycheck-clang-language-standard "c++11"
        c-auto-newline t)
  (when (and (require 'auto-complete-clang "auto-complete-clang" 'noerr)
             (require 'auto-complete "auto-complete" 'noerr))
    (add-to-list 'ac-sources 'ac-source-clang))
  (require 'gccsense)
  (gtags-make-complete-list)
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
  )

(defun insert-include ()
  (interactive)
  (insert "#include")
  (yas-expand))

(defun gtags-mode-predefine ()
  (local-set-key "\M-," 'gtags-find-tag)
  (local-set-key "\M-r" 'gtags-find-rtag)
  (local-set-key "\M-s" 'gtags-find-symbol)
  (local-set-key "\M-p" 'gtags-pop-stack)
  )



(provide 'c-mode-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; c-mode-setup.el ends here
