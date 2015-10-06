;;; pymacs_plugin_start.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/05 11:18:44 (+0900)
;; Last-Updated: 2015/10/05 11:37:01 (+0900)
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
  (require 'pymacs)
  (require 'subroutines_start "subroutines_start" 'noerr)
  (require 'usage-memo "usage-memo" 'noerr) ;must need
  )

;;;###autoload
(defun pymacs-mode-custom-predefine ()
  "For `eval-after-load' pymacs customize."
  (message "eval-after-load: \"pymacs\" customizing..")
  (setq pymacs-timeout-at-start 45
        pymacs-timeout-at-reply 7
        ropemacs-guess-project       t
        ;; ropemacs-codeassist-maxfixes 3
        ropemacs-enable-autoimport   t
        ropemacs-autoimport-modules  '("os" "shutil" "sys" "logging"
                                       "django.*" "re"))
  )

;;;###autoload
(defun pymacs-mode-predefine ()
  "For `eval-after-load' pymacs function."
  (message "eval-after-load: \"pymacs\" setting..")
  (add-to-list 'pymacs-load-path my-pylib-dir)
  (pymacs-load "ropemacs" "rope-" 'noerror)
  ;; for usage memo
  (when (and (require 'usage-memo "usage-memo" 'noerr)
             (commandp 'rope-show-doc))
    (define-usage-memo rope-show-doc "python" 0 "*rope-pydoc*"
      (lambda (arg) (goto-char (point-min))
        (let ((text (buffer-substring (point)
                                      (save-excursion (end-of-line) (point)))))
          (replace-regexp-in-string "\s" "_" text))))))

;;;###autoload
(defun pymacs-mode-map-predefine ()
  "For pymacs key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"pymacs\" keymaping.."))
  )



(provide 'pymacs_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; pymacs_plugin_start.el ends here
