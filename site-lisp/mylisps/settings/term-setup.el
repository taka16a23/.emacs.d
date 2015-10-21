;;; term-setup.el ---   for terminal
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:01 2012 (+0900)
;; Last-Updated:2015/10/21 17:17:58 (+0900)
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
;;    Moved: Moved functions to term_mode_start.el
;;    `launch-term', `term-mode-predefine'
;;    `term-mode-map-predefine'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'subroutines "subroutines" 'noerr)
  (declare-function windows-p "subroutines")
  (require 'term "term" 'noerr)
  (declare-function term-send-raw-string "term")
  (require 'package "package" 'noerr)
  (package-initialize)
  )

;; Do not prompt "Active processes exit; kill them and exit anyway?"
(defadvice save-buffers-kill-terminal (before my-save-buffers-kill-terminal activate)
  (when (process-list)
    (dolist (p (process-list))
      (set-process-query-on-exit-flag p nil))))

(defun term-spawn ()
  (interactive)
  (term-send-raw-string "&")
  (term-send-raw-string "")
  )

(defun term-mode-hook () ;[2015/10/21]
  "Can't bind C-n to term-send-raw in use-package :config."
  (bind-keys :map term-raw-map
             ("C-h" . term-send-raw)
             ("M-j" . term-send-raw)
             ("M-l" . term-send-raw)
             ("M-k" . term-send-raw)
             ("M-n" . term-send-raw)
             ("C-r" . term-send-raw)
             ("C-y" . term-send-raw)
             ("C-s" . term-send-raw)
             ("C-z" . term-send-raw)
             ("C-a" . term-send-raw)
             ("C-o" . term-send-raw)
             ("C-b" . term-send-raw)
             ("" . term-send-raw) ;(kbd "C-_")
             ("M-x" . term-send-raw)
             ("C-e" . term-send-raw)
             ([67108909] . term-send-raw) ;(kbd "C--")
             ([67108923] . term-send-raw) ;(kbd "C-;")
             ("C-c C-p" . clipboard-kill-ring-save)
             ("C-c C-v" . term-paste)
             ([(control -)] . term-send-raw)
             ("C-c C-q" .  term-send-raw-meta)
             ("C-t" .  set-mark-command)
             ("C-c C-a" . sdic-describe-word-at-point)
             ("C-c M-a" . dabbrev-expand)
             ("M-N" .  windmove-down)
             ("M-j" . term-send-backward-word)
             ("M-l" . term-send-forward-word)
             ([C-return] . term-spawn)
             ([M-backspace] . term-send-raw-meta)
             ("C-n" . term-send-raw))
  )

(defun term-0scroll-margin () ;[2015/10/15]
  ""
  (make-local-variable 'scroll-margin)
  (setq scroll-margin 0))

(use-package term
  ;; :disabled
  :defer
  :init
  (defvar launch-term (cond ((windows-p) 'shell)
                            (t 'multi-term)))
  :config
  (message "Loading \"term\"")
  (add-hook 'term-mode-hook 'term-0scroll-margin)
  (add-hook 'term-mode-hook 'term-mode-hook)
  (face-spec-set 'term '((t (:foreground "white" :background "black"))))
  (use-package multi-term
    ;; :disabled
    :defer
    :ensure t
    :init
    :config
    (message "Loading \"multi-term\"")
    (custom-set-variables
     '(multi-term-program "/bin/zsh")
     '(multi-term-scroll-to-bottom-on-output 'all)
     '(multi-term-scroll-show-maximum-output t) ;for zsh complete
     '(multi-term-dedicated-window-height 30)
     '(multi-term-dedicated-max-window-height 40))
    (add-to-list 'term-unbind-key-list "C-c")
    )
  )



(provide 'term-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; term-setup.el ends here
