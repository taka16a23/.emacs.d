;; -*- Mode: Emacs-Lisp -*-

;;; timestamp-insert.el --- timstamp insert from popup
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:30:40 2012 (+0900)
;; Last-Updated: Sun Dec  9 18:30:40 2012 (+0900)
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


(require 'popup)

(defvar time-format-list
  '("%c"
	"%Y/%m/%d" "%y/%m/%d" "%D" "%m/%d"
	"%Y%m%d"   "%y%m%d"
	"%T" "%R"
	"%Y年%m月%d日"
	"%Y-%m-%d" "%y-%m-%d" "%m-%d"
	"%Y.%m.%d" "%y.%m.%d"
	))

;;;###autoload
(defun timestamp-insert () ;[2012/10/29]
  "timestamp insert from popup menu"
  (interactive)
  (let ((val (popup-menu*
              (mapcar (lambda (x)
                        (popup-make-item x :value x))
                      (mapcar 'format-time-string time-format-list))
              :scroll-bar t)))
    (and val (insert val))))


(provide 'timestamp-insert)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; timestamp-insert.el ends here
