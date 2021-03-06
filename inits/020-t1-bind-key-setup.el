;;; t1-bind-key-setup.el ---   key bind setting
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:25:06 2012 (+0900)
;; Last-Updated:2019/09/28 17:01:22 (+0900)
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
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (declare-function t1-edit-bind-keys "t1-bind-key")
  (declare-function t1-ctl-x-bind-keys "t1-bind-key")
  (declare-function common-view-map-many-register "t1-bind-key")
  (declare-function common-view-map-bind-keys "t1-bind-key")
  (require 'package "package" 'noerr)
  (package-initialize)
  )

(use-package bind-key
  ;; :disabled
  ;; :defer
  :ensure t
  :init
  :config
  (message "Loading \"bind-key\"")
  )

;; translate key
(keyboard-translate ?\C-x ?\C-d) ;C-x => C-d
(keyboard-translate ?\C-d ?\C-x) ;C-d => C-x

;; Undefine control-digits.
(let ((i ?0))
  (while (<= i ?9)
    (global-unset-key (read (format "[?\\C-%c]" i)))
    (setq i (1+ i))))

;; Ctrl+tab mapped to Alt+tab
(define-key function-key-map [(control tab)] [?\M-\t])

;; Prefix C-x map
(define-key ctl-x-map "\C-n" nil) ;Disable Goal Colum On

;; global map
(global-unset-key (kbd "M-<down-mouse-1>"))
(bind-keys :map global-map
           ;; prefix
           ("C-j" . backward-char)
           ("C-l" . forward-char)
           ("C-M-k" . scroll-down)
           ("C-M-n" . scroll-up)
           ("M-B" . scroll-other-window)
           ;; simple.el
           ("C-k" . previous-line)
           ("M-j" . backward-word)
           ("M-l" . forward-word)
           ("C-M-g" . keyboard-escape-quit)
           ("C-d" . kill-region)
           ("M-g" . goto-line)
           ("C-M-t" . transpose-lines)
           ([C-return] . open-line)
           ([S-backspace] . kill-line)
           ("C-m" . default-indent-new-line)
           ;; paragraphs.el
           ("M-k" . backward-sentence)
           ("M-n" . forward-sentence)
           ("M-p" . backward-paragraph)
           ("M-b" . forward-paragraph)
           ;; files.el
           ("C-s" . save-buffer)
           ;; mule-cmds.el
           ([zenkaku-hankaku] . toggle-input-method)
           ;; isearch.el not provided
           ("C-f" . isearch-forward)
           ("s-<f4>" . kmacro-edit-macro)
           )

(bind-keys :map isearch-mode-map
           ("C-f" . isearch-repeat-forward)
           ("C-j" . isearch-delete-char)
           ("C-t" . isearch-toggle-regexp))

(use-package t1-bind-key
  ;; :disabled
  :init
  :config
  (message "Loading \"t1-bind-key\"")
  (t1-edit-bind-keys
   '(("C-g" . keyboard-quit)
     ("C-q" . quoted-insert)
     ("C-b" . delete-blank-lines)
     ("C-f" . fixup-whitespace)
     ("C-w" . query-replace)
     ("w" . query-replace)
     ("C-u" . upcase-word)
     ("C-l" . downcase-word)
     ))

  (t1-ctl-x-bind-keys
   '(("C-g" . keyboard-quit)
     ("r" . recenter)
     ("C-c" . kill-emacs)
     ("f" . find-file)
     ("M-d" . dired-jump-other-window)
     ("D" . dired-jump-other-window)
     ("k" . kill-this-buffer)
     ("C-k" . kill-this-buffer)
     ("M-f" . query-replace-regexp)
     ("F" . revert-buffer)
     ("<f4>" . name-last-kbd-macro)
     ("s-<f4>" . insert-kbd-macro)
     ("C-M-c" . force-kill-emacs)
     ))

  (common-view-map-many-register
   '(;; Left hand
     ("v" . next-line)
     ("f" . forward-char)
     ("s" . backward-char)
     ("d" . previous-line)
     ;; common
     ("\d" . nil)
     ("c" . nil)
     ;; Right hand
     ("n" . next-line)
     ("l" . forward-char)
     ("j" . backward-char)
     ("k" . previous-line)
     ("o" . other-window)
     ;;
     ("C-n" . next-line)
     ("C-l" . forward-char)
     ("C-j" . backward-char)
     ("C-k" . previous-line)
     ("C-m" . nil)
     ))
  )

(common-view-map-bind-keys messages-buffer-mode-map)



(provide 't1-bind-key-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; t1-bind-key-setup.el ends here
