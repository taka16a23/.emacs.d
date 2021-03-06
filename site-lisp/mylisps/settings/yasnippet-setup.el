;;; yasnippet-setup.el ---   snippet
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:26:29 2012 (+0900)
;; Last-Updated:2016/06/30 08:08:18 (+0900)
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
;; 2013/02/07    Atami
;;    Add: `snippet-mode' add to `auto-mode-alist'
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr)
  (require 'package "package" 'noerr)
  (package-initialize)
  (defvar yas-buffer-local-condition nil)
  (defvar yas--guessed-modes nil)
  (defvar yas-active-field-overlay nil)
  )

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

(defun yasnippet-local-condition-predefine () ;[2013/11/08]
  ""
  (setq yas-buffer-local-condition
        '(or (not (memq (get-text-property (point) 'face)
                        '(font-lock-comment-face
                          font-lock-doc-face
                          font-lock-string-face)))
             '(require-snippet-condition . force-in-comment))))

(defun snippet-finalize ()
  "Save snippet and load current snippet."
  (interactive)
  (when (buffer-modified-p)
    (save-buffer))
  ;; (interactive-form 'yas-load-snippet-buffer)
  (yas-load-snippet-buffer (symbol-name (first yas--guessed-modes)) t)
  )

(use-package yasnippet
  ;; :disabled
  :defer
  :ensure t
  :commands
  (snippet-mode
   yas-expand
   yas-new-snippet
   yas-visit-snippet-file)
  :mode
  (("\\.yasnippet\\'" . snippet-mode)
   ("emacs.+/snippets/" . snippet-mode)
   ("emacs.+/snippets/.+\\.el$" . emacs-lisp-mode))
  :diminish yas-minor-mode ;hide from modeline
  :init
  :config
  (message "Loading \"yasnippet\"")
  (custom-set-variables
   '(yas-snippet-dirs (list (my-data-dir-join "snippets/")))
   '(yas-root-directory (my-data-dir-join "snippets/"))
   '(yas-prompt-functions '(yas-popup-isearch-prompt yas-no-prompt))
   '(yas-triggers-in-field t)
   ;; '(yas-trigger-key "SPC")
   ;; '(yas-ignore-filenames-as-triggers t)
   ;; '(yas-next-field-key '("TAB" "<tab>"))
   ;; '(yas-prev-field-key '("<backtab>" "<S-tab>"))
   ;; '(yas-skip-and-clear-key "M-i")
   )
  (add-to-list 'yas-key-syntaxes "(w_.)" t)
  (require 'auto-complete-yasnippet "auto-complete-yasnippet" 'noerr)
  (add-hook 'yas-before-expand-snippet-hook 'yas-my-save-marker)
  (add-hook 'flyspell-incorrect-hook ;yasnippet on flyspell
			#'(lambda (dummy1 dummy2 dymmy3)
				(and yas-active-field-overlay
					 (overlay-buffer yas-active-field-overlay))))
  (add-hook 'yas-after-exit-snippet-hook 'recover-flycheck-after-exit-from-yas)
  (require 'bind-key "bind-key" 'noerr)
  (bind-keys :map yas-keymap
             ("C-M-i" . yas-skip-and-clear-or-delete-char)
             ("," . self-insert-command)
             ([(tab)] . yas-next-field-or-maybe-expand)
             ([(shift ?\t)] . yas-prev-field))
  (bind-keys :map yas-minor-mode-map
             ("<tab>" . nil)
             ("TAB" . nil)
             ("(" . yas-expand)
             ("SPC" . yas-expand)
             )
  (bind-keys :map snippet-mode-map
             ("C-s" . yas-load-snippet-buffer))
  (defadvice yas-load-snippet-buffer
      (before save-yas-load-snippet-buffer activate)
    (when (buffer-modified-p)
      (save-buffer)))
  ;; (progn (ad-disable-advice 'yas-load-snippet-buffer 'before 'save-yas-load-snippet-buffer) (ad-update 'yas-load-snippet-buffer))
  (yas-global-mode 1))



(provide 'yasnippet-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; yasnippet-setup.el ends here
