;;; flymake_plugin_start.el --- setting for flymake
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 05:43:07 (+0900)
;; Last-Updated: 2015/09/14 23:28:44 (+0900)
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
;; 2013/11/02    Atami
;;    initialize
;;
;;
;;; Code:


;;;###autoload
(defun flymake-mode-custom-predefine ()
  "For `eval-after-load' flymake customize."
  (message "eval-after-load: \"flymake\" customizing..")
  (custom-set-variables
   '(flymake-no-changes-timeout 1)
   '(flymake-gui-warnings-enabled nil))
  )

;;;###autoload
(defun flymake-mode-predefine ()
  "For `eval-after-load' flymake function."
  (message "eval-after-load: \"flymake\" setting..")
  (load "flymake-patch" 'noerr)
  (setcar (cdr (assq 'flymake-mode minor-mode-alist)) " fly")
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init))
  )

;;;###autoload
(defun flymake-mode-map-predefine ()
  "For flymake key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"flymake\" keymaping.."))
  )

;;;###autoload
(defun flymake-mode-face-predefine ()
  "For flymake face."
  (message "eval-after-load: \"flymake\" Setting faces..")
  (defface flymake-message-face
    '((((class color) (background light)) (:foreground "#b2dfff"))
      (((class color) (background dark))  (:foreground "#b2dfff")))
    "Flymake message face")
  )

;;;###autoload
(defun flymake-pyflakes-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
    (list "pyflakes" (list local-file))))



(provide 'flymake_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; flymake_plugin_start.el ends here
