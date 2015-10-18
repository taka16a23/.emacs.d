;; -*- Mode: Emacs-Lisp -*-

;;; maintain.el --- function for maintain
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




;;;###autoload
(defun do-directory-files (dir func &optional regexp)
  "Do function each file in directory."
  (dolist (f (directory-files (file-name-as-directory (expand-file-name dir)) t regexp))
    (unless (and (file-directory-p f)
                 (member (file-name-nondirectory f) '("." "..")))
      (with-current-buffer
          (find-file-noselect f)
        (ignore-errors
          (funcall func))
        (save-buffer)
        (kill-buffer)))))


(provide 'maintain)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; maintain.el ends here
