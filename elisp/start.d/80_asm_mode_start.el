;;; 80_asm_mode_start.el --- setting for asm mode
;;
;; Copyright (C) 2013 Atami
;;
;; Author:       Atami
;; Maintainer:   Atami
;; Version:      1.0
;; Created:      2013/11/02 21:49:15 (+0900)
;; Last-Updated: 2013/11/02 21:52:05 (+0900)
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


(eval-when-compile
  (require 't1macro "t1macro"))


(defvar asm-mode-eval-after-load-hook nil
  "Hook for `asm-mode' `eval-after-load'.")
(add-hook 'asm-mode-eval-after-load-hook 'asm-mode-mode-custom-predefine)
(add-hook 'asm-mode-eval-after-load-hook 'asm-mode-mode-predefine 'append)
(add-hook 'asm-mode-eval-after-load-hook 'asm-mode-mode-map-predefine 'append)
(add-hook 'asm-mode-eval-after-load-hook 'asm-mode-mode-face-predefine 'append)
(run-hooks-after-load "asm-mode" 'asm-mode-eval-after-load-hook)


;; For Emacs
;; Local Variables:
;; coding: utf-8
;; End:
;;; 80_asm_mode_start.el ends here
