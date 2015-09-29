;;; c_mode_start.el --- function for c mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 19:43:58 2012 (+0900)
;; Last-Updated: 2015/09/24 13:58:36 (+0900)
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
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro")
  (require 'auto-complete)
  (require 'gtags)
  (require 'gccsense)
  (require 'flymake)
  (require 'hideif)
  )

;;;###autoload
(defun cc-coding-style () ;[2013/11/18]
  ""
  (custom-set-variables
   '(c-basic-offset 2)
   '(tab-width 2)
   '(indent-tabs-mode nil)
   '(fill-column      80)))

;;;###autoload
(defun cc-mode-mode-custom-predefine ()
  "For `eval-after-load' cc-mode customize."
  (message "eval-after-load: \"cc-mode\" customizing..")
  ;; (custom-set-variables
   ;; '())
  )

;;;###autoload
(defun cc-mode-mode-predefine ()
  "For `eval-after-load' cc-mode function."
  (message "eval-after-load: \"cc-mode\" setting..")
  (cc-coding-style)
  (add-hook 'c-mode-common-hook 'c-mode-common-hook-predefine)
  (add-hook 'c-mode-common-hook 'flycheck-mode 'append)
  ;; (remove-hook 'c-mode-common-hook 'flycheck-mode)
  (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode 'append)
  (add-hook 'c++-mode-hook 'c++-mode-hook-predefine 'append)
  ;; (remove-hook 'c++-mode-hook 'c++-mode-hook-predefine)
  )

;;;###autoload
(defun cc-mode-mode-map-predefine ()
  "For cc-mode key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"cc-mode\" keymaping.."))
  (define-many-keys c-mode-map
    ("\C-\M-h" 'windmove-left)
    ("." 'ac-complete-gccsense) ;(kbd "C-c .")
    ("(" 't1-parence)
    )
  (define-many-keys c-mode-base-map
    ("\C-c\C-c"       'nil)
    ("\C-c\C-q" 'quickrun)
    ("\C-cq" 'quickrun)
    ("\C-m" 'reindent-then-newline-and-indent)
    ("#" 'insert-include)
    ("\C-d" 'kill-region)
    )
  )

;;;###autoload
(defun cc-mode-mode-face-predefine ()
  "For cc-mode face."
  (message "eval-after-load: \"cc-mode\" Setting faces..")
  )

;;;###
;; (defun flymake-cc-init ()
;;   (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;          (local-file  (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;     (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

(defun c++-mode-hook-predefine ()
  "For `c++-mode-hook'."
  (setq flycheck-clang-language-standard "c++11"
        c-auto-newline t)
  )

;;;###autoload
(defun c-mode-common-hook-predefine ()
  "For `c-mode-common-hook'."
  (when (and (require 'auto-complete-clang "auto-complete-clang" 'noerr)
             (require 'auto-complete "auto-complete" 'noerr))
    (add-to-list 'ac-sources 'ac-source-clang))
  ;; (push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
  (require 'gccsense)
  ;; (gccsense-flymake-setup)
  ;; (global-auto-complete-mode 1)
  (hs-minor-mode 1)
  (hide-ifdef-mode 1)
  (gtags-mode 1)
  (gtags-make-complete-list)
  )

(defun insert-include ()
  (interactive)
  (insert "#include")
  (yas-expand))

;;;###autoload
(defun gtags-mode-predefine ()
  (local-set-key "\M-," 'gtags-find-tag)
  (local-set-key "\M-r" 'gtags-find-rtag)
  (local-set-key "\M-s" 'gtags-find-symbol)
  (local-set-key "\M-p" 'gtags-pop-stack)
  )



(provide 'c_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; c_mode_start.el ends here
