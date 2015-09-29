;; -*- Mode: Emacs-Lisp -*-

;;; rotate-text.el --- rotate text
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec 12 18:41:03 2012 (+0900)
;; Last-Updated: 2013/01/27 22:50:57 (+0900)
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
;; 2013/01/27    Atami
;;    Fixed: `rotate-text-rotations'
;;    `make-local-variable' to `make-variable-buffer-local'
;;
;; 2012/12/12    Atami
;;    initialize
;;
;;
;;; Code:


;;;; rotate text
;; http://www.emacswiki.org/emacs/RotateText
;;;###autoload
(defvar rotate-text-rotations '() "List of text rotation sets.")

;;;###autoload
(make-variable-buffer-local 'rotate-text-rotations)

;;;###autoload
(defun rotate-region (beg end)
  "Rotate all matches in `rotate-text-rotations' between point and mark."
  (interactive "r")
  (let ((regexp (rotate-convert-rotations-to-regexp
                 rotate-text-rotations))
        (end-mark (copy-marker end)))
    (save-excursion
      (goto-char beg)
      (while (re-search-forward regexp (marker-position end-mark) t)
        (let* ((found (match-string 0))
               (replace (rotate-next found)))
          (replace-match replace))))))

;;;###autoload
(defun rotate-string (string &optional rotations)
  "Rotate all matches in STRING using associations in ROTATIONS.
If ROTATIONS are not given it defaults to `rotate-text-rotations'."
  (let ((regexp (rotate-convert-rotations-to-regexp
                 (or rotations rotate-text-rotations)))
        (start 0))
    (while (string-match regexp string start)
      (let* ((found (match-string 0 string))
             (replace (rotate-next
                       found
                       (or rotations rotate-text-rotations))))
        (setq start (+ (match-end 0)
                       (- (length replace) (length found))))
        (setq string (replace-match replace nil t string))))
    string))

;;;###autoload
(defun rotate-next (string &optional rotations)
  "Return the next element after STRING in ROTATIONS."
  (let ((rots (rotate-get-rotations-for
               string
               (or rotations rotate-text-rotations))))
    (if (> (length rots) 1)
        (error (format "Ambiguous rotation for %s" string))
      (if (< (length rots) 1)
          ;; If we get this far, this should not occur:
          (error (format "Unknown rotation for %s" string))
        (let ((occurs-in-rots (member string (car rots))))
          (if (null occurs-in-rots)
              ;; If we get this far, this should *never* occur:
              (error (format "Unknown rotation for %s" string))
            (if (null (cdr occurs-in-rots))
                (caar rots)
              (cadr occurs-in-rots))))))))

;;;###autoload
(defun rotate-get-rotations-for (string &optional rotations)
  "Return the string rotations for STRING in ROTATIONS."
  (remq nil (mapcar (lambda (rot) (if (member string rot) rot))
                    (or rotations rotate-text-rotations))))

;;;###autoload
(defun rotate-convert-rotations-to-regexp (rotations)
  (regexp-opt (rotate-flatten-list rotations)))

;;;###autoload
(defun rotate-flatten-list (list-of-lists)
  "Flatten LIST-OF-LISTS to a single list.
Example:
  (rotate-flatten-list '((a b c) (1 ((2 3)))))
    => (a b c 1 2 3)"
  (if (null list-of-lists)
      list-of-lists
    (if (listp list-of-lists)
        (append (rotate-flatten-list (car list-of-lists))
                (rotate-flatten-list (cdr list-of-lists)))
      (list list-of-lists))))

;;;###autoload
(defun rotate-word-at-point ()
  "Rotate word at point based on sets in `rotate-text-rotations'."
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'word))
        (opoint (point)))
    (when (consp bounds)
      (let ((beg (car bounds))
            (end (copy-marker (cdr bounds))))
        (rotate-region beg end)
        (goto-char (if (> opoint end) end opoint))))))

;;;###autoload
(defun indent-or-rotate ()
  "If point is at end of a word, then else indent the line."
  (interactive)
  (if (looking-at "\\>")
      (rotate-region (save-excursion (forward-word -1) (point))
                     (point))
    (indent-for-tab-command)))


(provide 'rotate-text)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; rotate-text.el ends here
