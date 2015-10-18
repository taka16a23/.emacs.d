;; -*- Mode: Emacs-Lisp -*-

;;; check-misspell.el --- check misspell
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Wed Dec 12 16:12:54 2012 (+0900)
;; Last-Updated: 2013/10/03 16:41:41 (+0900)
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
;; 2013/01/04    Atami
;;    Modified: typemiss-list to local variables
;;
;; 2012/12/12    Atami
;;    initialize
;;
;;
;;; Code:


;;;###autoload
(defvar no-check-type-miss nil)
(make-local-variable 'no-check-type-miss)

;;;###autoload
(defvar typemiss-list '())

;;;###autoload
(make-variable-buffer-local 'typemiss-list)

;; check misstype ;[2012/10/27]
;;;###autoload
(defun check-misspell ()
  (interactive)
  (let ((inhibit-read-only t))
    (save-excursion
      (unless no-check-type-miss
        (dolist (elt typemiss-list)
          (query-replace-regexp (car elt) (cdr elt) nil
                                (point-min) (point-max)))))))


(provide 'check-misspell)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; check-misspell.el ends here
