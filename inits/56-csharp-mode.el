;;; 56-csharp-mode.el --- for csharp mode
;;
;; Copyright (C) 2018 Atami
;;
;; Author: Atami
;; Maintainer: Atami
;; Version: 1.0.0
;; Created: 2018/01/14 01:07:00 (+0900)
;; Last-Updated:2018/01/14 01:09:28 (+0900)
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

(use-package csharp-mode
  ;; :disabled
  :defer
  :mode (("\\.cs\\'" . csharp-mode))
  :init
  (message "Loading \"csharp mode\"")
  (require 'csharp-mode "csharp-mode" 'noerr)
  (add-hook 'csharp-mode-hook 'yas/minor-mode 'append)
  (add-hook 'csharp-mode-hook 'auto-complete-mode 'append)
  (add-hook 'csharp-mode-hook 'auto-highlight-symbol-mode 'append)
  )




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 56-csharp-mode.el ends here
