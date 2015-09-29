;;; recentf_plugin_start.el --- functions for recentf
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Thu Dec 13 00:49:46 2012 (+0900)
;; Last-Updated: 2013/11/01 16:49:33 (+0900)
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
;; 2012/12/13    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (defvar my-var-dir)
  (require 'recentf "recentf" 'noerr))


;;;###autoload
(defun recentf-mode-custom-predefine ()
  "For `eval-after-load' recentf customize."
  (message "eval-after-load: \"recentf\" customizing..")
  (custom-set-variables
   '(recentf-save-file (concat my-var-dir "recentfile"))
   '(recentf-exclude '("recentfile"))
   '(recentf-max-saved-items 400)
   '(recentf-auto-cleanup "11:00pm"))
  )

;;;###autoload
(defun recentf-mode-predefine ()
  "For `eval-after-load' recentf function."
  (message "eval-after-load: \"recentf\" setting..")
  (require 'recentf-ext)
  (or recentf-mode (recentf-mode 1)))

(defun recentf-save-list ()
  "Save the recent list.
Write data into the file specified by `recentf-save-file'."
  (interactive)
  (condition-case error
      (with-temp-buffer
        (erase-buffer)
        (set-buffer-file-coding-system recentf-save-file-coding-system)
        (insert (format recentf-save-file-header (current-time-string)))
        (recentf-dump-variable 'recentf-list recentf-max-saved-items)
        (recentf-dump-variable 'recentf-filter-changer-current)
        (insert "\n\n;; Local Variables:\n"
                (format ";; coding: %s\n" recentf-save-file-coding-system)
                (format ";; backup-inhibited: t\n" )
                (format ";; version-control: 'never\n" )
                ";; End:\n")
        (write-file (expand-file-name recentf-save-file))
        (when recentf-save-file-modes
          (set-file-modes recentf-save-file recentf-save-file-modes))
        nil)
    (error
     (warn "recentf mode: %s" (error-message-string error)))))

(defadvice recentf-save-list (around recentf-prevent-backup activate)
  "Ignore save-hook."
  (let ((before-save-hook nil)
        ;; (after-save-hook nil)
        (version-control 'never)
        (backup-inhibited t)
        (backup-by-copying nil)
        (buffer-backed-up t))
    ad-do-it))



(provide 'recentf_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; recentf_plugin_start.el ends here
