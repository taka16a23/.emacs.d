;; -*- Mode: Emacs-Lisp -*-

;;; purge-package.el --- purge package
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 18 18:17:51 2012 (+0900)
;; Last-Updated: 2013/11/01 00:17:25 (+0900)
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
;; 2013/04/14    Atami
;;    Add: `purge-package-flag'
;;    Modified: `purge-package'
;;    execute only once.
;;    and add force execute option.
;;
;; 2012/12/18    Atami
;;    initialize
;;
;;
;;; Code:


;;;###autoload
(defvar purge-package-list nil)

;;;###autoload
(defvar purge-package-flag t)

;;;###autoload
(defun purge-package (&optional force)
  "Purge package functions."
  (interactive)
  (when (or force purge-package-flag)
    (setq purge-package-flag nil)
    (message "Purging package functions")
    (mapatoms
     (function
      (lambda (symbol)
        (when (symbol-file symbol)
          (when (member (file-name-sans-extension
                         (file-name-nondirectory (symbol-file symbol))) purge-package-list)
            (unintern symbol obarray)
            (prin1 symbol)
            (princ "\n"))))))
    (message "Purged package functions")))


(provide 'purge-package)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; purge-package.el ends here
