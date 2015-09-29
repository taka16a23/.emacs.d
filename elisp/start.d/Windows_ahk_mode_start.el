;;; Windows_ahk_mode_start.el --- autohotkey syntax highlight for windows
;;
;; Copyright (C) 2012 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      Sun Dec  9 18:28:51 2012 (+0900)
;; Last-Updated: 2013/03/09 15:48:58 (+0900)
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
;; 2012/12/09    Atami
;;    Created this header.
;;
;;
;;; Code:


(eval-when-compile
  (require 'ahk-mode))

(eval-after-load 'ahk-mode '(ahk-mode-predefine))
(add-hook 'ahk-mode-hook 'ahk-mode-hook-predefine)

(defun ahk-mode-hook-predefine ()
  (global-auto-complete-mode 1)
  )

(defun ahk-mode-predefine ()
  "For `eval-after-load' ahk-mode function."
  (message "Loading ahk-mode..")
  (ahk-mode-map-predefine)
  (setq ahk-syntax-directory (concat my-data-dir "ahk/Syntax/"))
  )

(defun ahk-mode-map-predefine ()
  "For ahk-mode key bindings."
  (interactive)
  (define-key ahk-mode-map "%" (smartchr '("%`!!'%" "%")))
  (define-key ahk-mode-map "\C-m" 'reindent-then-newline-and-indent)
  )


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; Windows_ahk_mode_start.el ends here
