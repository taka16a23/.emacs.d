;;; log-edit-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/15 03:24:32 (+0900)
;; Last-Updated:2015/10/19 18:37:05 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package log-edit
  ;; :disabled
  :defer
  :init
  :config
  (message "Loading \"log-edit\"")
  (bind-keys :map log-edit-mode-map
             ("C-s" . log-edit-done))
  (defadvice log-edit
      (around override-log-edit activate)
    (let ((parent (current-buffer)))
      (if buffer (pop-to-buffer buffer))
      (when (and log-edit-setup-invert (not (eq setup 'force)))
        (setq setup (not setup)))
      (when setup
        (erase-buffer)
        (insert "Summary: \nAuthor: " user-full-name)
        (save-excursion (insert "\n\n")))
      (if mode
          (funcall mode)
        (log-edit-mode))
      (set (make-local-variable 'log-edit-callback) callback)
      (if (listp params)
          (dolist (crt params)
            (set (make-local-variable (car crt)) (cdr crt)))
        ;; For backward compatibility with log-edit up to version 22.2
        ;; accept non-list PARAMS to mean `log-edit-list'.
        (set (make-local-variable 'log-edit-listfun) params))

      (if buffer (set (make-local-variable 'log-edit-parent-buffer) parent))
      (set (make-local-variable 'log-edit-initial-files) (log-edit-files))
      (when setup (run-hooks 'log-edit-hook))
      (goto-char (point-min)) (push-mark (point-max))
      (message "%s" (substitute-command-keys
                     "Press \\[log-edit-done] when you are done editing.")))
    )
  (defadvice log-edit
      (after move-editable-point-log-edit activate)
    (end-of-line)
    )
  )



(provide 'log-edit-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; log-edit-setup.el ends here
