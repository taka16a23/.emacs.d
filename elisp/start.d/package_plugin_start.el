;;; package_plugin_start.el ---
;;
;; Copyright (C) 2015 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2015/10/04 17:18:21 (+0900)
;; Last-Updated: 2015/10/04 17:26:49 (+0900)
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


;;;###autoload
(defun package-mode-custom-predefine ()
  "For `eval-after-load' package customize."
  (message "eval-after-load: \"package\" customizing..")
  (custom-set-variables
   '(package-archives '(("melpa" . "http://melpa.org/packages/")
                       ("melpa-stable" . "http://stable.melpa.org/packages/")
                       ("org" . "http://orgmode.org/elpa/")
                       )))
  )

;;;###autoload
(defun package-mode-predefine ()
  "For `eval-after-load' package function."
  (message "eval-after-load: \"package\" setting..")
  )

;;;###autoload
(defun package-mode-map-predefine ()
  "For package key bindings."
  (interactive)
  (unless (called-interactively-p 'interactive)
    (message "eval-after-load: \"package\" keymaping.."))
  )

;;;###autoload
(defun package-mode-face-predefine ()
  "For package face."
  (message "eval-after-load: \"package\" Setting faces..")
  )


(defadvice package--ensure-init-file
    (around inhibit-read-only-package--ensure-init-file activate)
  (let ((inhibit-read-only t))
    ad-do-it
    ))

;; (progn (ad-disable-advice 'package--ensure-init-file 'around 'inhibit-read-only-package--ensure-init-file) (ad-update 'package--ensure-init-file))

;; (require 'package)
;; (package-initialize)

;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; MELPA-stableを追加
;; (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; Marmaladeを追加
;; (add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; Orgを追加
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)



(provide 'package_plugin_start)
;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; package_plugin_start.el ends here
