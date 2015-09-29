;;; javascript_mode_start.el --- functions for javascript mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 19:55:50 2012 (+0900)
;; Last-Updated: 2013/11/02 02:54:54 (+0900)
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


;;;###autoload
(defun javascript-mode-custom-predefine ()
  "For `eval-after-load' javascript customize."
  (message "eval-after-load: \"javascript\" customizing..")
  (custom-set-variables
   '(js-indent-level 4))
  )

;;;###autoload
(defun javascript-mode-predefine ()
  "For `eval-after-load' javascript function."
  (message "eval-after-load: \"javascript\" setting..")
  )

;;;###autoload
(defun javascript-mode-map-predefine ()
  "For javascript key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"javascript\" keymaping.."))
  )



(provide 'javascript_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; javascript_mode_start.el ends here
