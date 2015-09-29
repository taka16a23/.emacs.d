;;; woman_mode_start.el --- functions for man, woman
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 19:30:30 2012 (+0900)
;; Last-Updated: 2013/11/01 15:54:02 (+0900)
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
;; 2012/12/10    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'subroutines nil 'noerror)
  (require 'woman))

;;;###autoload
(defun woman-mode-custom-predefine ()
  "For `eval-after-load' woman customize."
  (message "eval-after-load: \"woman\" customizing..")
  (custom-set-variables
   '(woman-use-own-frame nil)
   ;; refresh "C-u woman"
   '(woman-cache-filename (concat my-var-dir "woman_cache.el"))
   ))

;;;###autoload
(defun woman-mode-predefine ()
  "For `eval-after-load' woman function."
  (message "eval-after-load: \"woman\" setting..")
  )

;;;###autoload
(defun woman-mode-map-predefine ()
  "For woman key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"woman\" keymaping.."))
  (default-view-bind-set woman-mode-map))



(provide 'woman_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; woman_mode_start.el ends here
