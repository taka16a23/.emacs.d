;;; 70_eww_mode_start.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/09/13 22:16:43 (+0900)
;; Last-Updated: 2015/09/13 23:12:22 (+0900)
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

;;;###autoload
(defun eww-mode-custom-predefine ()
  "For `eval-after-load' eww customize."
  (message "eval-after-load: \"eww\" customizing..")
  (custom-set-variables
   '(eww-search-prefix "http://www.google.com/search?num=30&hl=en&ie=utf-8&oe=utf-8&q=")
   '(eww-bookmarks-directory (file-name-as-directory (concat my-var-dir "eww_bookmarks"))))
  )

;;;###autoload
(defun eww-mode-predefine ()
  "For `eval-after-load' eww function."
  (message "eval-after-load: \"eww\" setting..")
  )

;;;###autoload
(defun eww-mode-map-predefine ()
  "For eww key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"eww\" keymaping.."))
  (default-view-bind-set eww-mode-map)
  (define-many-keys eww-mode-map
    ("S"    'eww-search-words)
    ("-"    'my-forward-seq)
    ([(control -)] 'my-forward-seq)
    ("\d" 'eww-back-url)
    ([backspace] 'eww-back-url)
    ("@" 'eww-buffer-kill)
    ("q" 'eww-buffer-kill)
    ("r" 'eww-reload)
    ("H" 'eww-history-browse)
    )
  )

;;;###autoload
(defun eww-mode-face-predefine ()
  "For eww face."
  (message "eval-after-load: \"eww\" Setting faces..")
  )

(defvar eww-eval-after-load-hook nil
  "Hook for eww `eval-after-load'.")
(add-hook 'eww-eval-after-load-hook 'eww-mode-custom-predefine)
(add-hook 'eww-eval-after-load-hook 'eww-mode-predefine 'append)
(add-hook 'eww-eval-after-load-hook 'eww-mode-map-predefine 'append)
(add-hook 'eww-eval-after-load-hook 'eww-mode-face-predefine 'append)
(run-hooks-after-load "eww" 'eww-eval-after-load-hook)


(defvar eww-disable-colorize t)
(defun shr-colorize-region--disable (orig start end fg &optional bg &rest _)
  (unless eww-disable-colorize
    (funcall orig start end fg)))
(advice-add 'shr-colorize-region :around 'shr-colorize-region--disable)
(advice-add 'eww-colorize-region :around 'shr-colorize-region--disable)

(defun eww-disable-color ()
  "eww で文字色を反映させない"
  (interactive)
  (setq-local eww-disable-colorize t)
  (eww-reload))
(defun eww-enable-color ()
  "eww で文字色を反映させる"
  (interactive)
  (setq-local eww-disable-colorize nil)
  (eww-reload))

(defun eww-disable-images ()
  "eww で画像表示させない"
  (interactive)
  (setq-local shr-put-image-function 'shr-put-image-alt)
  (eww-reload))

(defun eww-enable-images ()
  "eww で画像表示させる"
  (interactive)
  (setq-local shr-put-image-function 'shr-put-image)
  (eww-reload))
(defun shr-put-image-alt (spec alt &optional flags)
  (insert alt))

;; はじめから非表示
(defun eww-mode-hook--disable-image ()
  (setq-local shr-put-image-function 'shr-put-image-alt))
(add-hook 'eww-mode-hook 'eww-mode-hook--disable-image)

;; multi open
;; (defun eww-mode-hook--rename-buffer ()
;;   "Rename eww browser's buffer so sites open in new page."
;;   (rename-buffer "eww" t))
;; (add-hook 'eww-mode-hook 'eww-mode-hook--rename-buffer)



;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 70_eww_mode_start.el ends here
