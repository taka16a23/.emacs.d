;;; edit-list_plugin_start.el --- functions for edit-list
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/01/27 22:12:33 (+0900)
;; Last-Updated: 2013/11/02 00:29:15 (+0900)
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
;; 2013/01/27    Atami
;;    initialize
;;
;;
;;; Code:


;;;###autoload
(defun edit-list-mode-custom-predefine ()
  "For `eval-after-load' edit-list customize."
  (message "eval-after-load: \"edit-list\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun edit-list-mode-predefine ()
  "For `eval-after-load' edit-list function."
  (message "eval-after-load: \"edit-list\" setting..")
  )

;;;###autoload
(defun edit-list-mode-map-predefine ()
  "For edit-list key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"edit-list\" keymaping.."))
  (define-key edit-list-mode-map "\C-s" 'edit-list-done))



(provide 'edit-list_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; edit-list_plugin_start.el ends here
