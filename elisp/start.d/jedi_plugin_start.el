;;; jedi_plugin_start.el --- setting for jedi
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 05:07:36 (+0900)
;; Last-Updated: 2015/09/25 10:28:02 (+0900)
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
  (defvar ac-sources)
  (defvar ac-source-yasnippet)
  (require 'cl "cl" 'noerr)
  (require 'jedi "jedi" 'noerror))


;;;###autoload
(defun jedi-mode-custom-predefine ()
  "For `eval-after-load' jedi customize."
  (message "eval-after-load: \"jedi\" customizing..")
  (custom-set-variables
   '(jedi:complete-on-dot t)
   '(jedi:tooltip-method 'nil)
   '(jedi:get-in-function-call-delay 300)
   '(jedi:key-goto-definition (kbd "C-c C-f"))
   '(jedi:key-show-doc (kbd "C-c C-x"))
   )
  (add-to-list 'ac-sources ac-source-yasnippet 'append)
  )

;;;###autoload
(defun jedi-mode-predefine ()
  "For `eval-after-load' jedi function."
  (message "eval-after-load: \"jedi\" setting..")
  )

;;;###autoload
(defun jedi-mode-map-predefine ()
  "For jedi key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"jedi\" keymaping.."))
  )

;;;###autoload
(defun jedi-mode-face-predefine ()
  "For jedi face."
  (message "eval-after-load: \"jedi\" Setting faces..")
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



(provide 'jedi_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; jedi_plugin_start.el ends here
