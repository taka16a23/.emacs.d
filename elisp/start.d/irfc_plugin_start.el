;;; irfc_plugin_start.el --- functions for irfc
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Tue Dec 18 03:23:13 2012 (+0900)
;; Last-Updated: 2013/11/02 00:32:00 (+0900)
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
;; 2012/12/18    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'subroutines_start))

;;;###autoload
(defun irfc-mode-custom-predefine ()
  "For `eval-after-load' irfc customize."
  (message "eval-after-load: \"irfc\" customizing..")
  (custom-set-variables
   '(irfc-directory (concat my-data-dir "ref/rfc/"))
   '(irfc-assoc-mode t))
  )

;;;###autoload
(defun irfc-mode-predefine ()
  "For `eval-after-load' irfc function."
  (message "eval-after-load: \"irfc\" setting..")
  )

;;;###autoload
(defun irfc-mode-map-predefine ()
  "For irfc key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"irfc\" keymaping.."))
  (default-view-bind-set irfc-mode-map))



(provide 'irfc_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; irfc_plugin_start.el ends here
