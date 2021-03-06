;;; frame-setup.el ---   for specific my main desktop pc setting.
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/09/15 05:18:58 (+0900)
;; Last-Updated:2015/10/19 23:36:19 (+0900)
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


(eval-when-compile
  (require 'cl "cl" 'noerr)
  (require 'dash "dash" 'noerr)
  )

(defun main-frame-monitor-attributes () ;[2015/09/15]
  ""
  (car (display-monitor-attributes-list)))

(defun frame-in-main-monitor-p () ;[2015/09/15]
  "
  `main-frame-monitor-attributes', `frame-monitor-attributes' from 24.4
  "
  (if (<= 25 emacs-major-version)
      (equal (main-frame-monitor-attributes) (frame-monitor-attributes))
                                        ; TODO: (Atami) [2015/09/15]
                                        ; predicate for version before 24.4
    nil
    ))

(defun main-monitor-geometry () ;[2015/09/15]
  ""
  (if (<= 25 emacs-major-version)
      (cdar (main-frame-monitor-attributes))
    1280 0 1680 1050 ;tmp
    ))

(defun frame-move-main-monitor (frame) ;[2015/09/15]
  "FRAME"
  (let* ((geo (main-monitor-geometry))
         (x (nth 0 geo))
         (y (nth 1 geo)))
    (set-frame-position frame x y)
    )
  )

(defun running-emacs-count () ;[2015/09/17]
  ""
  ;; (count (lambda (name) (string= name "emacs"))
  ;;         (mapcar (lambda (pid) (cdr (assoc 'comm (process-attributes pid))))
  ;;                 (list-system-processes)))
  (let ((count 0))
    (dolist (psname (mapcar (lambda (pid) (cdr (assoc 'comm (process-attributes pid))))
                            (list-system-processes)))
      (when (string= psname "emacs")
        (incf count)))
    count))


;; move to main monitor if not in.
(when (not (frame-in-main-monitor-p))
  (frame-move-main-monitor (selected-frame)))
(when (>= 1 (running-emacs-count))
  (set-frame-parameter nil 'fullscreen 'maximized))



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; frame-setup.el ends here
