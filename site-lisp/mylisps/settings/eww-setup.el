;;; eww-setup.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/09/13 22:16:43 (+0900)
;; Last-Updated:2015/10/18 00:34:51 (+0900)
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
  (require 'use-package "use-package" 'noerr))

(use-package eww
  ;; :disabled
  :defer
  :commands
  (eww-search-words)
  :init
  :config
  (message "Loading \"eww\"")
  ;; (default-view-bind-set eww-mode-map)
  (require 't1-bind-key "t1-bind-key" 'noerr)
  (common-view-map-bind-keys eww-mode-map)
  (custom-set-variables
   '(eww-search-prefix
     "http://www.google.com/search?num=30&hl=en&ie=utf-8&oe=utf-8&q=")
   '(eww-bookmarks-directory
     (file-name-as-directory (my-var-dir-join "eww_bookmarks"))))
  (bind-keys :map eww-mode-map
             ("S" . eww-search-words)
             ("-" . my-forward-seq)
             ([(control -)] . my-forward-seq)
             ("\d" . eww-back-url)
             ([backspace] . eww-back-url)
             ("@" . eww-buffer-kill)
             ("q" . eww-buffer-kill)
             ("r" . eww-reload)
             ("H" . eww-history-browse)
             )
  (add-hook 'eww-mode-hook 'eww-mode-hook--disable-image)
  (advice-add 'shr-colorize-region :around 'shr-colorize-region--disable)
  (advice-add 'eww-colorize-region :around 'shr-colorize-region--disable)
  )


(defvar eww-disable-colorize t)
(defun shr-colorize-region--disable (orig start end fg &optional bg &rest _)
  (unless eww-disable-colorize
    (funcall orig start end fg)))

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

;; multi open
;; (defun eww-mode-hook--rename-buffer ()
;;   "Rename eww browser's buffer so sites open in new page."
;;   (rename-buffer "eww" t))
;; (add-hook 'eww-mode-hook 'eww-mode-hook--rename-buffer)



(provide 'eww-setup)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; eww-setup.el ends here
