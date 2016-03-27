;;; python-mode-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/05 10:33:36 (+0900)
;; Last-Updated:2015/11/11 10:50:55 (+0900)
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
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'bind-key "bind-key" 'noerr))

;; for ipython
;; borrow from http://d.hatena.ne.jp/kaz_yos/20131223/1387747252
(defun python-shell-send-region (start end)
  "Send the region delimited by START and END to inferior Python process."
  (interactive "r")
  (python-shell-send-string
   (buffer-substring start end)
   ;; No need to send blank lines in ipython? 2013-12-22
   ;; (concat
   ;;  (let ((line-num (line-number-at-pos start)))
   ;;    ;; When sending a region, add blank lines for non sent code so
   ;;    ;; backtraces remain correct.
   ;;    (make-string (1- line-num) ?\n))
   ;;  (buffer-substring start end))
   nil t))

(defun my-python-start ()
  (interactive)
  (unless (member "*Python*" (mapcar (function buffer-name) (buffer-list)))
    (delete-other-windows)
    (let* ((w1 (selected-window))
           (w1name (buffer-name))
           (w2 (split-window w1 nil t)))
      (call-interactively 'run-python)
      (set-window-buffer w1 "*Python*")
      (set-window-buffer w2 w1name)
      (select-window w2)
      )))

(defun my-python-eval ()
  (interactive)
  (my-python-start)
  (if (and transient-mark-mode mark-active)			; Check if selection is present
      (python-shell-send-region (point) (mark))			; If selected, send region
    ;; If not selected, do all the following
    (beginning-of-line)						; Move to the beginning of line
    (if (looking-at "def")					; Check if the first word is def (function def)
        (progn							; If it is def
          (python-shell-send-defun ())				; Send whole def
          (python-nav-end-of-defun)				; Move to the end of def
          (python-nav-forward-statement)			; Move to the next statement
          )
      ;; If it is not def, do all the following
      (python-shell-send-region (point-at-bol) (point-at-eol))	; Send the current line
      (python-nav-forward-statement)				; Move to the next statement
      )
    ;; Activate shell window, and switch back
    (let ((w-script (selected-window)))
      (python-shell-switch-to-shell)
      (select-window w-script))
    ))

;; test
(defun python-fit-tail ()
  "ARGS"
  (let ((inhibit-read-only t))
    (save-excursion
      (goto-char (point-max))
      (when (and (re-search-backward "" nil 'noerror)
                 (or (looking-back "\n\n\n\n")
                     (not (looking-back "\n\n\n"))))
        (forward-char -1)
        (delete-blank-lines) ;for no blank line
        (delete-blank-lines)
        (insert "\n\n"))))
  )

(defun refactoring-python-mode-hook () ;[2015/10/25]
  ""
  (add-hook 'before-save-hook 'python-fit-tail 'append 'local)
  (add-hook 'before-save-hook 'whitespace-cleanup 'append 'local)
  )

(defun inferior-python-mode-hook () ;[2015/10/25]
  ""
  (setq truncate-lines nil))

(use-package python
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"python\"")
  (require '__python__ "__python__" 'noerr)
  (require '__python__operator "__python__operator" 'noerr)
  (require 'pymacs "pymacs" 'noerr)
  (require 'python-debug "python-debug" 'noerr)
  (add-hook 'python-mode-hook 'refactoring-python-mode-hook)
  (add-hook 'inferior-python-mode-hook 'inferior-python-mode-hook)
  (custom-set-variables
   '(python-shell-interpreter "/usr/bin/ipython")
   '(python-shell-prompt-regexp "In \\[[0-9]+\\]: ")
   '(python-shell-prompt-output-Regexp "Out\\[[0-9]+\\]: ")
   '(python-shell-completion-setup-code
     "from IPython.core.completerlib import module_completion")
   '(python-shell-completion-module-string-code
     "';'.join(module_completion('''%s'''))\n")
   '(python-shell-completion-string-code
     "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
   )
  (bind-keys :map python-mode-map
             ("C-j" . backward-char)
             ("C-y" . py:kill-line)
             ("C-d" . py:kill-line)
             ([(meta \,)] . python-indent-shift-left)
             ([(meta .)] . python-indent-shift-right)
             ("C-M-p" . python-shell-send-region)
             ("C-3" . py-comment-or-uncomment-def-or-class) ;misc
             ([(control e) (control \,)] . py:insert-conma-end-brackets) ;misc
             ("C-c C-a" . py-add-to-__all__) ; python-extensions.el
             ;; ("C-e C-c C-a" . py:add-param)
             ;; auto-highlight-symbol.el
             ("C-e h" . py:ahs-edit-mode-def-region) ; ahs
             ("C-e C-\ M-h" . py:ahs-edit-mode-class-region)
             ("C-e M-h" . py:ahs-edit-mode-class-region)
             )
  (bind-keys :map inferior-python-mode-map
             ("C-M-n" . scroll-up))
  (bind-keys :map compilation-shell-minor-mode-map
             ("C-M-n" . scroll-up))
  (when (require 'smartrep "" 'noerr)
    (smartrep-define-key
     python-mode-map "C-c C-e" '(("C-l" . py:refact-list-toggle)
                                 ("C-k" . py:move-up-method)
                                 ("C-n" . py:move-down-method)
                                 ))
    (smartrep-define-key
     python-mode-map "C-e" '(("M-k" . py:move-up-method)
                             ("M-n" . py:move-down-method)))
    )
  (font-lock-add-keywords
   'python-mode
   '(("#\\([a-z \t]*\\(?:TODO\\|BUG\\|FIXME\\|KLUDGE\\|WARNING\\)\\)"
      1 font-lock-warning-face prepend)))
  )



(provide 'python-mode-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; python-mode-setup.el ends here
