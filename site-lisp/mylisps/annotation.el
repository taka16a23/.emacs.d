;;; annotation.el --- insert or replace annotation string in code
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/09/24 04:15:52 (+0900)
;; Last-Updated: 2013/09/24 04:21:16 (+0900)
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
;; Features that might be required by this library:
;;
;;   Required feature `annotation' was not provided.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;; 2013/09/24    Atami
;;    initialize:
;;    func `annotation', `annotation-line-p', `annotation-make-re'
;;    `which-in-list'
;;    var `annotation-list', `annotation-format', `annotation-timestamp-format'
;;
;;
;;; Code:


(require 'll-debug nil 'noerror)

(defvar annotation-list '("TODO" "FIXME" "BUG" "WARNING" "KLUDGE"))
(defvar annotation-format " %s: (%s) [%s]")
(defvar annotation-timestamp-format "%Y/%m/%d")

;;;###autoload
(defun annotation ()
  "Insert Annotation tag from `annotation-list'."
  (interactive)
  (let ((p (annotation-line-p)))
    (if p
        (save-excursion
          (goto-char p)
          (let* ((bounds (bounds-of-thing-at-point 'word))
                 (str (match-string 0))
                 (n (which-in-list str annotation-list)))
            (delete-region (car bounds) (cdr bounds))
            (insert (nth (if (eq (1+ n) (length annotation-list))
                             0
                           (1+ n))
                         annotation-list))))
      (ll-debug-open-fresh-line)
      (insert (concat (replace-regexp-in-string " " "" comment-start)
                      (format annotation-format
                              (car annotation-list)
                              user-full-name
                              (format-time-string annotation-timestamp-format)
                              )))
      (forward-line)
      (indent-according-to-mode))))

(defun annotation-line-p ()
  "Predicate in annotation line."
  (save-excursion
    (end-of-line)
    (re-search-backward (annotation-make-re)
                        (save-excursion
                          (beginning-of-line) (point)) 'noerror)
    (let ((face (what-face-at-point)))
      (if (or (eq 'font-lock-comment-face face)
              (member 'font-lock-comment-face face))
          (point)
        nil))))

(defun annotation-make-re ()
  "Annotation REGEXP."
  (let ((re "\\(?:")
        notfirst)
    (dolist (el annotation-list)
      (if notfirst
          (setq re (concat re "\\|" el))
        (setq notfirst t)
        (setq re (concat re el)))
      )
    (concat re "\\)")))

(defun which-in-list (target list)
  "Return nth of list.
TARGET: (str)
LIST: list"
  (let ((n 0)
        (len (length list))
        done)
    (while (and (not done)
                (> len n))
      (if (string= target (nth n list))
          (setq done t)
        (setq n (1+ n))))
    (if (> len n)
        n nil)))



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; annotation.el ends here
