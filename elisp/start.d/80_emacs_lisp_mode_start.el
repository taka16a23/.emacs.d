;;; 80_emacs_lisp_mode_start.el --- Setting for Emacs Lisp mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:19 2012 (+0900)
;; Last-Updated: 2015/10/04 10:27:56 (+0900)
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
;; 2013/09/15    Atami
;;    Remove: `minimap-sync-overlays' in `my-make-scratch'
;;
;; 2013/02/27    Atami
;;    Fixed: `my-make-scratch'
;;    error raise (error "No buffer named *MINIMAP*  *Compiler Input*")
;;    by eval minimap-sync-overlays on `hs-show-hook'
;;    escape `minimap-sync-overlays' from hs-show-hook by `let'
;;
;; 2013/01/27    Atami
;;    Add: defined key "`" char.
;;    "`" => "`'" => "``"
;;
;; 2013/01/24    Atami
;;    Modified: Keybinding
;;    `find-function-at-point' "\C-cf" => "\C-cg"
;;    `anything-imenu' "\C-i" => "\C-cj" : Added "\C-c\C-j"
;;
;; 2012/12/10    Atami
;;    Moved: Moved functions to Emacs_Lisp_mode_start.el
;;    `my-find-tag', `right-parentheses-indent'
;;    `emacs-lisp-mode-hook-predefine', `my-make-scratch'
;;    `lisp-interaction-mode-hook-predefine'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (defvar ac-sources)
  (defvar during-init-p)
  (defvar rotate-text-rotations)
  (require 't1macro "t1macro" 'noerror)
  (require 'rotate-text nil 'noerror)
  (require 'smartchr nil 'noerror)
  (require 'subroutines_start nil 'noerror)
  (require 'Emacs_Lisp_mode_start nil 'noerror)
  (require 'auto-complete nil 'noerr))


(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-mode-hook-predefine)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'emacs-lisp-mode-hook '(lambda () (hs-minor-mode 1)))


(define-many-keys emacs-lisp-mode-map
  ("\C-s"        'elisp-save-buffer)
  ;; Document
  ("\C-ch"       'describe-function)
  ("\C-c\C-h"    'describe-function)
  ("\C-cd"       'describe-function)
  ("\C-c\C-x"    'describe-function)
  ("\C-c\C-v"    'describe-variable)

  ;; Info

  ;; Go definitions
  ("\C-cf"       'find-function-at-point)
  ("\C-c\C-f"    'find-function-at-point)
  ("\C-cv"       'find-variable-at-point)
  ;; Comment
  ;; (""            ')
  ;; Mark
  ;; Move
  ;; indent
  ;; Align
  ;; interpreter
  ;; ("\C-c\C-c" 'popwin:scratch)
  ;; Other
  (")"        'right-parentheses-indent)
  ("`"        (smartchr '("\`" "\``!!'\'" "\`\`")))
  ("\C-cj"    'helm-imenu)
  ("\C-c\C-j" 'helm-imenu)
  ("\C-c\C-s" 'se/make-summary-buffer)
  ("\C-ec"    'helm-lisp-completion-at-point)
  ("\C-m"     'default-indent-new-line)
  ([C-return] 'open-line-indent)
  ("\C-c\C-a" 'helm-apropos)
  ("\C-ca"    'helm-apropos)
  )


;; SCRACATCH
;; ============================================================================
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook '(lambda () (flycheck-mode -1)))
(add-hook 'lisp-interaction-mode-hook '(lambda () (hs-minor-mode 1)))
(add-hook 'lisp-interaction-mode-hook 'lisp-interaction-mode-hook-predefine)
(add-hook 'after-init-timer-hook 'after-init-load-ac-sources-lisp-interaction t)

(define-many-keys lisp-interaction-mode-map
  ([f12] 'eval-print-last-sexp)
  ([(meta return)] 'eval-print-last-sexp)
  ("\C-j"     'backward-char)
  ("\C-m"     'newline-and-indent)
  ("\C-cj"    'helm-imenu)
  ("\C-c\C-j" 'helm-imenu)
  ("\C-c\C-s" 'se/make-summary-buffer)
  ("\C-cd"    'find-function-at-point)
  ("\C-c\C-x" 'find-function-at-point)
  ("\C-cf"       'find-function-at-point)
  ("\C-c\C-f"    'find-function-at-point)
  ("\C-cv"    'find-variable-at-point)
  ("\C-c\C-v" 'describe-variable)
  ("\C-ec"    'helm-lisp-completion-at-point)
  ("\C-ch"    'helm-apropos)
  ("\C-c\C-h" 'helm-apropos)
  ("\C-cD"    'helm-info-at-point)
  ("\C-c\C-c" 'popwin:scratch)
  ("\C-c\C-a" 'helm-apropos)
  ([C-return] 'open-line-indent)
  ("`"        (smartchr '("\`" "\``!!'\'" "\`\`")))
  (")"        'right-parentheses-indent)
  )

(defvar scratch-log-file
  (concat my-data-dir "code/elisp/interpreter/scratch_log.org"))

(defun my-make-scratch (&optional arg)
  "Summary.
ARG:"
  (interactive)
  (set-buffer (get-buffer-create "*scratch*"))
  ;; save buffer before kill
  (widen)
  (delete-trailing-blank-lines)
  (goto-char (point-min))
  (insert "\n** " (format-time-string "%c") "\n")
  (append-to-file (point-min) (point-max) scratch-log-file)
  (erase-buffer)
  (when
      (and initial-scratch-message
           (not inhibit-startup-message))
    (insert initial-scratch-message))
  (or arg (progn (setq arg 0)
                 (switch-to-buffer "*scratch*")))
  (cond ((= arg 0) (message "*scratch* is cleared up."))
        ((= arg 1) (message "another *scratch* is created"))))

(add-hook 'kill-buffer-query-functions
		  (lambda ()
			(if (string= "*scratch*" (buffer-name))
				(progn (my-make-scratch 0) nil)
			  t)))

(add-hook 'after-save-hook
		  (lambda ()
			(unless (member (get-buffer "*scratch*") (buffer-list))
			  (my-make-scratch 1))))


;; IELM MODE
;; ============================================================================
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)

;; EDEBUG EVAL MODE
;; ============================================================================
(add-hook 'edebug-eval-mode-hook
          '(lambda ()
             (define-key edebug-mode-map "\C-c\C-c" 'edebug-update-eval-list)
             (define-key edebug-mode-map "\C-c" 'cua--prefix-override-handler)
             ))



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 80_emacs_lisp_mode_start.el ends here
