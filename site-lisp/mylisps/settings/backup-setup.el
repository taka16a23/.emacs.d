;;; backup-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/11 07:41:15 (+0900)
;; Last-Updated:2015/10/17 00:39:32 (+0900)
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


(require 'environment-setup "environment-setup" 'noerr)

(custom-set-variables
 '(backup-by-copying t)
 '(backup-by-copying-when-mismatch t)
 '(version-control             'numbered)
 '(vc-command-messages               nil)
 '(kept-old-versions                   1)
 '(kept-new-versions                  20)
 '(delete-old-versions                 t)
 ;; 改名するとファイルの所有者やグループを変更してしまう場合に
 ;; コピ ーしてバックアップする。
 '(vc-directory-exclusion-list
   (quote ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git"
           ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "etc/data")))
 )

;;;; Backups location
;;
(setq backup-directory-alist
      (cons (cons "^/etc/" (my-bk-etc-dir-get))
            (list (cons "" (my-backup-dir-get)))))

;; Copy linked files, don't rename.
(setq backup-by-copying-when-linked t)

(defsubst force-backup-of-buffer ()
  "Force backup buffer."
  (unless backup-inhibited
    (let ((buffer-backed-up nil))
      (backup-buffer))))

(add-hook 'before-save-hook 'force-backup-of-buffer)

(defvar avoid-old-backup-re "\\(png\\|jpg\\)$")

(defun backup-first-change ()
  "If first change after open file, backup file."
  (when (and (not buffer-backed-up)
             buffer-file-name
             (not (string-match avoid-old-backup-re buffer-file-name)))
    (let ((kept-new-versions 10)
          (kept-old-versions 0)
          (backup-directory-alist (make-backup-old-dir)))
      (message "Make revision %s" buffer-file-name)
      (backup-buffer))))

(add-hook 'first-change-hook 'backup-first-change)

(defun make-backup-revision ()
  "Make revision."
  (interactive)
  (let ((buffer-backed-up nil))
    (backup-first-change)))

(defun make-backup-old-dir ()
  "Make backup dir for old revision."
  (let (dir tmp)
    (dolist (el backup-directory-alist)
      (setq dir (expand-file-name "old" (cdr el)))
      (push (cons (car el) dir) tmp)
      (if (and dir (not (file-exists-p dir)))
          (condition-case nil
              (make-directory dir 'parents)
            (file-error (message "IO error in: %s" dir)))))
    (reverse tmp)))

(require 't1-bind-key "t1-bind-key" 'noerr)
(t1-ctl-x-bind-keys '(("C-b" . make-backup-revision)
                      ("b" . make-backup-revision)))



(provide 'backup-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; backup-setup.el ends here
