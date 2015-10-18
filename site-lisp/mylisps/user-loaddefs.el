;;; user-loaddefs.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/11 13:41:33 (+0900)
;; Last-Updated:2015/10/11 16:56:12 (+0900)
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


(require 'autoload "autoload" 'noerr)
(require '00_environment_setup "00_environment_setup" 'noerr)

(defvar loaddefs-name ".loaddefs.el")

(defun user-loaddefs-recursive-directory-candidates (top-dir) ;[2015/10/11]
  "TOP-DIR"
  (let (stackdirs
        (pending (list top-dir)))
    (while pending
      (push (pop pending) stackdirs)
      (let* ((this-dir          (car stackdirs))
             ;; for file-directory-p
             (default-directory this-dir)
             (contents          (directory-files this-dir)))
        (dolist (file contents)
          (unless (member file '("." ".." "RCS" "CVS" "rcs" "cvs"))
            (when (and (string-match "\\`[[:alnum:]]" file)
                       (file-directory-p file))
              (let ((expanded (expand-file-name file)))
                (setq pending (nconc pending (list expanded)))))))))
    stackdirs))

;;;###autoload
(defun user-generate-loaddefs (name top-dir) ;[2015/10/11]
  "NAME
DIR"
  (let* ((fname name)
         (generated-autoload-file (expand-file-name name top-dir))
         (noninteractive inhibit-message)
         (inhibit-read-only t)
         (backup-inhibited t)
         (version-control 'never)
         (emacs-lisp-mode-hook nil)
         buf)
    (when (file-exists-p generated-autoload-file)
      (ignore-errors (delete-file generated-autoload-file)))
    (when (file-exists-p (concat generated-autoload-file "c"))
      (ignore-errors (delete-file generated-autoload-file)))
    (unless (file-exists-p generated-autoload-file)
      (write-region
       (concat ";;; " (file-name-nondirectory generated-autoload-file)
               " --- automatically extracted autoloads\n"
               ";;\n"
               ";;; Code:\n"
               "\n;; Local Variables:\n"
               ";; version-control: never\n"
               ";; no-byte-compile: t\n"
               ";; no-update-autoloads: t\n"
               ";; coding: utf-8"
               ";; End:\n"
               ";;; " (file-name-nondirectory generated-autoload-file)
               " ends here\n")
       nil generated-autoload-file nil 'silent))
    (apply #'update-directory-autoloads
           (user-loaddefs-recursive-directory-candidates top-dir))
    (setq buf (find-buffer-visiting generated-autoload-file))
    (when buf
      (with-current-buffer buf
        (emacs-lisp-byte-compile)
        (kill-buffer buf)))))



(provide 'user-loaddefs)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; user-loaddefs.el ends here
