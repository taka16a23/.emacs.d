;;; view_mode_start.el --- functions for view mode
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Mon Dec 10 19:23:22 2012 (+0900)
;; Last-Updated: 2013/11/29 02:40:34 (+0900)
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
;; 2013/03/07    Atami
;;    fixed: `turn-on-view-mode'
;;    for disable view-mode after auto-insert command
;;
;; 2012/12/10    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 'view "view" 'noerr)
  (require 'viewer "viewer" 'noerr)
  (require 'subroutines_start "subroutines_start" 'noerr))

;;;###autoload
(defun view-mode-custom-predefine ()
  "For `eval-after-load' view customize."
  (message "eval-after-load: \"view\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun view-mode-predefine ()
  "For `eval-after-load' view function."
  (message "eval-after-load: \"view\" setting..")
  ;; Modeline's name
  (setcar (cdr (assq 'view-mode minor-mode-alist)) "")
  )

;;;###autoload
(defun view-mode-map-predefine ()
  "For view key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"view\" keymaping.."))
  (default-view-bind-set view-mode-map))

;;;###autoload
(defsubst turn-on-view-mode ()
  (interactive)
  ;; for auto-insert
  (unless (eq last-command 'self-insert-command)
    (view-mode 1)))

;;;###autoload
(defsubst turn-off-view-mode ()
  (interactive)
  (view-mode -1))

;;;; viewer.el
;;
;;;###autoload
(defun viewer-mode-custom-predefine ()
  "For `eval-after-load' viewer customize."
  (message "eval-after-load: \"viewer\" customizing..")
  (custom-set-variables
   '(viewer-modeline-color-view "DeepPink")
   '(view-mode-by-default-regexp ".*") ;all file
   )
  )

;;;###autoload
(defun viewer-mode-predefine ()
  "For `eval-after-load' viewer function."
  (message "eval-after-load: \"viewer\" setting..")
  (setq viewer-modeline-color-default "chartreuse1")
  ;; (setq viewer-modeline-color-default "DodgerBlue3")
  (viewer-change-modeline-color-advice view-mode)
  (defadvice view-mode-by-default-setup
    (around view-mode-by-default-setup+ activate)
    (unless (string-match "\\(\\.png$\\|\\.jpg$\\|\\.jpeg$\\)" buffer-file-name)
      ad-do-it
      ))
  )

;;;###autoload
(defun viewer-mode-map-predefine ()
  "For viewer key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"viewer\" keymaping.."))
  )

;;;###autoload
(defun viewer-mode-face-predefine ()
  "For viewer face."
  (message "eval-after-load: \"viewer\" Setting faces..")
  )



(provide 'view_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; view_mode_start.el ends here
