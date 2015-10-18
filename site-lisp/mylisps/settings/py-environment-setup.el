;;; py-environment-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2015/10/15 01:16:51 (+0900)
;; Last-Updated:2015/10/15 01:19:56 (+0900)
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

(defconst my-pylib-dir
  (replace-regexp-in-string "/" "\\\\" (my-data-dir-join "pylib"))
  "Location of parsonal python library.Do not add '/'.")

;;;###autoload
(defun python-setenv ()
  "Python set environment."
  (interactive)
  (let ((python-path (getenv "PYTHONPATH")))
    (if (and python-path
             (not (string= python-path "")))
        (when (not (string-match
                    (replace-regexp-in-string "\\\\" "\\\\\\\\" my-pylib-dir)
                    python-path))
          (setenv "PYTHONPATH" (concat python-path path-separator my-pylib-dir))
          (message (concat "PYTHONPATH: " (getenv "PYTHONPATH"))))
      (setenv "PYTHONPATH" my-pylib-dir)
      (message "PYTHONPATH false"))))



(provide 'py-environment-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; py-environment-setup.el ends here
