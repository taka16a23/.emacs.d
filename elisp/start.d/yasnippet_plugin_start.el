;;; yasnippet_plugin_start.el --- functions for yasnippet
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 19:38:21 2012 (+0900)
;; Last-Updated: 2015/09/25 07:39:25 (+0900)
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
;; 2014/01/05    Atami
;;    Added: `flycheck-isactive-flag', `recover-flycheck-after-exit-from-yas'
;;
;; 2013/11/18    Atami
;;    Added: `decrement-yas-number'
;;
;; 2013/11/18    Atami
;;    Added: `increment-yas-number'
;;
;; 2013/03/07    Atami
;;    Modified: `snippet-finalize'
;;    check modify by `buffer-modified-p'
;;
;; 2013/02/28    Atami
;;    Modified: `snippet-mode-hook-predefine'
;;    disable `auto-fill-mode' on snippet major mode.
;;
;; 2013/01/29    Atami
;;    Modified: `yasnippet-map-predefine'
;;    set variables "TAB", "Shift TAB" to
;;    `yas/next-field-key', `yas/prev-field-key'
;;
;; 2012/12/11    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'yasnippet nil 'noerror)
  (require 'auto-complete-yasnippet nil 'noerror)
  (require 'anything-c-yasnippet nil 'noerror)
  (require 'smartchr "smartchr" 'noerr))

;;;###autoload
(defun yasnippet-mode-custom-predefine ()
  "For `eval-after-load' yasnippet customize."
  (message "eval-after-load: \"yasnippet\" customizing..")
  (custom-set-variables
   '(yas-snippet-dirs (list (concat my-data-dir "snippets/")))
   '(yas/root-directory (concat my-data-dir "snippets/"))
   '(yas-prompt-functions '(yas-popup-isearch-prompt yas-no-prompt))
   '(yas-triggers-in-field t)
   ;; '(yas/trigger-key "SPC")
   ;; '(yas/ignore-filenames-as-triggers t)
   '(anything-c-yas-space-match-any-greedy t)
   ;; '(yas/next-field-key '("TAB" "<tab>"))
   ;; '(yas/prev-field-key '("<backtab>" "<S-tab>"))
   ;; '(yas/skip-and-clear-key "M-i")
   )
  ;; snippet mode
  (add-hook 'snippet-mode-hook 'snippet-mode-hook-predefine)
  (add-hook 'snippet-mode-hook '(lambda () (auto-fill-mode -1)))
  ;; (add-hook 'snippet-mode-hook '(lambda () (whitespace-newline-mode 1)))
  ;; (remove-hook 'snippet-mode-hook '(lambda () (auto-fill-mode -1)))
  ;; (remove-hook 'snippet-mode-hook '(lambda () (whitespace-newline-mode 1)))
  )

;;;###autoload
(defun yasnippet-mode-predefine ()
  "For `eval-after-load' yasnippet function."
  (message "eval-after-load: \"yasnippet\" setting..")
  (require 'auto-complete-yasnippet "auto-complete-yasnippet" 'noerr)
  (require 'anything-c-yasnippet "anything-c-yasnippet" 'noerr)
  (add-hook 'python-mode-hook 'yasnippet-local-condition-predefine)
  ;; (remove-hook 'python-mode-hook 'yasnippet-local-condition-predefine)
  (add-hook 'python-mode-hook 'yasnippet-mode-map-predefine)
  ;; (remove-hook 'python-mode-hook 'yasnippet-mode-map-predefine)
  (yas-initialize)
  ;; (yas/load-directory yas/root-directory)
  ;; add syntaxes for lisp function
  (add-to-list 'yas-key-syntaxes "(w_.)" t)
  (add-hook 'yas-before-expand-snippet-hook 'yas-my-save-marker)
  (add-hook 'flyspell-incorrect-hook ;yasnippet on flyspell
			#'(lambda (dummy1 dummy2 dymmy3)
				(and yas-active-field-overlay
					 (overlay-buffer yas-active-field-overlay))))
  (add-hook 'yas-after-exit-snippet-hook 'recover-flycheck-after-exit-from-yas)
  ;; (remove-hook 'yas-after-exit-snippet-hook 'recover-flycheck-after-exit-from-yas)
  )

