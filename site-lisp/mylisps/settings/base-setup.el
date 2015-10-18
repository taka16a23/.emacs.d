;;; base-setup.el ---    env custom files
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:06 2012 (+0900)
;; Last-Updated:2015/10/15 17:24:01 (+0900)
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
;; 2013/01/27    Atami
;;    Change Values: `kept-new-versions' 10 to 20
;;    Save more revision.
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'environment-setup "environment-setup" 'noerr)
  (require 'subroutines "subroutines" 'noerror)
  (require 'cua-base nil 'noerror))

(add-hook 'after-init-hook 'startup-times)
(add-hook 'after-init-hook 'startup-display)

;;;; Encoding
;;
(set-language-environment     "Japanese")
(prefer-coding-system         'utf-8)
(set-terminal-coding-system   'utf-8)
(set-keyboard-coding-system   'utf-8)
(set-clipboard-coding-system  'utf-8)
(set-default-coding-systems   'utf-8)


;; CUSTOM
;; ============================================================================
;;;; "yes or no"  =>  "y or n"
;;
(fset 'yes-or-no-p 'y-or-n-p)

;;;; Proxy
;; (setq url-proxy-services '(("http" . "localhost:8339")))

;;;; Mouse
;;
;; (mouse-avoidance-mode 'jump)

;;;; No dialog frame
;;
(defalias 'message-box 'message)

;;;; Kill Client Prompt
;;
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;;;; Customize
;;
;; for output

(when (equal window-system 'x)
  (custom-set-variables
   '(x-select-enable-clipboard     1)   ; Copy Send To Clipboard
   '(use-dialog-box              nil)   ; No dialog frame
   ))

(custom-set-variables
 '(eol-mnemonic-dos "[crlf]")
 '(eol-mnemonic-unix "[lf]")
 '(eol-mnemonic-mac "[cr]")
 '(eol-mnemonic-undecided "[?]")
 ;; '(gc-cons-threshold             5242880) ;default 400000
 '(gc-cons-threshold  (* gc-cons-threshold 25)) ;for first boot 10000000 (10M)
 '(garbage-collection-messages nil)
 '(max-lisp-eval-depth 4096) ;Anti Infinite Loop
 '(max-specpdl-size 3000)
 '(message-log-max 10000)
 '(inhibit-startup-message t)
 '(initial-scratch-message nil)
 '(inhibit-startup-echo-area-message t)
 '(process-kill-without-query t) ;Auto kill process when close emacs
 '(delete-by-moving-to-trash t)
 ;; '(trash-directory (convert-standard-filename (concat temporary-file-directory "Trash")))
 '(overflow-newline-into-fringe t) ;行の最後が改行の場合 fringe にめりこむ
 ;; tab
 '(indent-tabs-mode nil) ;disable tab
 '(tab-width 4)
 '(require-final-newline t) ;file の最後に改行を入れる。
 ;; '(echo-keystrokes 0.3)
 '(kill-whole-line t)
 '(kill-do-not-save-duplicates t) ;kill ring purge duplicates
 '(bookmark-save-flag 1)
 '(view-read-only t)
 ;; '(visible-bell nil)
 '(large-file-warning-threshold 10000000) ;default 10000000(10M)
 '(use-file-dialog nil)
 '(auto-revert-interval 7)
 '(yank-excluded-properties t)
 '(save-place-file (my-var-dir-join "cursor-point-save.el"))
 '(save-place t)
 '(savehist-file (my-var-dir-join "savehist")) ;save history location
 '(bookmark-default-file (my-data-dir-join "bookmarks")) ;Bookmark
 '(url-configuration-directory (my-data-dir-join "url/"))
 '(enable-local-variables t)
 '(safe-local-variable-values (quote ((no-check-type-miss . t)
                                      (backup-inhibited . nil)
                                      (version-control quote never))))
 ;; non-nil = 改行コードの変換を許さない
 '(inhibit-eol-conversion nil)
 '(resize-mini-windows t)
 )

(dolist (path (split-string (getenv "PATH") ":"))
  (add-to-list 'exec-path path t))

;;;; Allow disabled command
;;
(dolist (s '(upcase-region
             scroll-left
             dired-find-alternate-file
             downcase-region
             narrow-to-region
             erase-buffer
             set-goal-column
             narrow-to-page))
  (put s 'disabled nil))



(provide 'base-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; base-setup.el ends here
