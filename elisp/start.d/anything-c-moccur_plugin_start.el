;;; anything-c-moccur_plugin_start.el --- functions for anything-c-moccur
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 11 15:46:34 2012 (+0900)
;; Last-Updated: 2013/11/01 17:14:51 (+0900)
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
;; 2012/12/11    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (defvar anything-c-moccur-anything-map)
  (require 'anything-c-moccur "anything-c-moccur" 'noerr))

;;;###autoload
(defun anything-c-moccur-mode-custom-predefine ()
  "For `eval-after-load' anything-c-moccur customize."
  (message "eval-after-load: \"anything-c-moccur\" customizing..")
  (custom-set-variables
   '(moccur-split-word t)
   '(anything-c-moccur-anything-idle-delay 0.3)
   '(anything-c-moccur-higligt-info-line-flag t)
   '(anything-c-moccur-enable-auto-look-flag  t)
   '(anything-c-moccur-enable-initial-pattern t))
  )

;;;###autoload
(defun anything-c-moccur-mode-predefine ()
  "For `eval-after-load' anything-c-moccur function."
  (message "eval-after-load: \"anything-c-moccur\" setting..")
  )

;;;###autoload
(defun anything-c-moccur-mode-map-predefine ()
  "For anything-c-moccur key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"anything-c-moccur\" keymaping.."))
  (define-key anything-c-moccur-anything-map "\C-k"
    'anything-c-moccur-previous-line))



(provide 'anything-c-moccur_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; anything-c-moccur_plugin_start.el ends here
