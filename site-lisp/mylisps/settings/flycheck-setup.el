;;; flycheck-setup.el ---   setting flycheck
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/12/05 18:28:52 (+0900)
;; Last-Updated:2015/10/27 05:37:02 (+0900)
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
;; (auto-install-from-url "https://github.com/flycheck/flycheck/raw/master/flycheck.el")
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
  (require 'flycheck)
  (require 's "s" 'noerr)
  (require 'package "package" 'noerr)
  (package-initialize)
  )


(defun flycheck-emacs-lisp-mode-hook () ;[2015/10/18]
  ""
  (and buffer-file-name
       (not (re-in-string "\\.junk\\." buffer-file-name))
       (flycheck-mode 1)))

(use-package flycheck
  ;; :disabled
  :defer
  :ensure t
  :commands flycheck-mode
  :diminish flycheck-mode ;hide from modeline
  :init
  (add-hook 'c-mode-common-hook 'flycheck-mode 'append)
  (add-hook 'python-mode-hook 'flycheck-mode 'append)
  (add-hook 'emacs-lisp-mode-hook 'flycheck-emacs-lisp-mode-hook 'append)
  ;; (remove-hook 'emacs-lisp-mode-hook 'flycheck-emacs-lisp-mode-hook)
  :config
  (message "Loading \"flycheck\"")
  (custom-set-variables
   '(flycheck-highlighting-mode 'lines)
   '(flycheck-display-errors-delay 1.8)
   '(flycheck-idle-change-delay 1.5)
   ;; '(flycheck-clang-language-standard "c++11")
   '(flycheck-clang-language-standard "gnu++11")
   ;; disabled display errors to window
   '(flycheck-display-errors-function #'flycheck-display-error-messages2)
   '(flycheck-pylintrc (expand-file-name ".pylint" (my-data-dir-get)))
   '(flycheck-disabled-checkers '(python-flake8 python-pycompile))
   )
  (face-spec-set 'flycheck-error
                 '((((class color) (background dark))
                    (:background "Firebrick4" :underline nil))
                   (((class color) (background light))
                    (:background "LightPink" :underline nil))
                   (t (:bold t))))
  (face-spec-set 'flycheck-warning
                 '((((class color) (background dark))
                    (:background "DarkBlue" :underline nil))
                   (((class color) (background light))
                    (:background "LightBlue2" :underline nil))
                   (t (:bold t :underline nil))))
  (defun flycheck-may-check-buffer ()
    "Determine whether the buffer may be checked.
A buffer may not be checked under the following conditions:
- The buffer is read only (see `buffer-read-only').
Return t if the buffer may be checked and nil otherwise."
    (if (and buffer-file-name
             (not (re-in-string "\\.junk\\." buffer-file-name)))
        t
      nil))
  (defun flycheck-display-error-messages2 (errors)
    "Redefine `flycheck-display-error-messages'.
messages return code '\n\n' => '\n'.
Display the messages of ERRORS.

Concatenate all non-nil messages of ERRORS separated by empty
lines, and display them with `display-message-or-buffer', which
shows the messages either in the echo area or in a separate
buffer, depending on the number of lines.

In the latter case, show messages in
`flycheck-error-message-buffer'."
    (-when-let (messages (-keep #'flycheck-error-message errors))
      (when (flycheck-may-use-echo-area-p)
        (display-message-or-buffer (s-join "\n" messages)
                                   flycheck-error-message-buffer))))

  ;;;; overwrite
  (flycheck-define-checker python-pylint
    "A Python syntax and style checker using Pylint.

This syntax checker requires Pylint 1.0 or newer.

See URL `http://www.pylint.org/'."
    ;; -r n disables the scoring report
    :command ("pylint" "-r" "n" "-d" "E0102"
              "--msg-template" "{path}:{line}:{column}:{C}:{msg_id}:{msg}"
              (config-file "--rcfile" flycheck-pylintrc)
              ;; Need `source-inplace' for relative imports (e.g. `from .foo
              ;; import bar'), see https://github.com/flycheck/flycheck/issues/280
              source-inplace)
    :error-filter
    (lambda (errors)
      (flycheck-sanitize-errors (flycheck-increment-error-columns errors)))
    :error-patterns
    ((error line-start (file-name) ":" line ":" column ":"
            (or "E" "F") ":"
            (id (one-or-more (not (any ":")))) ":"
            (message) line-end)
     (warning line-start (file-name) ":" line ":" column ":"
              (or "W" "R") ":"
              (id (one-or-more (not (any ":")))) ":"
              (message) line-end)
     (info line-start (file-name) ":" line ":" column ":"
           "C:" (id (one-or-more (not (any ":")))) ":"
           (message) line-end))
    :modes python-mode)
  )



(provide 'flycheck-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; flycheck-setup.el ends here
