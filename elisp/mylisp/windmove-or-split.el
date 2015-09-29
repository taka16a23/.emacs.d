;; -*- Mode: Emacs-Lisp -*-

;;; windmove-or-split.el --- window move or split
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:30:43 2012 (+0900)
;; Last-Updated: 2015/09/12 01:25:49 (+0900)
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
;; 2015/09/12    Atami
;;    Fixed: `windmove-or-splitmove' wrap `ignore-errors' funcall at emacs version 24.5
;;
;; 2013/02/22    Atami
;;    Fixed: `windmove-or-splitmove' add nosplit options
;;
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(windmove-default-keybindings)
;; window move or split
;; [2012/09/19] [2012/10/31]
(defvar windmove-max-elapse-time 0.8)
(defvar windmove-last-time 0) ; initialize

;;;###autoload
(defun windmove-or-splitmove (mvcmd splitcmd &optional nosplit)
  "Try window move. If not exist window then split it.
もし前回呼ばれた時間の差が`windmove-max-elapse-time'よりも短ければ
`windmove-wrap-around' をnil にする。
MVCMD set `windmove-right', `windmove-left', `windmove-up', `windmove-down'
NOSPLIT non-nil is no split."
  (let ((current-win (selected-window))
        (windmove-wrap-around (if (> (- (let ((ct (current-time)))
                                          (+ (* (car ct) 65536.0)
                                             (nth 1 ct)
                                             (* (nth 2 ct) 1.0e-6)))
                                        windmove-last-time)
                                     windmove-max-elapse-time)
                                  t
                                nil)))
    (setq windmove-last-time (let ((ct (current-time)))
                               (+ (* (car ct) 65536.0)
                                  (nth 1 ct)
                                  (* (nth 2 ct) 1.0e-6))))
    ;; If moved window same then split.
    (ignore-errors (funcall mvcmd))
    (if (and windmove-wrap-around
             (eq current-win (selected-window))
             (eq nosplit nil))
        (progn
          (funcall splitcmd)
          (funcall mvcmd)))))

;;;###autoload
(defun windmove-down-or-splitmove (&optional args)
  "Try window move down. If not exist window then split it vertically"
  (interactive "p")
  (if (eq args 4)
	  (progn (split-window-vertically)
			 (windmove-down))
	(windmove-or-splitmove 'windmove-down 'split-window-vertically)))

;;;###autoload
(defun windmove-up-or-splitmove (&optional args)
  "Try window move up. If not exist window then split it vertically"
  (interactive "p")
  (if (eq args 4)
	  (progn (split-window-vertically)
			 (windmove-up))
	(windmove-or-splitmove 'windmove-up 'split-window-vertically)))

;;;###autoload
(defun windmove-left-or-splitmove (&optional args)
  "Try window move left. If not exist window then split it horizontally"
  (interactive "p")
  (if (eq args 4)
	  (progn (split-window-horizontally)
			 (windmove-left))
	(windmove-or-splitmove 'windmove-left 'split-window-horizontally)))

;;;###autoload
(defun windmove-right-or-splitmove (&optional args)
  "Try window move right. If not exist window then split it horizontally"
  (interactive "p")
  (if (eq args 4)
	  (progn (split-window-horizontally)
			 (windmove-right))
	(windmove-or-splitmove 'windmove-right 'split-window-horizontally)))



(provide 'windmove-or-split)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; windmove-or-split.el ends here
