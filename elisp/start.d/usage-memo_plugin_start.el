;;; usage-memo_plugin_start.el --- setting for usage memo
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 00:47:52 (+0900)
;; Last-Updated: 2013/11/02 00:51:19 (+0900)
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
;;
;;; Code:


(eval-when-compile
  (defvar umemo-base-directory)
  (require 'usage-memo "usage-memo" 'noerr))

;;;###autoload
(defun usage-memo-mode-custom-predefine ()
  "For `eval-after-load' usage-memo customize."
  (message "eval-after-load: \"usage-memo\" customizing..")
  ;; (custom-set-variables
  ;; '())
  (setq umemo-base-directory (concat my-data-dir "code/umemo"))
  )

;;;###autoload
(defun usage-memo-mode-predefine ()
  "For `eval-after-load' usage-memo function."
  (message "eval-after-load: \"usage-memo\" setting..")
  )

;;;###autoload
(defun usage-memo-mode-map-predefine ()
  "For usage-memo key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"usage-memo\" keymaping.."))
  (define-key usage-memo-mode-map "\C-s" 'umemo-save))



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; usage-memo_plugin_start.el ends here
