;;; auto-recover.el --- auto recover from auto-save
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:30:28 2012 (+0900)
;; Last-Updated: 2013/11/01 16:15:19 (+0900)
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
;; 2013/02/12    Atami
;;    Modified: `auto-recover-startup'
;;    exclude matched files by `auto-recover-exclude-re'
;;
;; 2013/01/28    Atami
;;    Fixed: `file-name-from-auto-save'
;;    file name "!!" to ":!" on Windows
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'subroutines_start nil 'noerror)
  (defvar my-bk-autosave-dir))

;;;###autoload
(defvar auto-recover-exclude-re "\\.junk\\.")

;;;###autoload
(defun auto-recover-startup ()
  "Auto recover from auto save.
If auto save file is old, then will delete it."
  (let ((files (directory-files my-bk-autosave-dir))
        (find-file-hook nil)
        f-location
        source-file)
    (dolist (f files)
        (setq f-location (expand-file-name f my-bk-autosave-dir))
        (when (and (auto-save-file-name-p f)
                   (not (string-match auto-recover-exclude-re f)))
          (setq source-file (file-name-from-auto-save f))
          (if (file-newer-than-file-p f-location source-file)
              (if (not (file-exists-p f-location))
                  ;; recover by copy
                  (progn
                    (copy-file f-location source-file)
                    (find-file-noselect source-file)
                    (message (format "%s recovered from auto-save by copy" source-file)))
                ;; recover by insert contents
                (switch-to-buffer (find-file-noselect source-file))
                (let ((inhibit-read-only t)
                      (coding-system buffer-file-coding-system)
                      (coding-system-for-read 'auto-save-coding))
                  (erase-buffer)
                  (insert-file-contents f-location nil)
                  (set-buffer-file-coding-system coding-system))
                (after-find-file nil nil t))
            (delete-file f-location))))))

;;;###autoload
(defun cleanup-autosave (&optional force)
  "Clean up auto save file.
If auto save file is old, then will delete it."
  (interactive "p")
  (let ((files (directory-files my-bk-autosave-dir))
        (find-file-hook nil)
        f-location
        source-file
        deleted)
    (dolist (f files)
      (setq f-location (expand-file-name f my-bk-autosave-dir))
      (when (auto-save-file-name-p f)
        (setq source-file (file-name-from-auto-save f))
        (when (or (not (file-newer-than-file-p f-location source-file))
                  force)
          (setq deleted (append deleted (list (format "Deleted %s" f))))
          (delete-file f-location))))
    (message "%s" (mapconcat 'identity deleted "\n"))))

;;;###autoload
(defun force-cleanup-autosave ()
  "ARGS"
  (interactive)
  (cleanup-autosave 'force))

;;;###autoload
(defun before-kill-emacs-cleanup-autosave ()
  (do-auto-save t)
  (cleanup-autosave))

(defun file-name-from-auto-save (file)
  (replace-regexp-in-string
   "!" "/"
   (replace-regexp-in-string
    "#" ""
    (replace-regexp-in-string
     "!!" (if (windows-p) ":" "!") file))))


(provide 'auto-recover)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; auto-recover.el ends here
