;;; modeline-setup.el ---   view setting for Emacs
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:
;; Last-Updated:2015/10/19 23:34:01 (+0900)
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



;;;; ModeLine format
;;
;; mode-line-position
(line-number-mode -1)

(column-number-mode -1)

(size-indication-mode -1)

(setq mode-line-position
      '(:eval (format "%%4l/%d,C%%2c"
                      (count-lines (point-max)
                                   (point-min)))))

;; mode-line-buffer-identification
(setq mode-line-buffer-identification
      '(#("%10b" 0 4 (local-map (keymap ... ...)
								mouse-face mode-line-highlight help-echo
								"Buffer name" face mode-line-buffer-id))))
;; mode-line-format
(setq-default mode-line-format
              '("%e"
                ;; mode-line-position
                "%4l/%I,C%2c"
                " "
                "%*"   ; mode-line-modified
                " "
                mode-line-buffer-identification
                " "
                "%z"   ; mode-line-mule-info
                "%2@"  ; mode-line-remote
                mode-name
                minor-mode-alist
                (vc-mode vc-mode)
                ))

;; mode-line
(custom-set-faces
 '(modeline ((t (:bold t :background "chartreuse1" :foreground "black"))))
 '(mode-line-inactive ((t (:bold nil :background "grey30" :foreground "grey80"))))
 ;; '(modeline-buffer-id ((t (:bold nil :background "black" :foreground "white")))))
 '(modeline-mousable ((t (:background "white" :foreground "white"))))
 '(modeline-mousable-minor-mode ((t (:background "white" :foreground "white")))))

(defun mode-line-point-on ()
  "Set viewable point in mode line."
  (interactive)
  (setq mode-line-format
		'("%e"
		  mode-line-position
		  ",P"
		  (:eval (format "%4d" (point)))
		  " "
		  "%z"   ;mode-line-mule-info
		  " "
		  mode-line-buffer-identification
		  " "
		  "%*"   ;mode-line-modified
		  "%2@"  ;mode-line-remote
		  mode-name
		  )))

(defun mode-line-point-off ()
  "Unset viewable point in mode line."
  (interactive)
  (setq mode-line-format
		'("%e"
		  mode-line-position
		  " "
		  "%z"   ;mode-line-mule-info
		  " "
		  mode-line-buffer-identification
		  " "
		  "%*"   ;mode-line-modified
		  "%2@"  ;mode-line-remote
		  mode-name
		  )))

(defun toggle-mode-line ()
  "Toggle-mode-line."
  (interactive)
  (if orig-mode-line-format
      (progn (setq mode-line-format orig-mode-line-format
                   orig-mode-line-format nil))
    (setq orig-mode-line-format mode-line-format)
    (setq mode-line-format '("%e"
                             mode-line-position
                             ",P"
                             (:eval (format "%4d" (point)))
                             " "
                             "%z"   ; mode-line-mule-info
                             " "
                             mode-line-buffer-identification
                             " "
                             "%*"   ; mode-line-modified
                             "%2@"  ; mode-line-remote
                             mode-name
                             )))
  )



(provide 'modeline-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; modeline-setup.el ends here
