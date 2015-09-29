;;; Linux_keyrate_start.el --- Setting for keyrate on Linux
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/03/01 13:50:03 (+0900)
;; Last-Updated: 2013/03/01 13:51:32 (+0900)
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
;; 2013/03/01    Atami
;;    Created
;;
;;
;;; Code:


;; TODO increase decrease keyrate function
(defun my-set-keyrate (lat rate)
  (shell-command (format "xset r rate %d %d" lat rate) nil nil))

(defun keyrate-default ()
  "default keyrate"
  (interactive)
  ;; (my-set-keyrate 250 50)
  (my-set-keyrate 230 65)
  (message "Default keyrate intalled."))

(defun keyrate-fast ()
  "fast keyrate"
  (interactive)
  (my-set-keyrate 250 100)
  (message "Fast keyrate intalled"))

(defun keyrate-slow ()
  "slow keyrate"
  (interactive)
  (my-set-keyrate 250 25)
  (message "Slow keyrate installed"))


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; Linux_keyrate_start.el ends here
