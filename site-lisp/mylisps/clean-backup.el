;; -*- Mode: Emacs-Lisp -*-

;;; clean-backup.el --- delete backuped files
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/03/01 14:22:48 (+0900)
;; Last-Updated:2015/10/14 01:01:07 (+0900)
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
;; 2013/03/01    Atami
;;    Created
;;
;;
;;; Code:


(eval-when-compile
  (require 'subroutines_start nil 'noerror))

(defun clean--backup-files (dir)
  "Delete backup-files if not exists source."
  ;; windows
  (dolist (f (directory-files dir 'full))
    (unless (file-directory-p f)
      (let ((target
             (cond
              ((windows-p)
               (let*
                   ((trimed (file-name-nondirectory f))
                    (trimed (replace-regexp-in-string "\\(!drive_\\|\.~.+~$\\)" "" trimed))
                    (target (concat (substring trimed 0 1) ":"
                                    (replace-regexp-in-string "!" "/" trimed nil nil nil 1))))
                 target))
              ;; unix
              (t
               (let* ((trimed (file-name-nondirectory f))
                      (trimed (replace-regexp-in-string "\.~.+~$" "" trimed))
                      (target (replace-regexp-in-string "!" "/" trimed)))
                 target)))))
        (when (and target (not (file-exists-p target)))
          (delete-file f)
          (message "Deleted: %s" f))
        ))))

;;;###autoload
(defun clean-backup-files ()
  "Delete backup-files if not exists sources."
  (interactive)
  (clean--backup-files (my-backup-dir-get))
  (clean--backup-files (my-backup-dir-join "old/"))
  )



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; clean-backup.el ends here
