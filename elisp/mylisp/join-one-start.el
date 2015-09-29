;; -*- Mode: Emacs-Lisp -*-

;;; join-one-start.el --- join startup files
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:30:30 2012 (+0900)
;; Last-Updated: Sun Dec  9 18:30:30 2012 (+0900)
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
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(defvar joinone-remain-start-files '("~/.emacs.d/elisp/start.d/w3m_mode_start.el"
                                     "~/.emacs.d/elisp/start.d/test_start.el"))

(defvar joinone-file-name (concat my-var-dir "joined_start.el")
  "Joined file name.")

(defvar joinone-start-loader-full-regexp
  "\\(?:^[[:digit:]]\\{2\\}\\|^Windows_\\|^Emacs\\|^Linux_\\|^NoWindow_\\|^Mac_\\)")

;;;###autoload
(defun joinone-start-files ()
  (interactive)
  (let ((inhibit-read-only t)
        (before-save-hook nil)
        (after-save-hook nil))
    (find-file
     (joinone--ensure-default-file joinone-file-name))
    (goto-char (point-min))
    (search-forward ";;; Code:\n")
    ;; Insert files hear
    (dolist (f (joinone--file-list))
      ;; split strings other file
      (insert (concat ";;;; " (make-string 75 35) "\n") ; 35 char is "#"
              (concat ";;;; " (file-name-sans-extension f) "\n")
              ";;;;\n")
      (insert-file-contents f nil)
      (insert "\n")
      (goto-char (point-max))
      (search-backward "\^L" (max (- (point-max) 3000) (point-min))
                       'move)
      (insert "\n\n"))
    (save-buffer)
    ))

(defun joinone--ensure-default-file (file)
  "Make sure that file FILE exists and if exists delete it."
  (condition-case nil
      (if (file-exists-p file)
          (delete-file file))
    (file-error nil))
  (write-region (joinone--rubric file) nil file)
  file)

(defun joinone--rubric (file)
  "Return a string giving the appropriate joined rubric for FILE."
  (let ((basename (file-name-nondirectory file)))
    (concat ";;; " basename
            " --- automatically extracted init.el\n"
            ";;\n"
            ";;; Code:\n\n"
            "\n"
            ";; Local Variables:
;; coding: utf-8\n"
            ";; version-control: never\n"
            ";; no-byte-compile: t\n"
            ";; no-update-autoloads: t\n"
            ";; coding: utf-8\n"
            ";; End:\n"
            ";;; " basename
            " ends here\n")))

(defun joinone--file-list ()
  "List up for joinone."
  (let* ((fs (joinone--regexp-load-files joinone-start-loader-full-regexp my-start-dir 'sort)))
    ;; after load start-loader
    (dolist (el joinone-remain-start-files)
      (setq fs (append fs (list (expand-file-name el)))))
    ;; before load start-loader
    (push (concat my-start-dir "subroutines_start.el") fs)
    (push user-init-file fs)
    ))

(defun joinone--regexp-load-files (regexp dir &optional sort)
  "Return list of files in DIR by matches REGEXP.
If optional SORT then return sort of file list by `string<'."
  (let (files)
    (dolist (el (directory-files dir t))
      (when (and (string-match regexp (file-name-nondirectory el))
                 (string-match "el$" el))
        (setq files (cons el files))))
    (if sort (sort files 'string<) files)))


(provide 'join-one-start)
;; For Emacs
;; Local Variables:
;; End:
;;; join-one-start.el ends here
