;;; 56-biz-mode-setup.el --- for biz mode setup
;;
;; Copyright (C) 2017 Atami
;;
;; Author: Atami
;; Maintainer:
;; Version:
;; Created: 2017/12/31 16:57:09 (+0900)
;; Last-Updated:2018/01/14 01:06:10 (+0900)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;  ===========
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;  ===========
;;
;;
;;; Code:


(eval-when-compile
  (require 'use-package "use-package" 'noerr))

(use-package biz-mode
  ;; :disabled
  :defer
  :mode (("\\.crs\\'" . biz-mode))
  :init
  (message "Loading \"biz\"")
  (require 'biz-mode "biz-mode" 'noerr)
  (add-hook 'biz-mode-hook 'yas/minor-mode 'append)
  (add-hook 'biz-mode-hook 'auto-complete-mode 'append)
  (add-hook 'biz-mode-hook 'auto-highlight-symbol-mode 'append)
  )



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 56-biz-mode-setup.el ends here
