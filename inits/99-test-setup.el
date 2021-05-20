;;; test-setup.el ---   test setting space
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:29:09 2012 (+0900)
;; Last-Updated:2021/05/20 12:43:57 (+0900)
;; Last-Updated: 2015/10/12 21:59:39 (+0900)
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


(defun replace-static () ;[2020/06/07]
  ""
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (save-excursion
      (replace-regexp "\\.\\./\\.\\." "/static")
      )
    (save-excursion
      (replace-regexp "\\.\\./" "/static/")
      )
    )
  )

(defun mc/mark-next-last-line () ;[2021/05/20]
  ""
  (interactive)
  (let ((lines (count-lines (point-min) (point-max))))
    (dotimes (number lines)
      (mc/mark-next-like-this (point))
      )
    )
  )



(provide 'test-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; no-update-autoloads: t
;; End:
;;; test-setup.el ends here
