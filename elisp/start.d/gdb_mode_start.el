;;; gdb_mode_start.el --- setting for gdb mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/10/27 01:29:51 (+0900)
;; Last-Updated: 2013/11/02 02:11:41 (+0900)
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
;; 2013/10/27    Atami
;;    initialize
;;
;;
;;; Code:


(eval-when-compile
  (require 't1macro "t1macro" 'noerr)
  (require 'gud "gud" 'noerr)
  (defvar gdb-use-separate-io-buffer)
  (defvar gdb-many-windows))


;;;###autoload
(defun gud-mode-custom-predefine ()
  "For `eval-after-load' gud customize."
  (message "eval-after-load: \"gud\" customizing..")
  ;; (custom-set-variables
  ;; '())
  )

;;;###autoload
(defun gud-mode-predefine ()
  "For `eval-after-load' gud function."
  (message "eval-after-load: \"gud\" setting..")
  (add-hook 'gud-mode-hook 'gud-mode-hook-predefine)
  (setq gdb-use-separate-io-buffer t
		gdb-many-windows t)
  )

;;;###autoload
(defun gud-mode-map-predefine ()
  "For gud key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"gud\" keymaping.."))
  (define-many-keys gud-mode-map
	("\M-n" 'gud-next)
	("\M-s" 'gud-step)
	("\M-u" 'gud-until)
	("\M-f" 'gud-finish)))

;;;###autoload
(defun gud-mode-hook-predefine ()
  "GUD mode hook predefine."
  (gud-tooltip-mode 1))


(provide 'gdb_mode_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; gdb_mode_start.el ends here
