;;; pylookup_plugin_start.el --- functions for pylookup
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Fri Dec 28 18:19:29 2012 (+0900)
;; Last-Updated: 2013/11/26 08:54:10 (+0900)
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
;; 2012/12/28    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (load "pylookup" 'noerr)
  (load "subroutines_start" 'noerr)
  (defvar my-pylib-dir))

;;;###
(defun pylookup-mode-custom-predefine ()
  "For `eval-after-load' pylookup customize."
  (message "eval-after-load: \"pylookup\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun pylookup-mode-predefine ()
  "For `eval-after-load' pylookup function."
  (message "eval-after-load: \"pylookup\" setting..")
  (setq pylookup-program (concat my-pylib-dir "/pylookup.py")
        pylookup-db-file (concat my-var-dir  "pylookup.db")))

;;;###
(defun pylookup-mode-map-predefine ()
  "For pylookup key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"pylookup\" keymaping.."))
  )

;;;###
(defun pylookup-mode-face-predefine ()
  "For pylookup face."
  (message "eval-after-load: \"pylookup\" Setting faces..")
  )



(provide 'pylookup_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; pylookup_plugin_start.el ends here
