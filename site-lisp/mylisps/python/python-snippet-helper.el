;;; python-snippet-helper.el ---    setting for org mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Last-Updated:2015/10/21 03:39:19 (+0900)
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
;;
;;; Code:


;;;###autoload
(defun py-snippet:argparse-add_argument-convert-dest-name (text) ;[2015/09/25]
  "ARGS"
  (let* ((lis (mapcar '(lambda (x) (replace-regexp-in-string "[\"' ]" "" x))
                      (split-string text ",")))
         (n 0)
         (length (length lis))
         matched)
    (unless (eq "" (car lis))
      (while (< n length)
        (when (string-match "^--" (nth n lis))
          (setq matched (substring (nth n lis) 2)))
        (incf n))
      (setq n 0)
      (unless matched
        (while (< n length)
          (when (string-match "^-" (nth n lis))
            (setq matched (substring (nth n lis) 1)))
          (incf n)))
      (unless matched
        (setq matched (car lis)))
      (replace-regexp-in-string "-" "_" matched))
    ))

;;;###autoload
(defun prev-def-name ()
  (save-excursion
    (if (re-search-backward "def +\\(.+?\\)(" nil t)
        (match-string 1))))

;;;###autoload
(defun prev-def-args ()
  (save-excursion
    (if (re-search-backward "def +\\(.+?\\)( *self *,? *\\(.*\\))" nil t)
        (match-string 2))))

;;;###autoload
(defun prev-class-name ()
  (save-excursion
    (if (re-search-backward "class +\\(.+?\\) *[(:]" nil t)
        (match-string 1))))



(provide 'python-snippet-helper)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; python-snippet-helper.el ends here

