;;; jedi-setup.el ---   setting for jedi
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 05:06:17 (+0900)
;; Last-Updated:2015/10/15 03:15:25 (+0900)
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
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'python "python" 'noerr)
  (require 'use-package "use-package" 'noerr))

(declare-function package-bundle "package-setup.el")
(when (require 'package-setup "package-setup" 'noerr)
  (ignore-errors (package-bundle 'jedi)))

(use-package jedi-core
  ;; :disabled
  :defer
  :commands
  (jedi:goto-definition jedi:show-doc)
  :init
  :config
  (message "Loading \"jedi-core\"")
  (define-key python-mode-map "\C-cf" 'jedi:goto-definition)
  (define-key python-mode-map "\C-c\C-f" 'jedi:goto-definition)
  )

(use-package jedi
  ;; :disabled
  :defer
  :commands
  (jedi:setup)
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  ;; (remove-hook 'python-mode-hook 'jedi:setup)
  :config
  (message "Loading \"jedi\"")
  (custom-set-variables
   '(jedi:complete-on-dot t)
   '(jedi:tooltip-method 'nil)
   '(jedi:get-in-function-call-delay 300)
   '(jedi:key-goto-definition (kbd "C-c C-f"))
   '(jedi:key-show-doc (kbd "C-c C-x"))
   )
  (require 'auto-complete-yasnippet "auto-complete-yasnippet" 'noerr)
  (add-to-list 'ac-sources ac-source-yasnippet 'append)
  (set-face-attribute 'jedi:highlight-function-argument nil :foreground "yellow")
  )

;; OVERIDE inhibited read only
;; can't resolve by defadvice.
(defun jedi:show-doc ()
  "Show the documentation of the object at point."
  (interactive)
  (deferred:nextc (jedi:call-deferred 'get_definition)
    (lambda (reply)
      (with-current-buffer (get-buffer-create jedi:doc-buffer-name)
        (let ((inhibit-read-only t)) ;; here
          (erase-buffer)
          (loop with has-doc = nil
                with first = t
                for def in reply
                do (destructuring-bind
                       (&key doc desc_with_module line_nr module_path
                             &allow-other-keys)
                       def
                     (unless (or (null doc) (equal doc ""))
                       (if first
                           (setq first nil)
                         (insert "\n\n---\n\n"))
                       (insert "Docstring for " desc_with_module "\n\n" doc)
                       (setq has-doc t)))
                finally do
                (if (not has-doc)
                    (message "Document not found.")
                  (progn
                    (goto-char (point-min))
                    (when (fboundp jedi:doc-mode)
                      (funcall jedi:doc-mode))
                    (run-hooks 'jedi:doc-hook)
                    (funcall jedi:doc-display-buffer (current-buffer))))))))))

(defadvice jedi:goto-definition
    (before stack-point-jedi:goto-definition activate)
  (stack-point)
  )
;; (progn (ad-disable-advice 'jedi:goto-definition 'before 'stack-point-jedi:goto-definition) (ad-update 'jedi:goto-definition))



(provide 'jedi-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; jedi-setup.el ends here
