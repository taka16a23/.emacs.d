;;; 10_el-get_plugin_start.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/09/19 21:14:41 (+0900)
;; Last-Updated: 2015/09/29 22:08:50 (+0900)
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
  (require 't1macro "t1macro"))

(setq el-get-dir (concat my-elisp-dir "el-got"))
(add-to-list 'load-path el-get-dir)

;;;###autoload
(defun el-get-mode-custom-predefine ()
  "For `eval-after-load' el-get customize."
  (message "eval-after-load: \"el-get\" customizing..")
  (custom-set-variables
   '(el-get-dir (concat my-elisp-dir "el-got"))
   '(el-get-status-file (concat (file-name-as-directory el-get-dir) ".status.el"))
   )
  )

;;;###autoload
(defun el-get-mode-predefine ()
  "For `eval-after-load' el-get function."
  (message "eval-after-load: \"el-get\" setting..")
  (defadvice el-get-update-autoloads
      (around inhibit-read-only-el-get-update-autoloads activate)
    (let ((inhibit-read-only t))
      ad-do-it
      ))
  ;; (progn (ad-disable-advice 'el-get-update-autoloads 'around 'inhibit-read-only-el-get-update-autoloads) (ad-update 'el-get-update-autoloads))

  )

;;;###autoload
(defun el-get-mode-map-predefine ()
  "For el-get key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"el-get\" keymaping.."))
  )


(defvar el-get-eval-after-load-hook nil
  "Hook for el-get `eval-after-load'.")
(add-hook 'el-get-eval-after-load-hook 'el-get-mode-custom-predefine)
(add-hook 'el-get-eval-after-load-hook 'el-get-mode-predefine 'append)
(add-hook 'el-get-eval-after-load-hook 'el-get-mode-map-predefine 'append)
(run-hooks-after-load "el-get" 'el-get-eval-after-load-hook)

(autoload 'el-get-bundle "el-get")
;; (require 'el-get "el-get" 'noerr)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 10_el-get_plugin_start.el ends here