;;;###autoload
(defun yasnippet-mode-map-predefine ()
  "For yasnippet key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"yasnippet\" keymaping.."))
  (define-key yas-keymap "\C-\M-i" 'yas-skip-and-clear-or-delete-char)
  (define-key yas-keymap "," 'self-insert-command)
  (define-key yas-keymap [(tab)] 'yas-next-field-or-maybe-expand)
  (define-key yas-keymap [(shift ?\t)] 'yas-prev-field)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  ;; (define-key yas-minor-mode-map (kbd "<the new key>") 'yas-expand)
  (define-key yas-minor-mode-map "(" 'yas-expand)
  ;; (define-key yas-minor-mode-map "SPC" 'yas-expand)
  (define-key yas-minor-mode-map " " 'yas-expand)
  )


(defun yasnippet-local-condition-predefine () ;[2013/11/08]
  ""
  (setq yas-buffer-local-condition
        '(or (not (memq (get-text-property (point) 'face)
                        '(font-lock-comment-face
                          font-lock-doc-face
                          font-lock-string-face)))
             '(require-snippet-condition . force-in-comment))))

;;;; Major Mode
;;
(defadvice yas-load-snippet-buffer
    (before save-yas-load-snippet-buffer activate)
  (when (buffer-modified-p)
    (save-buffer))
  )
;; (progn (ad-disable-advice 'yas-load-snippet-buffer 'before 'save-yas-load-snippet-buffer) (ad-update 'yas-load-snippet-buffer))

;;;###autoload
(defun snippet-mode-hook-predefine () ;[2012/10/31]
  "Predefine for Snippet Major Mode."
  (message "snippet mode hook")
  ;; (define-key snippet-mode-map "\C-s" 'snippet-finalize)
  (define-key snippet-mode-map "\C-s" 'yas-load-snippet-buffer)
  (define-key snippet-mode-map "\`" (smartchr '("\`" "\``!!'\`")))
  (setq next-line-add-newlines t))

(defun snippet-finalize ()
  "Save snippet and load current snippet."
  (interactive)
  (when (buffer-modified-p)
    (save-buffer))
  ;; (interactive-form 'yas-load-snippet-buffer)
  (yas-load-snippet-buffer (symbol-name (first yas--guessed-modes)) t)
  )

;; yasnippet prompt
;;;###autoload
(defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
  ""
  (when (featurep 'popup)
    (popup-menu*
     (mapcar
      (lambda (choice)
        (popup-make-item
         (or (and display-fn (funcall display-fn choice))
             choice)
         :value choice))
      choices)
     :prompt prompt
     ;; start isearch mode immediately
     :isearch t
     )))

;; save position before yasnippet execution
;;;###autoload
(defvar yas-my-pre-marker nil)
;;;###autoload
(defvar yas-my-post-marker nil)

;;;###autoload
(defun yas-my-save-marker ()
  (setq yas-my-pre-marker (point-marker))
  (setq yas-my-post-marker (set-marker (make-marker) (1+ (point)))))

(defun increment-yas-number () ;[2013/11/18]
  ""
  (interactive "*")
  (save-excursion
    (while (re-search-forward "\\${*\\([0-9]+\\):*" nil 'noerr)
      (goto-char (match-beginning 1))
      (unless (looking-at "0")
        (increment-number-at-point)))))

(defun decrement-yas-number () ;[2013/11/18]
  ""
  (interactive "*")
  (save-excursion
    (while (re-search-forward "\\${*\\([0-9]+\\):*" nil 'noerr)
      (goto-char (match-beginning 1))
      (unless (looking-at "0")
        (decrement-number-at-point)))))


;; flycheck
(defvar flycheck-isactive-flag nil)
(defadvice yas-expand-snippet
  (before inhibit-flycheck-syntax-checking-while-expanding-snippet activate)
  (setq flycheck-isactive-flag
        (or flycheck-isactive-flag
            (assoc-default 'flycheck-mode (buffer-local-variables))))
  (when flycheck-isactive-flag
    (flycheck-mode -1)))

(defun recover-flycheck-after-exit-from-yas () ;[2014/01/05]
  ""
  (when flycheck-isactive-flag
    (flycheck-mode 1)
    (setq flycheck-isactive-flag nil)))



(provide 'yasnippet_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; yasnippet_plugin_start.el ends here
