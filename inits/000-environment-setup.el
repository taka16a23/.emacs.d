;;; environment-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/10 17:11:28 (+0900)
;; Last-Updated:2015/10/19 13:49:07 (+0900)
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


(require 'init-loader "init-loader" 'noerr) ;for my-inits-dir

(custom-set-variables '(user-full-name "Atami"))

(defmacro define-my-path (var-name path &optional doc)
  "Define my const path.
VAR-NAME
PATH
DOC"
  `(progn
     (defconst ,var-name ,path ,doc)
     (defun ,(intern (concat (symbol-name var-name) "-get")) ()
       ""
       (interactive)
       (unless (file-exists-p ,path)
         (condition-case nil
             (make-directory ,path 'parents)
           (file-error (message "IO error cannot make directory: %s" ,path))))
       ,var-name)
     (defun ,(intern (concat (symbol-name var-name) "-join")) (path)
       ""
       (directory-file-name (expand-file-name path ,var-name)))
     ))

(define-my-path my-emacs-dir (expand-file-name (or user-emacs-directory "~/.emacs.d"))
  "My .emacs.d directory.")

(define-my-path my-elisp-dir my-emacs-dir "My elisp directory.")

(define-my-path my-inits-dir init-loader-directory "My inits files directory.")

(define-my-path my-site-lisp-dir (my-elisp-dir-join "site-lisp")
  "My site-lisp directory.")

(define-my-path my-mylisps-dir (my-site-lisp-dir-join "mylisps")
  "My written lisp in mylisps directory.")

(define-my-path my-settings-dir (my-mylisps-dir-join "settings")
  "My settings directory.")

(define-my-path my-var-dir (my-elisp-dir-join "var.d") "My var directory.")

(define-my-path my-backup-dir (my-var-dir-join "backup.d")
  "My backup directory.")

(define-my-path my-bk-etc-dir (my-backup-dir-join "etc")
  "My backup etc dirctory.")

(define-my-path my-bk-autosave-dir (my-backup-dir-join "auto-save")
  "My auto save directory")

(define-my-path my-data-dir (my-emacs-dir-join "data.d") "My data directory.")

(define-my-path my-log-dir (my-var-dir-join "log") "MY log directory")

(define-my-path my-code-dir (my-data-dir-join "code") "My code directory")

(defconst my-allinone-path (my-emacs-dir-join "allinone.org")
  "Path to allinone.org.")



(provide 'environment-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; environment-setup.el ends here
