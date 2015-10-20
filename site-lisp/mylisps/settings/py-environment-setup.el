;;; py-environment-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/15 01:16:51 (+0900)
;; Last-Updated:2015/10/21 01:40:03 (+0900)
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

(define-my-path my-pylib-dir (my-data-dir-join "pylib"))

(defun pythonpath-get () ;[2015/10/21]
  ""
  (getenv "PYTHONPATH"))

(defun pythonpath-list () ;[2015/10/21]
  ""
  (s-split ":" (pythonpath-get)))

(defun pythonpath-append (path &optional head) ;[2015/10/21]
  "PATH"
  (let ((path-list (if head
                       (append (list path) (pythonpath-list))
                     (append (pythonpath-list) (list path)))))
    (setenv "PYTHONPATH" (s-join ":" (delete-dups path-list)))))

(defun pythonpath-remove (path) ;[2015/10/21]
  "PATH"
  (setenv "PYTHONPATH" (s-join ":" (-remove-item path (pythonpath-list)))))



(provide 'py-environment-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; py-environment-setup.el ends here
